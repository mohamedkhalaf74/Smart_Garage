import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  final VoidCallback onToggleTheme;

  SettingsPage({required this.onToggleTheme});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ListTile(
              title: const Text('Toggle Theme'),
              trailing: Switch(
                value: Theme.of(context).brightness == Brightness.dark,
                onChanged: (bool value) {
                  onToggleTheme();
                },
              ),
            ),
            // Add more settings options here if needed
          ],
        ),
      ),
    );
  }
}



