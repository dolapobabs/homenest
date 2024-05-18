import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homenest/utils/app_colors.dart';
import 'package:homenest/utils/extensions/text_theme.dart';

class ImageTile extends StatelessWidget {
  const ImageTile(
      {super.key,
      required this.index,
      required this.url,
      required this.address});
  final String address;
  final int index;
  final String url;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(url),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(20.0.r),
          ),
        ),
        Positioned(
          bottom: 12.0,
          left: 10.0,
          right: 10.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [AddressTileSlider(address: address)],
          ),
        ),
      ],
    );
  }
}

class AddressTileSlider extends StatelessWidget {
  const AddressTileSlider({
    super.key,
    required this.address,
  });

  final String address;

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: Container(
          padding: const EdgeInsets.all(1),
          decoration: BoxDecoration(
            color: Colors.white70,
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.center,
            // mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    address,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .normal12Text, // Adjust this as needed
                  ),
                ),
              ),
              Expanded(
                flex: 0,
                child: Align(
                  alignment: Alignment.center,
                  child: CircleAvatar(
                    backgroundColor: Colors.orange.shade50,
                    radius: 20.r,
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors.grey,
                      size: 10.r,
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
            .animate(delay: 3.seconds)
            .slideX(duration: 2.seconds, curve: Curves.linear),
      ),
    );
  }
}
