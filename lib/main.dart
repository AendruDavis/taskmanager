import 'package:flutter/material.dart';

import 'package:taskmanager/onboarding/login_screen.dart';
import 'package:taskmanager/onboarding/onboarding_screen.dart';
import 'package:taskmanager/profile/profile_screen.dart';
import 'package:taskmanager/profile/settings_screen.dart';
import 'package:taskmanager/screens/dashboard_screen.dart';

import 'package:taskmanager/screens/notification_screen.dart';
import 'package:taskmanager/screens/tickets_screen.dart';
import 'package:taskmanager/splash_screen/splash_screen.dart';
import 'package:taskmanager/task_manager/task_screen.dart';
import 'package:taskmanager/themes/dark_theme.dart';
import 'package:taskmanager/themes/light_theme.dart';

void main() {
  runApp(const taskmanager());
}

class taskmanager extends StatelessWidget {
  const taskmanager({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: darkTheme,
      theme: lightTheme,
      home: const SplashScreen(),

      // initialRoute: '/onboarding',
      routes: {
        '/onboarding': (context) => const OnboardingScreen(),
        '/signin': (context) => const LoginScreen(),
        '/dashboard': (context) => const DashboardScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/notifications': (context) => const NotificationsScreen(),
        '/tickets': (context) => const TicketsScreen(),
        '/tasks': (context) => const TasksScreen(),
        '/settings': (context) => const SettingsScreen()
      },
    );
  }
}
