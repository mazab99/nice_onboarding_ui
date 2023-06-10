import 'package:flutter/material.dart';
import 'package:nice_onboarding_ui/welcome/widgets/welcome_slide.dart';

class PageViewBuilder extends StatelessWidget {
  const PageViewBuilder({
    required this.currentColor,
    required this.controller,
    super.key,
  });

  final Color currentColor;
  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return PageView(
      physics: const NeverScrollableScrollPhysics(),
      controller: controller,
      children: const [
        WelcomeSlide(
          path: 'assets/1.jpg',
        ),
        WelcomeSlide(
          path: 'assets/4.jpg',
        ),
        WelcomeSlide(
          path: 'assets/5.jpg',
        ),
      ],
    );
  }
}
