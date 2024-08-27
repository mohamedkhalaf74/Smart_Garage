// import 'package:flutter/material.dart';
// import 'offer.dart'; // Import the Offer class
//
// class WalletPage extends StatefulWidget {
//   @override
//   _WalletPageState createState() => _WalletPageState();
// }
//
// class _WalletPageState extends State<WalletPage> {
//   final List<Offer> _offers = [
//     Offer(
//       title: 'Premium Parking Spot',
//       description: 'Get a premium parking spot with additional benefits.',
//       discount: 15.0,
//       imagePath: 'assets/premium_parking.jpg',
//     ),
//     Offer(
//       title: 'Monthly Pass',
//       description: 'Save on parking with our monthly pass.',
//       discount: 20.0,
//       imagePath: 'assets/monthly_pass.jpg',
//     ),
//     Offer(
//       title: 'Seasonal Offer',
//       description: 'Enjoy seasonal offers with exclusive perks.',
//       discount: 25.0,
//       imagePath: 'assets/seasonal_offer.jpg',
//     ),
//   ];
//
//   double _virtualMoney = 100.0; // Initial virtual money balance
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Wallet'),
//         backgroundColor: Theme.of(context).primaryColor,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             // Display virtual money balance
//             Text(
//               'Virtual Money: \$${_virtualMoney.toStringAsFixed(2)}',
//               style: const TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const SizedBox(height: 20),
//             Expanded(
//               child: ListView.builder(
//                 itemCount: _offers.length,
//                 itemBuilder: (context, index) {
//                   final offer = _offers[index];
//                   return Card(
//                     margin: const EdgeInsets.only(bottom: 16),
//                     elevation: 4,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Image.asset(
//                           offer.imagePath,
//                           fit: BoxFit.cover,
//                           height: 150,
//                           width: double.infinity,
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(16.0),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 offer.title,
//                                 style: const TextStyle(
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                               const SizedBox(height: 8),
//                               Text(
//                                 offer.description,
//                                 style: const TextStyle(fontSize: 16),
//                               ),
//                               const SizedBox(height: 8),
//                               Text(
//                                 'Discount: ${offer.discount.toStringAsFixed(0)}%',
//                                 style: const TextStyle(
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                               const SizedBox(height: 16),
//                               ElevatedButton(
//                                 onPressed: () {
//                                   _participateInOffer(offer);
//                                 },
//                                 child: const Text('Participate'),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   void _participateInOffer(Offer offer) {
//     setState(() {
//       _virtualMoney -= offer.discount;
//     });
//   }
// }










// import 'package:flutter/material.dart';
// import 'offer.dart'; // Import the Offer class
//
// class WalletPage extends StatefulWidget {
//   @override
//   _WalletPageState createState() => _WalletPageState();
// }
//
// class _WalletPageState extends State<WalletPage> {
//   final List<Offer> _offers = [
//     Offer(
//       title: 'Premium Parking Spot',
//       description: 'Get a premium parking spot with additional benefits.',
//       discount: 15.0,
//       imagePath: 'assets/premium_parking.jpg',
//     ),
//     Offer(
//       title: 'Monthly Pass',
//       description: 'Save on parking with our monthly pass.',
//       discount: 20.0,
//       imagePath: 'assets/monthly_pass.jpg',
//     ),
//     Offer(
//       title: 'Seasonal Offer',
//       description: 'Enjoy seasonal offers with exclusive perks.',
//       discount: 25.0,
//       imagePath: 'assets/seasonal_offer.jpg',
//     ),
//   ];
//
//   double _virtualMoney = 100.0; // Initial virtual money balance
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Wallet'),
//         backgroundColor: Theme.of(context).primaryColor,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             // Display virtual money balance
//             Text(
//               'Virtual Money: \$${_virtualMoney.toStringAsFixed(2)}',
//               style: const TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const SizedBox(height: 20),
//             Expanded(
//               child: ListView.builder(
//                 itemCount: _offers.length,
//                 itemBuilder: (context, index) {
//                   final offer = _offers[index];
//                   return Card(
//                     margin: const EdgeInsets.only(bottom: 16),
//                     elevation: 4,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Image.asset(
//                           offer.imagePath,
//                           fit: BoxFit.cover,
//                           height: 150,
//                           width: double.infinity,
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(16.0),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 offer.title,
//                                 style: const TextStyle(
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                               const SizedBox(height: 8),
//                               Text(
//                                 offer.description,
//                                 style: const TextStyle(fontSize: 16),
//                               ),
//                               const SizedBox(height: 8),
//                               Text(
//                                 'Discount: ${offer.discount.toStringAsFixed(0)}%',
//                                 style: const TextStyle(
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                               const SizedBox(height: 16),
//                               ElevatedButton(
//                                 onPressed: () {
//                                   _participateInOffer(offer);
//                                 },
//                                 child: const Text('Participate'),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   void _participateInOffer(Offer offer) {
//     final double offerCost = 20.0; // Define the cost for participating in an offer
//
//     if (_virtualMoney >= offerCost) {
//       setState(() {
//         _virtualMoney -= offerCost;
//       });
//
//       showDialog(
//         context: context,
//         builder: (context) => AlertDialog(
//           title: const Text('Offer Participation'),
//           content: Text(
//             'You have participated in "${offer.title}". \$${offerCost.toStringAsFixed(2)} has been deducted from your virtual money.',
//           ),
//           actions: [
//             TextButton(
//               onPressed: () => Navigator.pop(context),
//               child: const Text('OK'),
//             ),
//           ],
//         ),
//       );
//     } else {
//       showDialog(
//         context: context,
//         builder: (context) => AlertDialog(
//           title: const Text('Insufficient Funds'),
//           content: const Text('You do not have enough virtual money to participate in this offer.'),
//           actions: [
//             TextButton(
//               onPressed: () => Navigator.pop(context),
//               child: const Text('OK'),
//             ),
//           ],
//         ),
//       );
//     }
//   }
// }

