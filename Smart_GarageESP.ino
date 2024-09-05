//LAST esp updated sh8aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaal gdnnnnnnnnnnnnnnnnnnnn

#include <Wire.h>
#include <LiquidCrystal_I2C.h>
#include <Keypad.h>
#include <ESP32Servo.h> 
#include <WiFi.h>
#include <PubSubClient.h>
#include <WiFiClientSecure.h>

// Servo and sensor pins
#define ENTRY_SERVO_PIN 18
#define EXIT_SERVO_PIN 19
#define EXIT_IR_SENSOR_PIN 33

// IR sensor pins for the 4 slots		
const int irSensorPins[] = {25, 26, 32,  27}; // GPIO pins
const int numSensors = 4;

// Keypad settings
const byte ROWS = 4;
const byte COLS = 4;
char keys[ROWS][COLS] = {
  {'1', '2', '3', 'A'},
  {'4', '5', '6', 'B'},
  {'7', '8', '9', 'C'},
  {'*', '0', '#', 'D'}
};
byte rowPins[ROWS] = {12, 14, 13, 15}; // Keypad row pins
byte colPins[COLS] = {2, 4, 16, 17};   // Keypad column pins

Keypad keypad = Keypad(makeKeymap(keys), rowPins, colPins, ROWS, COLS);

// LCD setup
LiquidCrystal_I2C lcd(0x27, 16, 2);

// Servo objects
Servo entryServo;
Servo exitServo;

// Slot status array
bool slots[4] = {false, false, false, false}; // Initially, all slots are empty

// Password management
String password = "1234"; // Default password
String inputPassword = "";

// Timing variables
unsigned long lastReadTime = 0;
const unsigned long readInterval = 1000; // 1 second delay

// MQTT settings
const char* ssid = "ehab";
const char* wifiPassword = "ehab77777";
const char* mqttServer = "ba2f2af4644d4fb990991fedeca6cf08.s1.eu.hivemq.cloud";
const int mqttPort = 8883;
const char* mqttUser = "AdMEKH";
const char* mqttPassword = "AdMEKH123";

WiFiClientSecure espClient;
PubSubClient client(espClient);

// Function prototypes
void handleKeyPress(char key);
void openGarage();
void openExitGate();
void checkSlots();
void clearSlot();
void connectToWiFi();
void reconnectMQTT();

void setup() {
  Serial.begin(9600);
  
  // Wi-Fi and MQTT setup
  connectToWiFi();
  espClient.setInsecure(); // Skip certificate verification for testing
  client.setServer(mqttServer, mqttPort);
  
  // Servo setup
  entryServo.attach(ENTRY_SERVO_PIN);
  exitServo.attach(EXIT_SERVO_PIN);

  // Set all IR sensor pins as input
  for (int i = 0; i < numSensors; i++) {
    pinMode(irSensorPins[i], INPUT);
  }
  pinMode(EXIT_IR_SENSOR_PIN, INPUT);

  // LCD setup
  lcd.init();
  lcd.backlight();
  lcd.print("Enter Password:");
}

void loop() {
  // Check for a key press and handle password entry
  char key = keypad.getKey();
  if (key) {
    handleKeyPress(key);
  }

  // Check if a car is ready to exit
  if (digitalRead(EXIT_IR_SENSOR_PIN) == LOW) {
    openExitGate();
  }

  // Continuously check the slots with a delay
  unsigned long currentMillis = millis();
  if (currentMillis - lastReadTime >= readInterval) {
    lastReadTime = currentMillis; // Update last read time
    checkSlots();
  }

  // Handle MQTT connection and publishing
  if (!client.connected()) reconnectMQTT();
  client.loop();

  if (Serial.available()) {
    String sensorData = Serial.readStringUntil('\n');
    client.publish("sensor/readings", sensorData.c_str());
  }
}

void handleKeyPress(char key) {
  if (key == '#') {
    if (inputPassword == password) {
      lcd.clear();
      lcd.print("Access Granted");
      openGarage(); // Call to open the garage
    } else {
      lcd.clear();
      lcd.print("Wrong Password");
      delay(2000);
      lcd.clear();
      lcd.print("Enter Password:");
    }
    inputPassword = ""; // Reset input
  } else {
    inputPassword += key;
    lcd.setCursor(0, 1);
    lcd.print("Pass: ");
    lcd.print(inputPassword);
  }
}

