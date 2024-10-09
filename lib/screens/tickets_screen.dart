import 'package:flutter/material.dart';

class TicketsScreen extends StatelessWidget {
  const TicketsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tickets'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildTicketItem(
            context,
            'Ticket #5678',
            'Status: In progress',
            'Assigned to you',
          ),
          _buildTicketItem(
            context,
            'Ticket #4321',
            'Status: Resolved',
            'Completed yesterday',
          ),
          // Add more ticket items here
        ],
      ),
    );
  }

  Widget _buildTicketItem(
      BuildContext context, String title, String subtitle, String trailing) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: Text(trailing),
        leading: const Icon(Icons.support_agent, color: Colors.red),
      ),
    );
  }
}
