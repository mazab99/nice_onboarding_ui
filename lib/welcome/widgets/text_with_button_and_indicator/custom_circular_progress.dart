
import 'package:flutter/material.dart';

import '../../../constants/animations.dart';
import '../../../constants/colors.dart';
import '../../../utils/functions.dart';

class CustomCircularProgress extends StatelessWidget {
  const CustomCircularProgress({
    Key? key,
    required this.currentIndex,
  }) : super(key: key);

  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: 70,
      child: TweenAnimationBuilder<double>(
        tween: getProgressOnCurrentIndex(currentIndex),
        duration: AppAnimations.circularProgressIndicator,
        builder: (_, value, __) => CircularProgressIndicator(
          backgroundColor: AppColors.circularProgressIndicatorBackground,
          value: value,
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation(
            getColorFromIndex(currentIndex),
          ),
        ),
      ),
    );
  }
}