void openGarage() {
  bool canOpenGate = false;

  // Check if any slot is available (i.e., not all slots are full)
  for (int i = 0; i < numSensors; i++) {
    if (slots[i] == false) {
      canOpenGate = true;
      break;
    }
  }

  if (canOpenGate) {
    lcd.clear();
    lcd.print("Access Granted");
    delay(1000); // Display the message for 1 second
    entryServo.write(90); // Open the entry gate
    delay(5000); // Wait for the car to enter
    entryServo.write(0); // Close the entry gate
  } else {
    lcd.clear();
    lcd.setCursor(0,0);
    lcd.print("Go To Garage B"); 
    delay(2000);
  }

  // Clear the LCD display after the gate operation
  lcd.clear();
  lcd.print("Enter Password:");
}

void openExitGate() {
  lcd.clear();
  lcd.print("Car Exiting");
  delay(1000);
  exitServo.write(90); // Open the exit gate
  delay(5000); // Wait for the car to exit
  exitServo.write(0); // Close the exit gate
  clearSlot(); // Clear slot after exit
  
  // Display "Enter Password:" after the car exits
  lcd.clear();
  lcd.print("Enter Password:");
}

void checkSlots() {
  String message = "";
  bool allSlotsFull = true;
  bool anySlotEmpty = false;

  for (int i = 0; i < numSensors; i++) {
    if (digitalRead(irSensorPins[i]) == LOW && !slots[i]) {
      slots[i] = true; // Mark the slot as occupied
    } else if (digitalRead(irSensorPins[i]) == HIGH && slots[i]) {
      slots[i] = false; // Mark the slot as empty
    }

    message += String(digitalRead(irSensorPins[i]));
    if (i < numSensors - 1) {
      message += ","; // Add a comma between values
    }

    // Check if all slots are full
    if (slots[i] == false) {
      allSlotsFull = false; // At least one slot is empty
    }

    // Check if at least one slot is available
    if (slots[i] == true) {
      anySlotEmpty = true; // At least one slot is available
    }
  }

  Serial.println(message); // Send the values to Serial Monitor

  // Display "Garage is full" if all slots are full
  if (allSlotsFull) {
    lcd.clear();
    lcd.setCursor(0,0);
    lcd.print("Garage is full");
    lcd.setCursor(1, 0);
    lcd.print("Go TO Garage B");
  }

  // Display "Enter Password" if at least one slot is available
  if (anySlotEmpty) {
    lcd.clear();
    lcd.print("Enter Password:");
  }
}

void clearSlot() {
  for (int i = 0; i < numSensors; i++) {
    if (slots[i]) {
      slots[i] = false;
      // Print status to Serial Monitor for debugging
      Serial.print("Slot ");
      Serial.print(i + 1);
      Serial.println(" cleared");
      return;
    }
  }
  // Print status to Serial Monitor for debugging
  Serial.println("No slots to clear");
}

void connectToWiFi() {
  WiFi.begin(ssid, wifiPassword);
  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
  }
  Serial.println();
}

void reconnectMQTT() {
  while (!client.connected()) {
    if (client.connect("ESP32Client", mqttUser, mqttPassword)) {
      // Successfully connected
    } else {
      delay(5000);
    }
  }
}








