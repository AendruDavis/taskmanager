import 'package:flutter/material.dart';
import 'package:taskmanager/components/spacing_utils.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  void _nextPage() {
    if (_currentPage < 3) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _previousPage() {
    if (_currentPage > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _onPageChanged(int page) {
    setState(() {
      _currentPage = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        children: [
          OnboardingPage(
            title: "Welcome to WTL",
            description: "Manage your tickets and tasks with ease.",
            imagePath: "assets/images/my_logo.png",
            showNavigationButtons: true,
            onSkip: () {
              Navigator.pushReplacementNamed(context, '/signin');
            },
            onNext: _nextPage,
            onPrevious: _previousPage,
            isLastPage: _currentPage == 3,
            showPreviousButton: _currentPage > 0,
          ),
          OnboardingPage(
            title: "Stay Notified",
            description: "Get instant notifications on ticket updates.",
            imagePath: "assets/images/my_logo.png",
            showNavigationButtons: true,
            onSkip: () {
              Navigator.pushReplacementNamed(context, '/signin');
            },
            onNext: _nextPage,
            onPrevious: _previousPage,
            isLastPage: _currentPage == 3,
            showPreviousButton: _currentPage > 0,
          ),
          OnboardingPage(
            title: "Boost Productivity",
            description:
                "Manage tasks efficiently and stay on top of your work.",
            imagePath: "assets/images/logo_wtl.png",
            showNavigationButtons: true,
            onSkip: () {
              Navigator.pushReplacementNamed(context, '/signin');
            },
            onNext: _nextPage,
            onPrevious: _previousPage,
            isLastPage: _currentPage == 3,
            showPreviousButton: _currentPage > 0,
          ),
          OnboardingPage(
            title: "Let's Get Started",
            description: "Sign in to continue.",
            imagePath: "assets/images/my_logo.png",
            showNavigationButtons: true,
            onSkip: () {
              Navigator.pushReplacementNamed(context, '/signin');
            },
            onNext: () {
              Navigator.pushReplacementNamed(context, '/signin');
            },
            onPrevious: _previousPage,
            isLastPage: true,
            showPreviousButton: _currentPage > 0,
          ),
        ],
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;
  final bool isLastPage;
  final bool showNavigationButtons;
  final VoidCallback? onSkip;
  final VoidCallback? onNext;
  final VoidCallback? onPrevious;
  final bool showPreviousButton;

  const OnboardingPage({
    super.key,
    required this.title,
    required this.description,
    required this.imagePath,
    this.isLastPage = false,
    this.showNavigationButtons = false,
    this.onSkip,
    this.onNext,
    this.onPrevious,
    this.showPreviousButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(48.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          AspectRatio(
            aspectRatio:
                4, // Set the aspect ratio you need (e.g., 1.0 for a square)
            child: Hero(
              tag: 'onboardingImage',
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover, // Adjust this as needed
              ),
            ),
          ),
          addVerticalSpacing(20),
          Text(
            title,
            style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              description,
              style: const TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ),
          const Spacer(),
          if (showNavigationButtons)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (showPreviousButton)
                  ElevatedButton(
                    onPressed: onPrevious,
                    child: const Text("Previous"),
                  ),
                if (onSkip != null)
                  TextButton(
                    onPressed: onSkip,
                    child: const Text("Skip"),
                  ),
                if (onNext != null)
                  ElevatedButton(
                    onPressed: onNext,
                    child: Text(isLastPage ? "Get Started" : "Next"),
                  ),
              ],
            ),
        ],
      ),
    );
  }
}
