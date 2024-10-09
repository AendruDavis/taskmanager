import 'package:flutter/material.dart';

class BubbleProgress extends StatelessWidget {
  final int currentStep;
  final int totalSteps;

  const BubbleProgress({
    Key? key,
    required this.currentStep,
    required this.totalSteps,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(totalSteps, (index) {
        return Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Center(
              child: Bubble(
                isActive: index < currentStep,
                isCompleted: index == currentStep - 1,
              ),
            ),
          ),
        );
      }),
    );
  }
}

class Bubble extends StatelessWidget {
  final bool isActive;
  final bool isCompleted;

  const Bubble({
    Key? key,
    required this.isActive,
    required this.isCompleted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isCompleted ? 20.0 : 12.0,
      height: isCompleted ? 20.0 : 12.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color:
            isActive ? (isCompleted ? Colors.green : Colors.blue) : Colors.grey,
        border: Border.all(
          color: isActive ? Colors.blueAccent : Colors.grey,
          width: 2.0,
        ),
      ),
    );
  }
}