//wrong one 
/*
#include <Wire.h>
#include <LiquidCrystal_I2C.h>
#include <Keypad.h>
#include <ESP32Servo.h> 
#include <WiFi.h>
#include <PubSubClient.h>
#include <WiFiClientSecure.h>

// Servo and sensor pins
#define ENTRY_SERVO_PIN 18
#define EXIT_SERVO_PIN 19
#define EXIT_IR_SENSOR_PIN 33

// IR sensor pins for the 4 slots
const int irSensorPins[] = {25, 26, 32, 27}; // GPIO pins
const int numSensors = 4;

// Keypad settings
const byte ROWS = 4;
const byte COLS = 4;
char keys[ROWS][COLS] = {
  {'1', '2', '3', 'A'},
  {'4', '5', '6', 'B'},
  {'7', '8', '9', 'C'},
  {'*', '0', '#', 'D'}
};
byte rowPins[ROWS] = {12, 14, 13, 15}; // Keypad row pins
byte colPins[COLS] = {2, 4, 16, 17};   // Keypad column pins

Keypad keypad = Keypad(makeKeymap(keys), rowPins, colPins, ROWS, COLS);

// LCD setup
LiquidCrystal_I2C lcd(0x27, 16, 2);

// Servo objects
Servo entryServo;
Servo exitServo;

// Slot status array
bool slots[4] = {false, false, false, false}; // Initially, all slots are empty

// Password management
String password = "1234"; // Default password
String inputPassword = "";

// Timing variables
unsigned long lastReadTime = 0;
const unsigned long readInterval = 1000; // 1 second delay

// MQTT settings
const char* ssid = "ehab";
const char* wifiPassword = "ehab77777";
const char* mqttServer = "ba2f2af4644d4fb990991fedeca6cf08.s1.eu.hivemq.cloud";
const int mqttPort = 8883;
const char* mqttUser = "AdMEKH";
const char* mqttPassword = "AdMEKH123";

WiFiClientSecure espClient;
PubSubClient client(espClient);

// Function prototypes
void handleKeyPress(char key);
void openGarage();
void openExitGate();
void checkSlots();
void clearSlot();
void connectToWiFi();
void reconnectMQTT();

void setup() {
  Serial.begin(9600);
  
  // Wi-Fi and MQTT setup
  connectToWiFi();
  espClient.setInsecure(); // Skip certificate verification for testing
  client.setServer(mqttServer, mqttPort);
  
  // Servo setup
  entryServo.attach(ENTRY_SERVO_PIN);
  exitServo.attach(EXIT_SERVO_PIN);

  // Set all IR sensor pins as input
  for (int i = 0; i < numSensors; i++) {
    pinMode(irSensorPins[i], INPUT);
  }
  pinMode(EXIT_IR_SENSOR_PIN, INPUT);

  // LCD setup
  lcd.init();
  lcd.backlight();
  lcd.print("Enter Password:");
}

void loop() {
  // Check for a key press and handle password entry
  char key = keypad.getKey();
  if (key) {
    handleKeyPress(key);
  }

  // Check if a car is ready to exit
  if (digitalRead(EXIT_IR_SENSOR_PIN) == LOW) {
    openExitGate();
  }

  // Continuously check the slots with a delay
  unsigned long currentMillis = millis();
  if (currentMillis - lastReadTime >= readInterval) {
    lastReadTime = currentMillis; // Update last read time
    checkSlots();
  }

  // Handle MQTT connection and publishing
  if (!client.connected()) reconnectMQTT();
  client.loop();

  // Read sensor data from Serial and publish to MQTT
  while (Serial.available()) {
    String sensorData = Serial.readStringUntil('\n');
    
    // Split the incoming data by commas and publish each sensor reading
    int startIndex = 0;
    int endIndex = sensorData.indexOf(',');
    while (endIndex != -1) {
      String token = sensorData.substring(startIndex, endIndex);
      int colonIndex = token.indexOf(':');
      if (colonIndex != -1) {
        String topic = token.substring(0, colonIndex);
        String value = token.substring(colonIndex + 1);
        
        if (topic == "MQ2") {
          client.publish("sensor/mq2", value.c_str());
        } else if (topic == "FLAME") {
          client.publish("sensor/flame", value.c_str());
        } else if (topic == "TEMP") {
          client.publish("sensor/temperature", value.c_str());
        } else if (topic == "HUM") {
          client.publish("sensor/humidity", value.c_str());
        } else if (topic == "DIST") {
          client.publish("sensor/distance", value.c_str());
        } else if (topic == "LDR") {
          client.publish("sensor/ldr", value.c_str());
        }
      }
      
      startIndex = endIndex + 1;
      endIndex = sensorData.indexOf(',', startIndex);
    }
  }
}

void handleKeyPress(char key) {
  if (key == '#') {
    if (inputPassword == password) {
      lcd.clear();
      lcd.print("Access Granted");
      openGarage(); // Call to open the garage
    } else {
      lcd.clear();
      lcd.print("Wrong Password");
      delay(2000);
      lcd.clear();
      lcd.print("Enter Password:");
    }
    inputPassword = ""; // Reset input
  } else {
    inputPassword += key;
    lcd.setCursor(0, 1);
    lcd.print("Pass: ");
    lcd.print(inputPassword);
  }
}

void openGarage() {
  bool canOpenGate = false;

  // Check if any slot is available (i.e., not all slots are full)
  for (int i = 0; i < numSensors; i++) {
    if (slots[i] == false) {
      canOpenGate = true;
      break;
    }
  }

  if (canOpenGate) {
    lcd.clear();
    lcd.print("Access Granted");
    delay(1000); // Display the message for 1 second
    entryServo.write(90); // Open the entry gate
    delay(5000); // Wait for the car to enter
    entryServo.write(0); // Close the entry gate
  } else {
    lcd.clear();
    lcd.setCursor(0,0);
    lcd.print("Go To Garage B"); 
    delay(2000);
  }

  // Clear the LCD display after the gate operation
  lcd.clear();
  lcd.print("Enter Password:");
}

void openExitGate() {
  lcd.clear();
  lcd.print("Car Exiting");
  delay(1000);
  exitServo.write(90); // Open the exit gate
  delay(5000); // Wait for the car to exit
  exitServo.write(0); // Close the exit gate
  clearSlot(); // Clear slot after exit
  
  // Display "Enter Password:" after the car exits
  lcd.clear();
  lcd.print("Enter Password:");
}

void checkSlots() {
  String message = "";
  bool allSlotsFull = true;
  bool anySlotEmpty = false;

  for (int i = 0; i < numSensors; i++) {
    if (digitalRead(irSensorPins[i]) == LOW && !slots[i]) {
      slots[i] = true; // Mark the slot as occupied
    } else if (digitalRead(irSensorPins[i]) == HIGH && slots[i]) {
      slots[i] = false; // Mark the slot as empty
    }

    message += String(digitalRead(irSensorPins[i]));
    if (i < numSensors - 1) {
      message += ","; // Add a comma between values
    }

    // Check if all slots are full
    if (slots[i] == false) {
      allSlotsFull = false; // At least one slot is empty
    }

    // Check if at least one slot is available
    if (slots[i] == true) {
      anySlotEmpty = true; // At least one slot is available
    }
  }

  Serial.println(message); // Send the values to Serial Monitor

  // Display "Garage is full" if all slots are full
  if (allSlotsFull) {
    lcd.clear();
    lcd.setCursor(0,0);
    lcd.print("Garage is full");
    lcd.setCursor(1, 0);
    lcd.print("Go TO Garage B");
  }

  // Display "Enter Password" if at least one slot is available
  if (anySlotEmpty) {
    lcd.clear();
    lcd.print("Enter Password:");
  }
}

void clearSlot() {
  for (int i = 0; i < numSensors; i++) {
    if (slots[i]) {
      slots[i] = false;
      // Print status to Serial Monitor for debugging
      Serial.print("Slot ");
      Serial.print(i + 1);
      Serial.println(" cleared");
      return;
    }
  }
  // Print status to Serial Monitor for debugging
  Serial.println("No slots to clear");
}

void connectToWiFi() {
  WiFi.begin(ssid, wifiPassword);
  // lcd.clear();
  // lcd.print("Connecting to WiFi...");
  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    // lcd.setCursor(0, 1);
    // lcd.print(".");
  }
  // lcd.clear();
  // lcd.print("Connected to WiFi");
  delay(1000); // Pause for a moment before continuing
}

void reconnectMQTT() {
  while (!client.connected()) {
    // lcd.clear();
    // lcd.print("Connecting to MQTT...");
    
    if (client.connect("ESP32Client", mqttUser, mqttPassword)) {
      // lcd.clear();
      // lcd.print("Connected to MQTT");
    } else {
      // lcd.clear();
      // lcd.print("MQTT Connect Failed");
      delay(5000);
    }
  }
}
*/