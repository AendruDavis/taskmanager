import 'package:flutter/material.dart';
import 'package:taskmanager/components/version_modal.dart';

class DashboardDrawer extends StatelessWidget {
  final String productVersion;

  const DashboardDrawer({super.key, required this.productVersion});

  void _showVersionDetails(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const VersionModal(
          version: "1.0.0",
          releaseDate: "August 30, 2024",
          changes: "Initial release with basic functionalities.",
        );
      },
    );
  }

  void _logout(BuildContext context) {
    // Implement your logout logic here.
    // This might involve clearing user authentication data
    // and navigating back to the login screen.

    // For demonstration, navigate to the login screen.
    Navigator.pushReplacementNamed(context, '/signin');
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: Column(
          children: <Widget>[
            DrawerHeader(
              padding: EdgeInsets.zero, // Remove default padding
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    width: 200, // Adjust the size as needed
                    // Adjust the size as needed
                    child: Image.asset(
                        "assets/images/my_logo.png"), // Replace with your logo path
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  ListTile(
                    leading: const Icon(Icons.person),
                    title: const Text('Profile'),
                    onTap: () {
                      Navigator.pushNamed(context, '/profile');
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text('Settings'),
                    onTap: () {
                      Navigator.pushNamed(context, '/settings');
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.logout),
                    title: const Text('Logout'),
                    onTap: () => _logout(context),
                  ),
                ],
              ),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.info_outline),
              title: Text('Version $productVersion'),
              onTap: () => _showVersionDetails(context),
            ),
          ],
        ),
      ),
    );
  }
}
