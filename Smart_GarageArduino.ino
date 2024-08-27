//ARDUINO CODE

#include <DHT.h>
#include <Wire.h> // For I2C communication
#include <LiquidCrystal_I2C.h> // For LCD display

#define FLAME_SENSOR_PIN 2
#define MQ2_SENSOR_PIN A0
#define BUZZER_PIN 3
#define DHT_PIN 4
#define TRIGGER_PIN 5
#define ECHO_PIN 6
#define LDR_PIN A1
#define LED_PIN 7

#define DHT_TYPE DHT11 

DHT dht(DHT_PIN, DHT_TYPE);
LiquidCrystal_I2C lcd(0x27, 16, 2);

void setup() {
  Serial.begin(9600);
  dht.begin();

  pinMode(FLAME_SENSOR_PIN, INPUT);
  pinMode(MQ2_SENSOR_PIN, INPUT);
  pinMode(TRIGGER_PIN, OUTPUT);
  pinMode(ECHO_PIN, INPUT);
  pinMode(LDR_PIN, INPUT);
  pinMode(LED_PIN, OUTPUT);
  pinMode(BUZZER_PIN, OUTPUT);

  lcd.init();
  lcd.backlight();
}

void loop() {
  int flameValue = digitalRead(FLAME_SENSOR_PIN);
  int mq2Value = analogRead(MQ2_SENSOR_PIN);
  float temperature = dht.readTemperature();
  float humidity = dht.readHumidity();
  
  long duration, distance;
  digitalWrite(TRIGGER_PIN, LOW);
  delayMicroseconds(2);
  digitalWrite(TRIGGER_PIN, HIGH);
  delayMicroseconds(10);
  digitalWrite(TRIGGER_PIN, LOW);
  duration = pulseIn(ECHO_PIN, HIGH);
  distance = (duration / 2) * 0.0344;

  int ldrValue = analogRead(LDR_PIN);

  Serial.print("Flame:");
  Serial.print(flameValue);
  Serial.print(",MQ2:");
  Serial.print(mq2Value);
  Serial.print(",Temp:");
  Serial.print(temperature);
  Serial.print(",Hum:");
  Serial.print(humidity);
  Serial.print(",Dist:");
  Serial.print(distance);
  Serial.print(",LDR:");
  Serial.println(ldrValue);

  if (Serial.available()) {
    String message = Serial.readStringUntil('\n'); 
    int startIndex = 0;
    int endIndex = message.indexOf(',');

    lcd.clear(); 

    lcd.setCursor(0, 0); 
    lcd.print("P1: ");
    lcd.print(message.substring(startIndex, endIndex));

    startIndex = endIndex + 1;
    endIndex = message.indexOf(',', startIndex);
    lcd.setCursor(8, 0);
    lcd.print("P2: ");
    lcd.print(message.substring(startIndex, endIndex));

    startIndex = endIndex + 1;
    endIndex = message.indexOf(',', startIndex);
    lcd.setCursor(0, 1);
    lcd.print("P3: ");
    lcd.print(message.substring(startIndex, endIndex));

    startIndex = endIndex + 1;
    lcd.setCursor(8, 1);
    lcd.print("P4: ");
    lcd.print(message.substring(',', startIndex));
  }

  // Control the buzzer with different tones
  if (flameValue == 0) {
    tone(BUZZER_PIN, 4000); // Set buzzer to 1kHz for flame detection
  } else if (mq2Value > 300) {
    tone(BUZZER_PIN, 494, 500); // Set buzzer to 2kHz for gas detection
  } else if (distance < 20) {
    tone(BUZZER_PIN, 523, 300); // Set buzzer to 1.5kHz for proximity alert
  } else {
    noTone(BUZZER_PIN); // Turn off the buzzer if no alert
  }

  if (ldrValue < 100) {
    digitalWrite(LED_PIN, HIGH);
  } else {
    digitalWrite(LED_PIN, LOW);
  }

  delay(500);
}