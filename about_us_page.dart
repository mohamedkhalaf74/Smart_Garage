// import 'package:flutter/material.dart';
//
// class AboutUsPage extends StatelessWidget {
//   const AboutUsPage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('About Us'),
//         backgroundColor: Theme.of(context).primaryColor,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Text(
//                 'About Smart Garage',
//                 style: TextStyle(
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               const SizedBox(height: 16),
//               const Text(
//                 'Welcome to Smart Garage!',
//                 style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               const SizedBox(height: 8),
//               const Text(
//                 'Our Smart Garage system offers advanced features for modern car parking and management. With a combination of IoT technologies and user-friendly interfaces, you can easily monitor and control your garage system. Features include real-time parking slot availability, automated gate control, and customizable settings to suit your needs.',
//               ),
//               const SizedBox(height: 16),
//               const Text(
//                 'Contact Us',
//                 style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               const SizedBox(height: 8),
//               const Text(
//                 'For any inquiries or support, please reach out to us at:',
//               ),
//               const SizedBox(height: 8),
//               const Text(
//                 'Email: support@smartgarage.com',
//               ),
//               const Text(
//                 'Phone: +123 456 7890',
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
//
//
//


import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  final VoidCallback onToggleTheme; // Add the onToggleTheme parameter

  const AboutUsPage({Key? key, required this.onToggleTheme}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
        backgroundColor: Theme.of(context).primaryColor,
        actions: [
          IconButton(
            icon: Icon(
              Theme.of(context).brightness == Brightness.dark
                  ? Icons.wb_sunny
                  : Icons.nights_stay,
            ),
            onPressed: onToggleTheme, // Use the onToggleTheme callback
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'About Smart Garage',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Welcome to Smart Garage!',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Our Smart Garage system offers advanced features for modern car parking and management. With a combination of IoT technologies and user-friendly interfaces, you can easily monitor and control your garage system. Features include real-time parking slot availability, automated gate control, and customizable settings to suit your needs.',
              ),
              const SizedBox(height: 16),
              const Text(
                'Contact Us',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'For any inquiries or support, please reach out to us at:',
              ),
              const SizedBox(height: 8),
              const Text(
                'Email: support@smartgarage.com',
              ),
              const Text(
                'Phone: +123 456 7890',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
