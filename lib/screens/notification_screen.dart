import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildNotificationItem(
            context,
            'N assigned: #1234',
            'Check the details in your tickets section.',
          ),
          _buildNotificationItem(
            context,
            'Meeting scheduled at 3 PM',
            'Don\'t forget to prepare the presentation.',
          ),
          // Add more notification items here
        ],
      ),
    );
  }

  Widget _buildNotificationItem(
      BuildContext context, String title, String subtitle) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        leading: const Icon(Icons.notifications, color: Colors.blue),
      ),
    );
  }
}
