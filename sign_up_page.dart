import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'home_page.dart';

class SignUpPage extends StatefulWidget {
  final VoidCallback onToggleTheme;

  const SignUpPage({required this.onToggleTheme, Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _carPlateController = TextEditingController();
  final _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Smart Garage - Sign Up'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Container(
        decoration: const BoxDecoration(
          // image: DecorationImage(
          // image: AssetImage('assets/garage_background.jpg'),
          //   fit: BoxFit.cover,
          // ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: 'Name',
                    labelStyle: TextStyle(color: Theme.of(context).colorScheme.secondary),
                    border: const OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(color: Theme.of(context).colorScheme.secondary),
                    border: const OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(color: Theme.of(context).colorScheme.secondary),
                    border: const OutlineInputBorder(),
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _carPlateController,
                  decoration: InputDecoration(
                    labelText: 'Car Plate (ABC123)',
                    labelStyle: TextStyle(color: Theme.of(context).colorScheme.secondary),
                    border: const OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.text,
                  maxLength: 6,
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _phoneController,
                  decoration: InputDecoration(
                    labelText: 'Phone Number',
                    labelStyle: TextStyle(color: Theme.of(context).colorScheme.secondary),
                    border: const OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.phone,
                  maxLength: 11,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    final name = _nameController.text;
                    final email = _emailController.text;
                    final password = _passwordController.text;
                    final carPlate = _carPlateController.text;
                    final phone = _phoneController.text;

                    if (name.isEmpty || email.isEmpty || password.isEmpty || carPlate.isEmpty || phone.isEmpty) {
                      _showAlert(context, 'Please enter all required information.');
                    } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(email)) {
                      _showAlert(context, 'Please enter a valid email address.');
                    } else if (!RegExp(r'^[A-Z]{3}\d{3}$').hasMatch(carPlate)) {
                      _showAlert(context, 'Car plate must be in the format ABC123.');
                    } else if (phone.length != 11 || !RegExp(r'^\d{11}$').hasMatch(phone)) {
                      _showAlert(context, 'Please enter a valid 11-digit phone number.');
                    } else if (password.length < 8) {
                      _showAlert(context, 'Password must be at least 8 characters long.');
                    } else {
                      // Call the signUp function
                      await signUp(email, password, name, carPlate, phone);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(name: name, onToggleTheme: widget.onToggleTheme),
                        ),
                      );
                    }
                  },
                  child: const Text('Sign Up'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> signUp(String email, String password, String name, String carPlate, String phone) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Get the user ID
      String userId = userCredential.user?.uid ?? '';

      // Reference to Firestore
      CollectionReference users = FirebaseFirestore.instance.collection('users');

      // Save user data
      await users.doc(userId).set({
        'email': email,
        'name': name,
        'carPlate': carPlate,
        'phone': phone,
        'createdAt': FieldValue.serverTimestamp(),
      });

      print('User signed up and data saved to Firestore');
    } catch (e) {
      print('Error signing up: $e');
    }
  }

  void _showAlert(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Error'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}



