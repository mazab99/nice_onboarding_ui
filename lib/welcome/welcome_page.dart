import 'package:flutter/material.dart';
import 'package:nice_onboarding_ui/utils/functions.dart';
import 'package:nice_onboarding_ui/welcome/widgets/container_with_image/container_with_image.dart';
import 'package:nice_onboarding_ui/welcome/widgets/text_with_button_and_indicator/text_with_button_and_indicator.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({
    super.key,
  });

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  late final PageController _controller = PageController();

  int _currentIndex = 0;
  Color _currentColor = Colors.red;

  @override
  void initState() {
    _controller.addListener(_onUpdatedIndex);
    super.initState();
  }

  @override
  void dispose() {
    _controller
      ..removeListener(_onUpdatedIndex)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: PageViewBuilder(
              currentColor: _currentColor,
              controller: _controller,
            ),
          ),
          const SizedBox(
            height: 42,
          ),
          Expanded(
            child: TextWithButtonAndIndicator(
              currentIndex: _currentIndex,
              currentColor: _currentColor,
              controller: _controller,
            ),
          ),
        ],
      ),
    );
  }

  void _onUpdatedIndex() {
    final currentIndex = _controller.page?.round() ?? 0;
    if (currentIndex != _currentIndex) {
      _currentIndex = currentIndex;
      _currentColor = getColorFromIndex(currentIndex);
      setState(() {});
    }
  }
}
