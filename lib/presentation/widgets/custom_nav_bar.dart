import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomNavBar extends StatelessWidget {
  final List<NavigationBarItem> items;
  final int currentIndex;
  final Function(int)? onTap;
  final Color? selectedItemColor;
  final Color? unselectedItemColor;
  final EdgeInsets margin;
  final EdgeInsets itemPadding;
  final Duration duration;
  final Curve curve;
  final double? borderRadius;
  final Color? backgroundColor;
  final Color? splashColor;
  final double? splashBorderRadius;
  const BottomNavBar(
      {super.key,
      required this.items,
      this.currentIndex = 0,
      this.onTap,
      this.selectedItemColor,
      this.unselectedItemColor,
      this.margin = const EdgeInsets.all(8),
      this.itemPadding =
          const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      this.duration = const Duration(milliseconds: 500),
      this.curve = Curves.easeOutQuint,
      this.borderRadius = 30,
      this.splashBorderRadius,
      this.backgroundColor = Colors.white,
      this.splashColor});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BottomAppBar(
      elevation: 0,
      height: 90.h,
      color: Colors.transparent,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(borderRadius!)),
            child: NavBarItem(
                items: items,
                currentIndex: currentIndex,
                curve: curve,
                duration: duration,
                selectedItemColor: selectedItemColor,
                theme: theme,
                unselectedItemColor: unselectedItemColor,
                onTap: onTap!,
                itemPadding: itemPadding,
                enablePaddingAnimation: false,
                splashColor: splashColor,
                splashBorderRadius: splashBorderRadius),
          ),
        ],
      ),
    );
  }
}

class NavBarItem extends StatelessWidget {
  const NavBarItem({
    super.key,
    required this.items,
    required this.currentIndex,
    required this.curve,
    required this.duration,
    required this.selectedItemColor,
    required this.theme,
    required this.unselectedItemColor,
    required this.onTap,
    required this.itemPadding,
    required this.enablePaddingAnimation,
    this.splashBorderRadius,
    this.splashColor,
  });

  final List<NavigationBarItem> items;
  final int currentIndex;
  final Curve curve;
  final Duration duration;
  final Color? selectedItemColor;
  final ThemeData theme;
  final Color? unselectedItemColor;
  final Function(int index) onTap;
  final EdgeInsets itemPadding;
  final bool enablePaddingAnimation;
  final Color? splashColor;
  final double? splashBorderRadius;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        for (final item in items)
          TweenAnimationBuilder<double>(
            tween: Tween(
              end: items.indexOf(item) == currentIndex ? 1.0 : 0.0,
            ),
            curve: curve,
            duration: duration,
            builder: (context, t, _) {
              final selectedColor =
                  item.selectedColor ?? selectedItemColor ?? theme.primaryColor;

              final unselectedColor = item.unselectedColor ??
                  unselectedItemColor ??
                  theme.iconTheme.color;

              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                padding: EdgeInsets.all(
                    items.indexOf(item) == currentIndex ? 10 : 6),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: items.indexOf(item) == currentIndex
                      ? selectedItemColor
                      : unselectedItemColor,
                ),
                child: InkWell(
                  onTap: () => onTap.call(items.indexOf(item)),
                  splashColor: splashColor ?? selectedColor.withOpacity(0.1),
                  hoverColor: splashColor ?? selectedColor.withOpacity(0.1),
                  child: Row(
                    children: [
                      IconTheme(
                        data: IconThemeData(
                          color: Color.lerp(unselectedColor, selectedColor, t),
                          size: 24,
                        ),
                        child: item.icon,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
      ],
    );
  }
}

class NavigationBarItem {
  /// An icon to display.
  final Widget icon;

  /// A primary color to use for this tab.
  final Color? selectedColor;

  /// The color to display when this tab is not selected.
  final Color? unselectedColor;

  NavigationBarItem({
    required this.icon,
    this.selectedColor,
    this.unselectedColor,
  });
}