//----------------------------------------------------------------------------------------



//
// import 'package:flutter/material.dart';
//
// class WalletPage extends StatefulWidget {
//   @override
//   _WalletPageState createState() => _WalletPageState();
// }
//
// class _WalletPageState extends State<WalletPage> {
//   final List<Offer> _offers = [
//     Offer(
//       title: 'Premium Parking Spot',
//       description: 'Get a premium parking spot with additional benefits.',
//       price: 20.0,
//       imagePath: 'assets/premium_parking.jpg',
//     ),
//     Offer(
//       title: 'Monthly Pass',
//       description: 'Save on parking with our monthly pass.',
//       price: 50.0,
//       imagePath: 'assets/monthly_pass.jpg',
//     ),
//     Offer(
//       title: 'Seasonal Offer',
//       description: 'Enjoy seasonal offers with exclusive perks.',
//       price: 180.0,
//       imagePath: 'assets/seasonal_offer.jpg',
//     ),
//     Offer(
//       title: 'One Day Only',
//       description: 'Park for one day with a special discount.',
//       price: 5.0,
//       imagePath: 'assets/one_day_only.jpg',
//     ),
//   ];
//
//   double _virtualMoney = 1000.0; // Initial virtual money balance
//
//   void _participateInOffer(Offer offer) {
//     setState(() {
//       if (_virtualMoney >= offer.price) {
//         _virtualMoney -= offer.price; // Deduct price from virtual money
//       } else {
//         // Handle insufficient funds, if necessary
//         showDialog(
//           context: context,
//           builder: (context) => AlertDialog(
//             title: const Text('Insufficient Funds'),
//             content: const Text('You do not have enough virtual money to participate in this offer.'),
//             actions: [
//               TextButton(
//                 onPressed: () => Navigator.of(context).pop(),
//                 child: const Text('OK'),
//               ),
//             ],
//           ),
//         );
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Wallet'),
//         backgroundColor: Theme.of(context).primaryColor,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             // Display virtual money balance
//             Text(
//               'Virtual Money: \$${_virtualMoney.toStringAsFixed(2)}',
//               style: const TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const SizedBox(height: 20),
//             Expanded(
//               child: ListView.builder(
//                 itemCount: _offers.length,
//                 itemBuilder: (context, index) {
//                   final offer = _offers[index];
//                   return Card(
//                     margin: const EdgeInsets.only(bottom: 16),
//                     elevation: 4,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Image.asset(
//                           offer.imagePath,
//                           fit: BoxFit.cover,
//                           height: 150,
//                           width: double.infinity,
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(16.0),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 offer.title,
//                                 style: const TextStyle(
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                               const SizedBox(height: 8),
//                               Text(
//                                 offer.description,
//                                 style: const TextStyle(fontSize: 16),
//                               ),
//                               const SizedBox(height: 8),
//                               Text(
//                                 'Price: \$${offer.price.toStringAsFixed(2)}',
//                                 style: const TextStyle(
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                               const SizedBox(height: 16),
//                               ElevatedButton(
//                                 onPressed: () {
//                                   _participateInOffer(offer);
//                                 },
//                                 child: const Text('Participate'),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class Offer {
//   final String title;
//   final String description;
//   final double price;
//   final String imagePath;
//
//   Offer({
//     required this.title,
//     required this.description,
//     required this.price,
//     required this.imagePath,
//   });
// }


// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
//
// class WalletPage extends StatefulWidget {
//   @override
//   _WalletPageState createState() => _WalletPageState();
// }
//
// class _WalletPageState extends State<WalletPage> {
//   final List<Offer> _offers = [
//     Offer(
//       title: 'Premium Parking Spot',
//       description: 'Get a premium parking spot with additional benefits.',
//       price: 20.0,
//       imagePath: 'assets/premium_parking.jpg',
//     ),
//     Offer(
//       title: 'Monthly Pass',
//       description: 'Save on parking with our monthly pass.',
//       price: 50.0,
//       imagePath: 'assets/monthly_pass.jpg',
//     ),
//     Offer(
//       title: 'Seasonal Offer',
//       description: 'Enjoy seasonal offers with exclusive perks.',
//       price: 180.0,
//       imagePath: 'assets/seasonal_offer.jpg',
//     ),
//     Offer(
//       title: 'One Day Only',
//       description: 'Park for one day with a special discount.',
//       price: 5.0,
//       imagePath: 'assets/one_day_only.jpg',
//     ),
//   ];
//
//   double _virtualMoney = 1000.0; // Initialize to 0
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//
//   @override
//   void initState() {
//     super.initState();
//     _loadVirtualMoney();
//   }
//
//   Future<void> _loadVirtualMoney() async {
//     try {
//       final userDoc = await _firestore.collection('users').doc('user_id').get();
//       if (userDoc.exists) {
//         setState(() {
//           _virtualMoney = userDoc.data()?['virtualMoney']?.toDouble() ?? 0.0;
//         });
//       }
//     } catch (e) {
//       // Handle error
//       print('Error loading virtual money: $e');
//     }
//   }
//
//   Future<void> _saveVirtualMoney() async {
//     try {
//       await _firestore.collection('users').doc('user_id').set({
//         'virtualMoney': _virtualMoney,
//       }, SetOptions(merge: true));
//     } catch (e) {
//       // Handle error
//       print('Error saving virtual money: $e');
//     }
//   }
//
//   void _participateInOffer(Offer offer) {
//     setState(() {
//       if (_virtualMoney >= offer.price) {
//         _virtualMoney -= offer.price; // Deduct price from virtual money
//         _saveVirtualMoney(); // Save updated balance
//       } else {
//         // Handle insufficient funds
//         showDialog(
//           context: context,
//           builder: (context) => AlertDialog(
//             title: const Text('Insufficient Funds'),
//             content: const Text('You do not have enough virtual money to participate in this offer.'),
//             actions: [
//               TextButton(
//                 onPressed: () => Navigator.of(context).pop(),
//                 child: const Text('OK'),
//               ),
//             ],
//           ),
//         );
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Wallet'),
//         backgroundColor: Theme.of(context).primaryColor,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             // Display virtual money balance
//             Text(
//               'Virtual Money: \$${_virtualMoney.toStringAsFixed(2)}',
//               style: const TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const SizedBox(height: 20),
//             Expanded(
//               child: ListView.builder(
//                 itemCount: _offers.length,
//                 itemBuilder: (context, index) {
//                   final offer = _offers[index];
//                   return Card(
//                     margin: const EdgeInsets.only(bottom: 16),
//                     elevation: 4,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Image.asset(
//                           offer.imagePath,
//                           fit: BoxFit.cover,
//                           height: 150,
//                           width: double.infinity,
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(16.0),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 offer.title,
//                                 style: const TextStyle(
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                               const SizedBox(height: 8),
//                               Text(
//                                 offer.description,
//                                 style: const TextStyle(fontSize: 16),
//                               ),
//                               const SizedBox(height: 8),
//                               Text(
//                                 'Price: \$${offer.price.toStringAsFixed(2)}',
//                                 style: const TextStyle(
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                               const SizedBox(height: 16),
//                               ElevatedButton(
//                                 onPressed: () {
//                                   _participateInOffer(offer);
//                                 },
//                                 child: const Text('Participate'),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class Offer {
//   final String title;
//   final String description;
//   final double price;
//   final String imagePath;
//
//   Offer({
//     required this.title,
//     required this.description,
//     required this.price,
//     required this.imagePath,
//   });
// }





















