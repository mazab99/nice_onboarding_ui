import 'package:flutter/material.dart';

class WelcomeSlide extends StatelessWidget {
  const WelcomeSlide({
    required this.path,
    super.key,
  });

  final String path;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: SafeArea(
        bottom: false,
        left: false,
        right: false,
        child: AspectRatio(
          aspectRatio: 300 / 300,
          child: Image(
            image: AssetImage(path),
          ),
        ),
      ),
    );
  }
}
