import 'package:flutter/material.dart';
import 'package:taskmanager/components/dashboard_drawer.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DashboardDrawer(
        productVersion: "1.0.0",
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200.0,
            pinned: true,
            stretch: true,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text(
                'Dashboard',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    'assets/images/background.png',
                    fit: BoxFit.cover,
                  ),
                  Container(
                    color: Colors.black
                        .withOpacity(0.3), // Black overlay with 50% opacity
                  ),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(16.0),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  const Text(
                    'Recent Notifications',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  _buildNotificationCard(context),
                  const SizedBox(height: 16),
                  const Text(
                    'Upcoming Tasks',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  _buildTaskCard(context),
                  const SizedBox(height: 16),
                  const Text(
                    'Ticket Status',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  _buildTicketCard(context),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationCard(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: const Icon(Icons.notifications, color: Colors.blue),
        title: const Text('New ticket assigned: #1234'),
        subtitle: const Text('Check the details in your tickets section.'),
        trailing: const Icon(Icons.arrow_forward),
        onTap: () {
          Navigator.pushNamed(context, '/notifications');
        },
      ),
    );
  }

  Widget _buildTaskCard(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: const Icon(Icons.task, color: Colors.green),
        title: const Text('Prepare project report'),
        subtitle: const Text('Due tomorrow'),
        trailing: const Icon(Icons.check_circle),
        onTap: () {
          Navigator.pushNamed(context, '/tasks');
        },
      ),
    );
  }

  Widget _buildTicketCard(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: const Icon(Icons.support_agent, color: Colors.red),
        title: const Text('Ticket #5678'),
        subtitle: const Text('Status: In progress'),
        trailing: const Icon(Icons.arrow_forward),
        onTap: () {
          Navigator.pushNamed(context, '/tickets');
        },
      ),
    );
  }
}