import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class WalletPage extends StatefulWidget {
  @override
  _WalletPageState createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  final List<Offer> _offers = [
    Offer(
      title: 'Premium Parking Spot',
      description: 'Get a premium parking spot with additional benefits.',
      price: 20.0,
      imagePath: 'assets/premium_parking.jpg',
    ),
    Offer(
      title: 'Monthly Pass',
      description: 'Save on parking with our monthly pass.',
      price: 50.0,
      imagePath: 'assets/monthly_pass.jpg',
    ),
    Offer(
      title: 'Seasonal Offer',
      description: 'Enjoy seasonal offers with exclusive perks.',
      price: 180.0,
      imagePath: 'assets/seasonal_offer.jpg',
    ),
    Offer(
      title: 'One Day Only',
      description: 'Park for one day with a special discount.',
      price: 5.0,
      imagePath: 'assets/one_day_only.jpg',
    ),
  ];

  double _virtualMoney = 0.0; // Initialize to 0
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
    _loadVirtualMoney();
  }

  Future<void> _loadVirtualMoney() async {
    try {
      final userDoc = await _firestore.collection('users').doc('user_id').get();
      if (userDoc.exists) {
        setState(() {
          _virtualMoney = userDoc.data()?['virtualMoney']?.toDouble() ?? 0.0;
        });
      }
    } catch (e) {
      // Handle error
      print('Error loading virtual money: $e');
    }
  }

  Future<void> _saveVirtualMoney() async {
    try {
      await _firestore.collection('users').doc('user_id').set({
        'virtualMoney': _virtualMoney,
      }, SetOptions(merge: true));
    } catch (e) {
      // Handle error
      print('Error saving virtual money: $e');
    }
  }

  Future<void> _refillVirtualMoney() async {
    // Show dialog to enter password
    final TextEditingController _passwordController = TextEditingController();
    bool isPasswordCorrect = false;

    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Enter Password'),
        content: TextField(
          controller: _passwordController,
          decoration: const InputDecoration(
            hintText: 'Enter your password',
          ),
          obscureText: true,
        ),
        actions: [
          TextButton(
            onPressed: () {
              if (_passwordController.text == '1234') { // Replace with your password logic
                isPasswordCorrect = true;
                Navigator.of(context).pop();
              } else {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Error'),
                    content: const Text('Incorrect password. Please try again.'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text('OK'),
                      ),
                    ],
                  ),
                );
              }
            },
            child: const Text('Submit'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
        ],
      ),
    );

    if (isPasswordCorrect) {
      setState(() {
        _virtualMoney = 1000.0;
      });
      await _saveVirtualMoney();
    }
  }

  void _participateInOffer(Offer offer) {
    setState(() {
      if (_virtualMoney >= offer.price) {
        _virtualMoney -= offer.price; // Deduct price from virtual money
        _saveVirtualMoney(); // Save updated balance
      } else {
        // Handle insufficient funds
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Insufficient Funds'),
            content: const Text('You do not have enough virtual money to participate in this offer.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wallet'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Display virtual money balance
            Text(
              'Virtual Money: \$${_virtualMoney.toStringAsFixed(2)}',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _refillVirtualMoney,
              child: const Text('Refill Money to \$1000'),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _offers.length,
                itemBuilder: (context, index) {
                  final offer = _offers[index];
                  return Card(
                    margin: const EdgeInsets.only(bottom: 16),
                    elevation: 4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          offer.imagePath,
                          fit: BoxFit.cover,
                          height: 150,
                          width: double.infinity,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                offer.title,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                offer.description,
                                style: const TextStyle(fontSize: 16),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Price: \$${offer.price.toStringAsFixed(2)}',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 16),
                              ElevatedButton(
                                onPressed: () {
                                  _participateInOffer(offer);
                                },
                                child: const Text('Participate'),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Offer {
  final String title;
  final String description;
  final double price;
  final String imagePath;

  Offer({
    required this.title,
    required this.description,
    required this.price,
    required this.imagePath,
  });
}
