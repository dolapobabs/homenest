import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homenest/utils/app_colors.dart';
import 'package:homenest/utils/extensions/text_theme.dart';

import 'animated_counter.dart';

class OffersWidget extends StatelessWidget {
  const OffersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
                flex: 5,
                child: CircleAvatar(
                  // height: 140.h,
                  backgroundColor: Colors.orange.withOpacity(0.7),
                  radius: 80.r,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('BUY',
                            style: Theme.of(context)
                                .textTheme
                                .normal12Text
                                .copyWith(color: AppColors.white)),
                        10.verticalSpace,
                        const AnimatedCounter(
                            duration: Duration(seconds: 4),
                            value: 1034,
                            textColor: Colors.white),
                        Text('offers',
                            style: Theme.of(context)
                                .textTheme
                                .normal12Text
                                .copyWith(color: AppColors.white)),
                      ],
                    ),
                  ),
                ))
            .animate()
            .scale(
                duration: const Duration(seconds: 3), curve: Curves.easeInCirc)
            .fadeIn(),
        10.horizontalSpace,
        Expanded(
          flex: 5,
          child: Container(
            // height: 140.h,
            height: 160.h,
            padding: EdgeInsets.symmetric(vertical: 20.h),
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(20),
              color: const Color.fromARGB(255, 243, 234, 225),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('RENT',
                    style: Theme.of(context)
                        .textTheme
                        .normal12Text
                        .copyWith(color: AppColors.grey)),
                10.verticalSpace,
                const AnimatedCounter(
                  duration: Duration(seconds: 4),
                  value: 2122,
                  textColor: AppColors.grey,
                ),
                Text('offers',
                    style: Theme.of(context)
                        .textTheme
                        .normal12Text
                        .copyWith(color: AppColors.grey)),
              ],
            ),
          ),
        )
            .animate()
            .scale(
                duration: const Duration(seconds: 3), curve: Curves.easeInCirc)
            .fadeIn(),
      ],
    );
  }
}
