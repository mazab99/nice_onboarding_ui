import 'package:flutter/material.dart';
import 'package:nice_onboarding_ui/constants/animations.dart';
import 'package:nice_onboarding_ui/utils/functions.dart';
import 'custom_circular_progress.dart';
import 'indicator.dart';
part 'main_text.dart';


class TextWithButtonAndIndicator extends StatelessWidget {
  const TextWithButtonAndIndicator({
    required this.currentIndex,
    required this.currentColor,
    required this.controller,
    super.key,
  });

  final int currentIndex;
  final Color currentColor;
  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: _textWithAnimation(),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
          ).copyWith(
            bottom: 24,
          ),
          child: _bottomWidgets(),
        ),
      ],
    );
  }

  AnimatedSwitcher _textWithAnimation() {
    return AnimatedSwitcher(
      switchInCurve: Curves.easeIn,
      switchOutCurve: Curves.easeOut,
      duration: AppAnimations.defaultDuration,
      transitionBuilder: (child, animation) => FadeTransition(
        opacity: animation,
        child: child,
      ),
      child: IndexedStack(
        key: ValueKey<int>(currentIndex),
        index: currentIndex,
        children: List.generate(
          3,
          (_) => _MainText(
            currentIndex: currentIndex,
          ),
        ),
      ),
    );
  }

  Row _bottomWidgets() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Indicator(
          currentIndex: currentIndex,
          currentColor: currentColor,
        ),
        Stack(
          children: [
            CustomCircularProgress(
              currentIndex: currentIndex,
            ),
            Positioned(
              bottom: 10,
              left: 10,
              right: 10,
              top: 10,
              child: GestureDetector(
                onTap: () => navigationViaButton(
                  currentIndex,
                  controller,
                ),
                child: AnimatedContainer(
                  duration: AppAnimations.defaultDuration,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: currentColor,
                  ),
                  child: AnimatedSwitcher(
                    duration: AppAnimations.defaultDuration,
                    transitionBuilder: (child, anim) => RotationTransition(
                      turns: child.key == const ValueKey('next_icon')
                          ? Tween<double>(
                              begin: 1,
                              end: 0,
                            ).animate(anim)
                          : Tween<double>(
                              begin: 0.75,
                              end: 1,
                            ).animate(anim),
                      child: FadeTransition(
                        opacity: anim,
                        child: child,
                      ),
                    ),
                    child: FittedBox(
                      child: Padding(
                        padding: const EdgeInsets.all(4),
                        child: getProperIcon(currentIndex),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
