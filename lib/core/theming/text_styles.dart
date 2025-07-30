import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task2_reward_redemption_flow/core/theming/color_manger.dart';
import 'package:task2_reward_redemption_flow/core/theming/font_weight_helper.dart';

class TextStyles {
  static TextStyle font14WhiteMedium = GoogleFonts.poppins(
    fontSize: 14.sp,
    color: ColorsManager.white,
    fontWeight: FontWeightHelper.medium,
  );
  static TextStyle font16WhiteMedium = GoogleFonts.poppins(
    fontSize: 16.sp,
    color: ColorsManager.white,
    fontWeight: FontWeightHelper.medium,
  );
  static TextStyle font20WhiteMedium = GoogleFonts.poppins(
    fontSize: 20.sp,
    color: ColorsManager.white,
    fontWeight: FontWeightHelper.medium,
  );
  static TextStyle font16GrayMedium = TextStyle(
    fontSize: 16.sp,
    color: ColorsManager.darkGray,
    fontWeight: FontWeightHelper.medium,
  );
  static TextStyle font18BlackSemiBold = TextStyle(
    fontSize: 18.sp,
    color: ColorsManager.black,
    fontWeight: FontWeightHelper.semiBold,
  );
  static TextStyle font16GreenBold = TextStyle(
    fontSize: 16.sp,
    color: ColorsManager.mainGreen,
    fontWeight: FontWeightHelper.bold,
  );
  static TextStyle font24BlackBold = TextStyle(
    fontSize: 24.sp,
    color: ColorsManager.black,
    fontWeight: FontWeightHelper.bold,
  );


}