import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:homenest/utils/app_colors.dart';
import 'package:homenest/utils/extensions/text_theme.dart';

import '../../utils/app_assets.dart';

class CustomSearchBar extends StatefulWidget {
  final String hintText;
  final double? borderRadius;
  final EdgeInsetsGeometry? padding;
  final Function(String?) onSearch;
  final Color textColor;
  final TextEditingController? controller;
  final String? icon;
  const CustomSearchBar(
      {super.key,
      required this.hintText,
      required this.onSearch,
      this.padding,
      this.controller,
      this.textColor = AppColors.grey,
      this.icon,
      this.borderRadius});

  @override
  _CustomSearchBarState createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  late TextEditingController _textEditingController;
  @override
  void initState() {
    super.initState();
    _textEditingController = widget.controller ?? TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: widget.padding ??
          EdgeInsets.symmetric(horizontal: 12.0.w, vertical: 5.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.borderRadius ?? 30.r),
          color: AppColors.white,
          border: Border.all(color: Colors.transparent)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SvgPicture.asset(
            widget.icon ?? AppAssets.searchLine,
            height: 20.r,
            colorFilter: ColorFilter.mode(widget.textColor, BlendMode.srcIn),
          ),
          // 5.horizontalSpace,
          Expanded(
            child: TextField(
              controller: _textEditingController,
              decoration: InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.zero,
                  fillColor: Colors.transparent,
                  hintText: widget.hintText,
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none),
              style: Theme.of(context)
                  .textTheme
                  .normal10Text
                  .copyWith(color: widget.textColor),
              onSubmitted: (String value) {
                widget.onSearch(value);
              },
            ),
          ),
        ],
      ),
    );
  }
}
