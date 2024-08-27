// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'home_page.dart';
// import 'sign_up_page.dart'; // Update with the correct import
//
// class LoginPage extends StatefulWidget {
//   final VoidCallback onToggleTheme;
//
//   LoginPage({required this.onToggleTheme});
//
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }
//
// class _LoginPageState extends State<LoginPage> {
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Smart Garage - Sign In'),
//         backgroundColor: Theme.of(context).primaryColor,
//         actions: [
//           IconButton(
//             icon: Icon(
//               Theme.of(context).brightness == Brightness.dark
//                   ? Icons.wb_sunny
//                   : Icons.nights_stay,
//             ), // Dynamically change icon based on the theme
//             onPressed: widget.onToggleTheme,
//           ),
//         ],
//       ),
//       body: Container(
//         decoration: BoxDecoration(
//           color: Theme.of(context).scaffoldBackgroundColor,
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: SingleChildScrollView(
//             child: Column(
//               children: [
//                 TextField(
//                   controller: _emailController,
//                   decoration: InputDecoration(
//                     labelText: 'Email',
//                     labelStyle: TextStyle(color: Theme.of(context).colorScheme.secondary),
//                     border: OutlineInputBorder(),
//                   ),
//                   keyboardType: TextInputType.emailAddress,
//                 ),
//                 const SizedBox(height: 16),
//                 TextField(
//                   controller: _passwordController,
//                   decoration: InputDecoration(
//                     labelText: 'Password',
//                     labelStyle: TextStyle(color: Theme.of(context).colorScheme.secondary),
//                     border: OutlineInputBorder(),
//                   ),
//                   obscureText: true,
//                 ),
//                 const SizedBox(height: 20),
//                 ElevatedButton(
//                   onPressed: () async {
//                     final email = _emailController.text;
//                     final password = _passwordController.text;
//
//                     if (email.isEmpty || password.isEmpty) {
//                       _showAlert(context, 'Please enter all required information.');
//                     } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(email)) {
//                       _showAlert(context, 'Please enter a valid email address.');
//                     } else if (password.length < 8) {
//                       _showAlert(context, 'Password must be at least 8 characters long.');
//                     } else {
//                       try {
//                         UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
//                           email: email,
//                           password: password,
//                         );
//
//                         // Check if user exists in Firestore
//                         DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection('users').doc(userCredential.user?.uid).get();
//                         if (userDoc.exists) {
//                           final name = userDoc['name'] ?? 'User'; // Retrieve name from Firestore
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => HomePage(
//                                 name: name,
//                                 onToggleTheme: widget.onToggleTheme,
//                               ),
//                             ),
//                           );
//                         } else {
//                           _showAlert(context, 'User does not exist in the database.');
//                         }
//                       } catch (e) {
//                         _showAlert(context, 'Invalid email or password.');
//                       }
//                     }
//                   },
//                   child: const Text('Sign In'),
//                 ),
//                 const SizedBox(height: 16),
//                 TextButton(
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => SignUpPage(
//                           onToggleTheme: widget.onToggleTheme,
//                         ),
//                       ),
//                     );
//                   },
//                   child: const Text('Don\'t have an account? Sign Up'),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   void _showAlert(BuildContext context, String message) {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: const Text('Error'),
//         content: Text(message),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(context),
//             child: const Text('OK'),
//           ),
//         ],
//       ),
//     );
//   }
// }




import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'home_page.dart';
import 'sign_up_page.dart'; // Update with the correct import

class LoginPage extends StatefulWidget {
  final VoidCallback onToggleTheme;

  LoginPage({required this.onToggleTheme});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Smart Garage - Sign In'),
        backgroundColor: Theme.of(context).primaryColor,
        actions: [
          IconButton(
            icon: Icon(
              Theme.of(context).brightness == Brightness.dark
                  ? Icons.wb_sunny
                  : Icons.nights_stay,
            ),
            onPressed: widget.onToggleTheme,
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(color: Theme.of(context).colorScheme.secondary),
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(color: Theme.of(context).colorScheme.secondary),
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    final email = _emailController.text;
                    final password = _passwordController.text;

                    if (email.isEmpty || password.isEmpty) {
                      _showAlert(context, 'Please enter all required information.');
                    } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(email)) {
                      _showAlert(context, 'Please enter a valid email address.');
                    } else if (password.length < 8) {
                      _showAlert(context, 'Password must be at least 8 characters long.');
                    } else {
                      try {
                        UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                          email: email,
                          password: password,
                        );

                        // Check if user exists in Firestore
                        DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection('users').doc(userCredential.user?.uid).get();
                        if (userDoc.exists) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomePage(
                                name: userDoc['name'], // Fetch name from Firestore
                                onToggleTheme: widget.onToggleTheme,
                              ),
                            ),
                          );
                        } else {
                          _showAlert(context, 'User does not exist in the database.');
                        }
                      } catch (e) {
                        _showAlert(context, 'Invalid email or password.');
                      }
                    }
                  },
                  child: const Text('Sign In'),
                ),
                const SizedBox(height: 16),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignUpPage(
                          onToggleTheme: widget.onToggleTheme,
                        ),
                      ),
                    );
                  },
                  child: const Text('Don\'t have an account? Sign Up'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
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

