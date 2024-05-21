import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:homenest/utils/app_colors.dart';
import 'package:homenest/utils/extensions/text_theme.dart';

class MenuItem {
  final String name;
  final String icon;

  MenuItem({required this.name, required this.icon});
}

class CustomPopupMenuButton extends StatefulWidget {
  const CustomPopupMenuButton(
      {super.key, required this.icon, required this.menuitems});
  final Widget icon;
  final List<MenuItem> menuitems;
  @override
  State<CustomPopupMenuButton> createState() => _CustomPopupMenuButtonState();
}

class _CustomPopupMenuButtonState extends State<CustomPopupMenuButton> {
  String _selectedItem = '';

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<MenuItem>(
      elevation: 0,
      // useRootNavigator: true,
      clipBehavior: Clip.antiAlias,
      popUpAnimationStyle: AnimationStyle.noAnimation,
      offset: const Offset(20, -180),
      color: Colors.orange.shade50,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      // position: PopupMenuPosition.under,
      icon: CircleAvatar(
        backgroundColor: Colors.white.withOpacity(0.3),
        radius: 25,
        child: widget.icon,
      ),
      onSelected: (MenuItem item) {
        setState(() {
          _selectedItem = item.name;
        });
      },
      itemBuilder: (BuildContext context) {
        return widget.menuitems.map((MenuItem item) {
          return PopupMenuItem<MenuItem>(
            // padding: EdgeInsets.zero,
            height: 40.h,
            value: item,
            child: Row(
              children: [
                SvgPicture.asset(item.icon,
                    height: 24,
                    colorFilter: ColorFilter.mode(
                        _selectedItem == item.name
                            ? Colors.orange.shade500
                            : AppColors.grey,
                        BlendMode.srcIn)),
                8.horizontalSpace,
                Text(item.name,
                    style: Theme.of(context).textTheme.normal10Text.copyWith(
                          color: _selectedItem == item.name
                              ? Colors.orange.shade500
                              : AppColors.grey,
                        )),
              ],
            ),
          );
        }).toList();
      },
    );
  }
}
