import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homenest/presentation/widgets/custom_search_bar.dart';
import 'package:homenest/utils/app_assets.dart';
import 'package:homenest/utils/app_colors.dart';

class AppBarHome extends StatefulWidget {
  const AppBarHome({super.key});

  @override
  State<AppBarHome> createState() => _AppBarHomeState();
}

class _AppBarHomeState extends State<AppBarHome> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        children: [
          Expanded(
            flex: 5,
            child: CustomSearchBar(
              icon: AppAssets.location,
              textColor: AppColors.grey,
              borderRadius: 10.r,
              controller: TextEditingController(text: 'Saint Petersburg'),
              hintText: 'Enter your search here',
              onSearch: (p0) {},
            ).animate().slideX(curve: Curves.easeIn).then(delay: 200.ms),
          ),
          Expanded(
            flex: 5,
            child: Align(
              alignment: Alignment.centerRight,
              child: const CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 20,
                backgroundImage: AssetImage(AppAssets.user),
              ).animate().scale(duration: const Duration(seconds: 2)).fadeIn(),
            ),
          )
        ],
      ),
    );
  }
}
