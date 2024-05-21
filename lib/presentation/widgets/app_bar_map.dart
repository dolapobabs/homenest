import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:homenest/presentation/widgets/custom_search_bar.dart';
import 'package:homenest/utils/app_assets.dart';
import 'package:homenest/utils/app_colors.dart';

import 'circle_icon.dart';

class AppBarMap extends StatefulWidget {
  const AppBarMap({super.key});

  @override
  State<AppBarMap> createState() => _AppBarMapState();
}

class _AppBarMapState extends State<AppBarMap> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        children: [
          Expanded(
            child: CustomSearchBar(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 7.r),
              controller: TextEditingController(text: 'Saint Petersburg'),
              hintText: 'Enter your search here',
              onSearch: (p0) {},
            ).animate().scale(curve: Curves.easeIn).then(delay: 200.ms),
          ),
          5.horizontalSpace,
          Expanded(
            flex: 0,
            child: Align(
                alignment: Alignment.centerRight,
                child: CircleIcon(
                  color: AppColors.white,
                  child: SvgPicture.asset(AppAssets.settings),
                )),
          ).animate().scale(curve: Curves.easeIn).then(delay: 200.ms)
        ],
      ),
    );
  }
}
