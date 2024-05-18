import 'package:flutter/material.dart';
import 'package:homenest/utils/extensions/text_theme.dart';
import 'package:homenest/utils/extensions/strings.dart';

class AnimatedCounter extends StatelessWidget {
  final int value;
  final Duration duration;
  final Color textColor;
  const AnimatedCounter({
    super.key,
    required this.value,
    required this.duration,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<int>(
      tween: IntTween(begin: 1, end: value),
      duration: duration,
      builder: (context, int value, child) {
        return Text(value.toString().formatWithSpaces(),
            style: Theme.of(context)
                .textTheme
                .bold28Text
                .copyWith(color: textColor));
      },
    );
  }
}
