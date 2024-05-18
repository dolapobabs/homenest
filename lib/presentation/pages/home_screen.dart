import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:homenest/presentation/widgets/app_bar_home.dart';
import 'package:homenest/presentation/widgets/custom_app_bar.dart';

import '../../utils/app_assets.dart';
import '../../utils/app_colors.dart';
import '../widgets/app_bar_map.dart';
import '../widgets/custom_nav_bar.dart';
import 'home_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

List<Widget> getWidgetList() {
  return [
    Container(),
    Container(),
    const HomePage(),
    Container(),
    Container(),
  ];
}

class _HomeScreenState extends State<HomeScreen> {
  var _selectedTab = 2;
  void _handleIndexChanged(int i) {
    setState(() {
      _selectedTab = i;
      print(i);
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isHome = _selectedTab == 2;
    return Container(
      decoration: isHome
          ? const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromARGB(255, 246, 245, 244),
                  Color.fromARGB(255, 243, 201, 139),
                  // AppColors.white,
                ],
              ),
              color: Colors.black)
          : const BoxDecoration(color: Colors.black),
      child: Scaffold(
        extendBody: true,
        appBar: CustomAppBar(
          child: isHome ? const AppBarHome() : const AppBarMap(),
        ),
        body: getWidgetList()[_selectedTab],
        bottomNavigationBar: BottomNavBar(
          backgroundColor: const Color.fromARGB(221, 29, 27, 27),
          splashColor: Colors.grey,
          currentIndex: _selectedTab,
          unselectedItemColor: Colors.black54,
          selectedItemColor: AppColors.orange,
          itemPadding: EdgeInsets.only(right: 5.w),
          // enableFloatingNavBar: false,
          onTap: _handleIndexChanged,
          items: [
            /// Search
            NavigationBarItem(
              icon: SvgPicture.asset(
                AppAssets.magnifyingGlass,
                height: 24,
              ),
              unselectedColor: AppColors.white,
              selectedColor: AppColors.white,
            ),

            /// Chats
            NavigationBarItem(
              icon: SvgPicture.asset(
                AppAssets.chat,
                height: 24,
              ),
              unselectedColor: AppColors.white,
              selectedColor: AppColors.white,
            ),

            /// Home
            NavigationBarItem(
              icon: SvgPicture.asset(AppAssets.home),
              unselectedColor: AppColors.white,
              selectedColor: AppColors.white,
            ),

            /// Favorites
            NavigationBarItem(
              icon: const Icon(Icons.favorite),
              unselectedColor: AppColors.white,
              selectedColor: AppColors.white,
            ),

            /// Profile
            NavigationBarItem(
              icon: const Icon(Icons.person_2_rounded),
              unselectedColor: AppColors.white,
              selectedColor: AppColors.white,
            ),
          ],
        )
            .animate()
            .moveY(delay: const Duration(seconds: 5), begin: 0, end: 20)
            .fadeIn(),
      ),
    );
  }
}
