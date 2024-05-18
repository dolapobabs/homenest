import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:homenest/utils/app_assets.dart';
import 'package:homenest/utils/extensions/text_theme.dart';

import '../widgets/offers_widget.dart';
import 'grid_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          20.verticalSpace,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text('Hi Adedolapo',
                        style: Theme.of(context).textTheme.titleHeader)
                    .animate()
                    .fadeIn(
                        delay: const Duration(seconds: 1),
                        curve: Curves.easeIn) // uses `Animate.defaultDuration`\
                ,
                Text.rich(
                  TextSpan(
                    text: 'let\'s select your \n',
                    style: Theme.of(context).textTheme.subTitle,
                    children: [
                      TextSpan(
                          text: 'perfect place',
                          style: Theme.of(context).textTheme.subTitle),
                    ],
                  ),
                ).animate().fadeIn(
                    delay: const Duration(seconds: 2), curve: Curves.easeIn),
                20.verticalSpace,
                const OffersWidget().animate().fadeIn(
                    delay: const Duration(seconds: 2), curve: Curves.easeIn)
              ],
            ),
          ),
          20.verticalSpace,
          const ImageGridView()
              .animate(delay: 3.seconds)
              .fadeIn(delay: 1.seconds, curve: Curves.linear)
              .move(
                  duration: 2.seconds,
                  begin: const Offset(0, 200),
                  curve: Curves.easeInOutCirc)
        ],
      ),
    );
  }
}
