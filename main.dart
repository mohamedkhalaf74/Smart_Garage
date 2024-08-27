import 'package:flutter/material.dart';
import 'login_page.dart'; // Update with the correct import
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isDarkTheme = false;

  void _toggleTheme() {
    setState(() {
      _isDarkTheme = !_isDarkTheme;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _isDarkTheme
          ? ThemeData.dark().copyWith(
        primaryColor: Colors.teal,
        scaffoldBackgroundColor: Colors.grey[900],
        colorScheme: ColorScheme.dark(
          secondary: Colors.tealAccent,
        ),
        buttonTheme: ButtonThemeData(buttonColor: Colors.tealAccent),
        textTheme: TextTheme(
          bodyLarge: TextStyle(fontFamily: 'Roboto', color: Colors.white),
          bodyMedium: TextStyle(fontFamily: 'Roboto', color: Colors.white70),
        ),
      )
          : ThemeData.light().copyWith(
        primaryColor: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.light(
          secondary: Colors.blueAccent,
        ),
        buttonTheme: ButtonThemeData(buttonColor: Colors.blueAccent),
        textTheme: TextTheme(
          bodyLarge: TextStyle(fontFamily: 'Roboto', color: Colors.black),
          bodyMedium: TextStyle(fontFamily: 'Roboto', color: Colors.black54),
        ),
      ),
      home: LoginPage(onToggleTheme: _toggleTheme),
    );
  }
}
