import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task2_reward_redemption_flow/core/helpers/spacing.dart';
import 'package:task2_reward_redemption_flow/core/theming/color_manger.dart';
import 'package:task2_reward_redemption_flow/core/theming/text_styles.dart';

class UserPointsHeader extends StatelessWidget {
  final int points;

  const UserPointsHeader({super.key, required this.points});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            ColorsManager.mainGreen,
            ColorsManager.mainGreen.withValues(alpha: 0.5),
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: ColorsManager.mainGreen.withValues(alpha: 0.3),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 60.w,
            height: 60.w,
            decoration: BoxDecoration(
              color: ColorsManager.white.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Icon(Icons.stars, color: ColorsManager.white, size: 30.sp),
          ),
          horizontalSpace(16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Your Current Points',
                  style: TextStyles.font14WhiteMedium.copyWith(
                    color: ColorsManager.white.withValues(alpha: 0.9),
                  ),
                ),
                verticalSpace(4),
                Text(
                  points.toString(),
                  style: TextStyles.font24BlackBold.copyWith(
                    color: ColorsManager.white,
                    fontSize: 28.sp,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
