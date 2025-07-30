import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task2_reward_redemption_flow/core/helpers/spacing.dart';
import 'package:task2_reward_redemption_flow/core/theming/color_manger.dart';
import 'package:task2_reward_redemption_flow/core/theming/text_styles.dart';
import 'package:task2_reward_redemption_flow/features/rewards/data/models/reward_model.dart';

class RewardInfoSection extends StatelessWidget {
  final RewardModel reward;
  final bool canAfford;

  const RewardInfoSection({
    super.key,
    required this.reward,
    required this.canAfford,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(reward.name, style: TextStyles.font18BlackSemiBold),
        verticalSpace(8),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
          decoration: BoxDecoration(
            color: ColorsManager.lightGreen,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Text(
            reward.category,
            style: TextStyles.font14WhiteMedium.copyWith(
              color: ColorsManager.mainGreen,
              fontSize: 12.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        verticalSpace(16),
        Text(reward.description, style: TextStyles.font16GrayMedium),
        verticalSpace(24),
        Container(
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: canAfford
                ? ColorsManager.lightGreen
                : ColorsManager.lightGray.withValues(alpha: 0.5),
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(
              color: canAfford
                  ? ColorsManager.mainGreen.withValues(alpha: 0.3)
                  : ColorsManager.darkGray.withValues(alpha: 0.2),
            ),
          ),
          child: Row(
            children: [
              Icon(
                Icons.stars,
                color: canAfford
                    ? ColorsManager.mainGreen
                    : ColorsManager.darkGray,
                size: 24.sp,
              ),
              horizontalSpace(8),
              Text(
                '${reward.pointsCost} points required',
                style: TextStyles.font16GrayMedium.copyWith(
                  color: canAfford
                      ? ColorsManager.mainGreen
                      : ColorsManager.darkGray,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}