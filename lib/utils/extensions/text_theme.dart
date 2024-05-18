import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../app_colors.dart';

extension ThemeText on TextTheme {
  TextStyle get defaultNormalText => const TextStyle(
      fontFamily: "Euclid-Circular", fontWeight: FontWeight.w400);
  TextStyle get defaultBoldText => const TextStyle(
      fontFamily: "Euclid-Circular", fontWeight: FontWeight.w700);
  TextStyle get defaultSemiBoldText => const TextStyle(
      fontFamily: "Euclid-Circular", fontWeight: FontWeight.w600);
  TextStyle get defaultMediumText => const TextStyle(
      fontFamily: "Euclid-Circular", fontWeight: FontWeight.w500);
  TextStyle get normalText =>
      defaultNormalText.copyWith(fontWeight: FontWeight.w400);

  TextStyle get normal22Text => defaultNormalText.copyWith(fontSize: 22.sp);
  TextStyle get normal10Text => defaultNormalText.copyWith(fontSize: 10.sp);
  TextStyle get normal16Text => defaultNormalText.copyWith(fontSize: 16.sp);
  TextStyle get normal14Text => defaultNormalText.copyWith(fontSize: 14.sp);
  TextStyle get normal12Text => defaultNormalText.copyWith(fontSize: 12.sp);
  TextStyle get normal8Text => defaultNormalText.copyWith(fontSize: 8.sp);
  TextStyle get headerText => defaultMediumText.copyWith(fontSize: 18.sp);
  TextStyle get titleText => defaultBoldText.copyWith(fontSize: 18.sp);
  TextStyle get bold8Text => defaultBoldText.copyWith(fontSize: 8.sp);
  TextStyle get bold14Text => defaultBoldText.copyWith(fontSize: 14.sp);
  TextStyle get bold16Text => defaultBoldText.copyWith(fontSize: 16.sp);
  TextStyle get bold12Text => defaultBoldText.copyWith(fontSize: 12.sp);
  TextStyle get bold24Text => defaultBoldText.copyWith(fontSize: 24.sp);
  TextStyle get bold28Text => defaultBoldText.copyWith(fontSize: 28.sp);
  TextStyle get semiBold14Text => defaultSemiBoldText.copyWith(fontSize: 14.sp);
  TextStyle get semiBold12Text => defaultSemiBoldText.copyWith(fontSize: 12.sp);
  TextStyle get semiBold16Text => defaultSemiBoldText.copyWith(fontSize: 16.sp);
  TextStyle get semiBold11Text => defaultSemiBoldText.copyWith(fontSize: 11.sp);
  TextStyle get semiBold10Text => defaultSemiBoldText.copyWith(fontSize: 10.sp);
  TextStyle get semiBold8Text => defaultSemiBoldText.copyWith(fontSize: 8.sp);
  TextStyle get semiBold6Text => defaultSemiBoldText.copyWith(fontSize: 6.sp);
  TextStyle get semiBold32Text => defaultSemiBoldText.copyWith(fontSize: 32.sp);
  TextStyle get medium14Text => defaultMediumText.copyWith(fontSize: 14.sp);
  TextStyle get medium11Text => defaultMediumText.copyWith(fontSize: 11.sp);
  TextStyle get medium8Text => defaultMediumText.copyWith(fontSize: 8.sp);
  TextStyle get medium12Text => defaultMediumText.copyWith(fontSize: 12.sp);
  TextStyle get textFieldText => defaultNormalText.copyWith(fontSize: 12.sp);
  TextStyle get textFieldTitle => defaultMediumText.copyWith(fontSize: 10.sp);
  TextStyle get medium16Text => defaultMediumText.copyWith(fontSize: 16.sp);
  TextStyle get medium20Text => defaultMediumText.copyWith(fontSize: 16.sp);
  TextStyle get medium24Text => defaultMediumText.copyWith(fontSize: 24.sp);
  TextStyle get titleHeader =>
      defaultNormalText.copyWith(fontSize: 18.sp, color: AppColors.grey);
  TextStyle get subTitle => defaultMediumText.copyWith(fontSize: 26.sp);
}
