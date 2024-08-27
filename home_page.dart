// import 'package:flutter/material.dart';
// import 'mqtt_service.dart'; // Import the MQTT service
// import 'settings_page.dart'; // Import the SettingsPage
// import 'wallet_page.dart'; // Import the WalletPage
// import 'about_us_page.dart'; // Import the AboutUsPage
//
// class HomePage extends StatefulWidget {
//   final String name;
//   final VoidCallback onToggleTheme;
//
//   HomePage({required this.name, required this.onToggleTheme});
//
//   @override
//   _HomePageState createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   final MqttService _mqttService = MqttService();
//   bool _isConnected = false;
//   String _sensorData = 'No data';
//
//   @override
//   void initState() {
//     super.initState();
//     _connectToMqtt();
//     _mqttService.addListener(() {
//       setState(() {
//         _sensorData = _mqttService.payload;
//       });
//     });
//   }
//
//   Future<void> _connectToMqtt() async {
//     await _mqttService.connect();
//     setState(() {
//       _isConnected = true;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Smart Garage - Home'),
//         backgroundColor: Theme.of(context).primaryColor,
//         actions: [
//           IconButton(
//             icon: Icon(
//               Theme.of(context).brightness == Brightness.dark
//                   ? Icons.wb_sunny
//                   : Icons.nights_stay,
//             ),
//             onPressed: widget.onToggleTheme,
//           ),
//           IconButton(
//             icon: const Icon(Icons.settings),
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => SettingsPage(onToggleTheme: widget.onToggleTheme),
//                 ),
//               );
//             },
//           ),
//           IconButton(
//             icon: const Icon(Icons.refresh),
//             onPressed: _isConnected ? _connectToMqtt : null,
//           ),
//           IconButton(
//             icon: const Icon(Icons.info),
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => AboutUsPage(),
//                 ),
//               );
//             },
//           ),
//         ],
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Center(
//             child: Column(
//               children: [
//                 Text(
//                   'Welcome, ${widget.name}!',
//                   style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 24),
//                 ),
//                 const SizedBox(height: 20),
//                 Text(
//                   'Sensor Data: $_sensorData',
//                   style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 20),
//                 ),
//                 const SizedBox(height: 20),
//               ],
//             ),
//           ),
//         ],
//       ),
//       bottomNavigationBar: BottomAppBar(
//         child: ElevatedButton.icon(
//           onPressed: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => WalletPage(),
//               ),
//             );
//           },
//           icon: const Icon(Icons.wallet),
//           label: const Text('Go to Wallet'),
//           style: ElevatedButton.styleFrom(
//             minimumSize: Size.fromHeight(50),
//           ),
//         ),
//       ),
//     );
//   }
// }






//
// import 'package:flutter/material.dart';
// import 'mqtt_service.dart'; // Import the MQTT service
// import 'settings_page.dart'; // Import the SettingsPage
// import 'wallet_page.dart'; // Import the WalletPage
// import 'about_us_page.dart'; // Import the AboutUsPage
//
// class HomePage extends StatefulWidget {
//   final String name;
//   final VoidCallback onToggleTheme;
//
//   HomePage({required this.name, required this.onToggleTheme});
//
//   @override
//   _HomePageState createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   final MqttService _mqttService = MqttService();
//   bool _isConnected = false;
//   String _sensorData = 'No data';
//
//   @override
//   void initState() {
//     super.initState();
//     _connectToMqtt();
//     _mqttService.addListener(() {
//       setState(() {
//         _sensorData = _mqttService.payload;
//       });
//     });
//   }
//
//   Future<void> _connectToMqtt() async {
//     await _mqttService.connect();
//     setState(() {
//       _isConnected = true;
//     });
//   }
//
//   void _logout() {
//     // Implement your logout logic here, such as clearing session or token.
//     Navigator.popUntil(context, (route) => route.isFirst);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Smart Garage - Home'),
//         backgroundColor: Theme.of(context).primaryColor,
//         actions: [
//           IconButton(
//             icon: Icon(
//               Theme.of(context).brightness == Brightness.dark
//                   ? Icons.wb_sunny
//                   : Icons.nights_stay,
//             ),
//             onPressed: widget.onToggleTheme,
//           ),
//           PopupMenuButton(
//             icon: const Icon(Icons.settings),
//             onSelected: (value) {
//               switch (value) {
//                 case 'settings':
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => SettingsPage(
//                         onToggleTheme: widget.onToggleTheme, // Pass the onToggleTheme callback
//                       ),
//                     ),
//                   );
//                   break;
//                 case 'about':
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => AboutUsPage(
//                         onToggleTheme: widget.onToggleTheme, // Pass the onToggleTheme callback
//                       ),
//                     ),
//                   );
//                   break;
//                 case 'logout':
//                   _logout();
//                   break;
//               }
//             },
//             itemBuilder: (context) => [
//               const PopupMenuItem(
//                 value: 'settings',
//                 child: Text('Settings'),
//               ),
//               const PopupMenuItem(
//                 value: 'about',
//                 child: Text('About Us'),
//               ),
//               const PopupMenuItem(
//                 value: 'logout',
//                 child: Text('Logout'),
//               ),
//             ],
//           ),
//           IconButton(
//             icon: const Icon(Icons.refresh),
//             onPressed: _isConnected ? _connectToMqtt : null,
//           ),
//         ],
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Center(
//             child: Column(
//               children: [
//                 Text(
//                   'Welcome, ${widget.name}!',
//                   style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 24),
//                 ),
//                 const SizedBox(height: 20),
//                 Text(
//                   'Sensor Data: $_sensorData',
//                   style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 20),
//                 ),
//                 const SizedBox(height: 20),
//               ],
//             ),
//           ),
//         ],
//       ),
//       bottomNavigationBar: BottomAppBar(
//         child: ElevatedButton.icon(
//           onPressed: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => WalletPage(),
//               ),
//             );
//           },
//           icon: const Icon(Icons.wallet),
//           label: const Text('Go to Wallet'),
//           style: ElevatedButton.styleFrom(
//             minimumSize: Size.fromHeight(50),
//           ),
//         ),
//       ),
//     );
//   }
// }





import 'package:flutter/material.dart';
import 'mqtt_service.dart'; // Import the MQTT service
import 'settings_page.dart'; // Import the SettingsPage
import 'wallet_page.dart'; // Import the WalletPage
import 'about_us_page.dart'; // Import the AboutUsPage

class HomePage extends StatefulWidget {
  final String name;
  final VoidCallback onToggleTheme;

  HomePage({required this.name, required this.onToggleTheme});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final MqttService _mqttService = MqttService();
  bool _isConnected = false;
  String _sensorData = 'No data';

  @override
  void initState() {
    super.initState();
    _connectToMqtt();
    _mqttService.addListener(() {
      setState(() {
        _sensorData = _mqttService.payload;
      });
    });
  }

  Future<void> _connectToMqtt() async {
    await _mqttService.connect();
    setState(() {
      _isConnected = true;
    });
  }

  void _logout() {
    // Implement your logout logic here, such as clearing session or token.
    Navigator.popUntil(context, (route) => route.isFirst);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Smart Garage - Home'),
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
          PopupMenuButton(
            icon: const Icon(Icons.settings),
            onSelected: (value) {
              switch (value) {
                case 'settings':
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SettingsPage(
                        onToggleTheme: widget.onToggleTheme, // Pass the onToggleTheme callback
                      ),
                    ),
                  );
                  break;
                case 'about':
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AboutUsPage(
                        onToggleTheme: widget.onToggleTheme, // Pass the onToggleTheme callback
                      ),
                    ),
                  );
                  break;
                case 'logout':
                  _logout();
                  break;
              }
            },
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'settings',
                child: Text('Settings'),
              ),
              const PopupMenuItem(
                value: 'about',
                child: Text('About Us'),
              ),
              const PopupMenuItem(
                value: 'logout',
                child: Text('Logout'),
              ),
            ],
          ),
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _isConnected ? _connectToMqtt : null,
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Column(
              children: [
                Text(
                  'Welcome, ${widget.name}!',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 24),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Please enter the password (1234) to enter the garage',
                  style: TextStyle(
                    fontSize: 28,
                    color: Colors.lightBlue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 100),
                Text(
                  'Sensor Data: $_sensorData',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 15),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: ElevatedButton.icon(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => WalletPage(),
              ),
            );
          },
          icon: const Icon(Icons.wallet),
          label: const Text('Go to Wallet'),
          style: ElevatedButton.styleFrom(
            minimumSize: Size.fromHeight(50),
          ),
        ),
      ),
    );
  }
}
