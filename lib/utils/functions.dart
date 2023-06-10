import 'package:flutter/material.dart';
import 'package:nice_onboarding_ui/constants/colors.dart';

Color getColorFromIndex(int currentIndex) {
  switch (currentIndex) {
    case 0:
      return Colors.red;
    case 1:
      return Colors.green;
    case 2:
      return Colors.red;
    default:
      return Colors.red;
  }
}

String getCurrentTitle(int currentIndex) {
  switch (currentIndex) {
    case 0:
      return 'Mahmoud Azab';
    case 1:
      return 'Mobile-developer';
    case 2:
      return 'Flutter Nice Ui design';
    default:
      return '';
  }
}

String getCurrentSubtext(int currentIndex) {
  switch (currentIndex) {
    case 0:
      return 'Follow me in Linkedln';
    case 1:
      return '';
    case 2:
      return '';
    default:
      return '';
  }
}

void navigateToNextPage(
  int currentIndex,
  PageController controller,
) =>
    currentIndex != 2
        ? controller.nextPage(
            duration: const Duration(milliseconds: 1500),
            curve: Curves.elasticOut,
          )
        : controller.animateToPage(
            0,
            duration: const Duration(milliseconds: 1500),
            curve: Curves.elasticOut,
          );

Tween<double> getProgressOnCurrentIndex(int currentIndex) {
  switch (currentIndex) {
    case 0:
      return Tween<double>(
        begin: 0,
        end: 0.5,
      );
    case 1:
      return Tween<double>(
        begin: 0.5,
        end: 0.75,
      );
    case 2:
      return Tween<double>(
        begin: 0.75,
        end: 1,
      );
    default:
      return Tween<double>(
        begin: 0,
        end: 0.5,
      );
  }
}

Icon getProperIcon(int currentIndex) => currentIndex != 2
    ? const Icon(
        Icons.navigate_next,
        key: ValueKey('next_icon'),
        color: Colors.white,
      )
    : const Icon(
        Icons.done,
        key: ValueKey('done_icon'),
        color: Colors.white,
      );

void navigationViaButton(
  int currentIndex,
  PageController controller,
) =>
    currentIndex != 2
        ? controller.nextPage(
            duration: const Duration(milliseconds: 1000),
            curve: Curves.easeOutCirc,
          )
        : controller.animateToPage(
            0,
            duration: const Duration(milliseconds: 2000),
            curve: Curves.easeOutExpo,
          );
