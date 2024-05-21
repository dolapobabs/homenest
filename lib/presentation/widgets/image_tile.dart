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
            children: [
              FutureBuilder(
                future: Future.delayed(const Duration(seconds: 4)),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return AdressSlider(address: address);
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              )

              // AddressTileSlider(address: address)
            ],
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

class AdressSlider extends StatefulWidget {
  const AdressSlider({super.key, required this.address});
  final String address;

  @override
  _AdressSliderState createState() => _AdressSliderState();
}

class _AdressSliderState extends State<AdressSlider> {
  bool _isAnimationEnded = false;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
        curve: Curves.easeInCubic,
        tween: Tween<double>(begin: 1, end: MediaQuery.of(context).size.width),
        duration: const Duration(seconds: 1),
        onEnd: () {
          setState(() {
            _isAnimationEnded = true;
          });
        },
        builder: (context, value, child) {
          if (value > 60.w) {
            return SizedBox(
              width: value,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0.r),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 10.0,
                    sigmaY: 10.0,
                    tileMode: TileMode.mirror,
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(1),
                    decoration: BoxDecoration(
                      color: Colors.white70,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        if (_isAnimationEnded)
                          Expanded(
                            child: Center(
                              child: Text(
                                widget.address,
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context)
                                    .textTheme
                                    .normal10Text, // Adjust this as needed
                              ),
                            ).animate().slideX(
                                // duration: 1.seconds,
                                curve: Curves.fastLinearToSlowEaseIn),
                          ),
                        CircleAvatar(
                          backgroundColor: Colors.orange.shade50,
                          radius: 20.0.r,
                          child: const Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.grey,
                            size: 10.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
          return CircleAvatar(
            backgroundColor: Colors.orange.shade50,
            radius: 20.0.r,
            child: const Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey,
              size: 10.0,
            ),
          ).animate().slideX(curve: Curves.fastLinearToSlowEaseIn);
        });
  }
}
