import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task2_reward_redemption_flow/core/theming/color_manger.dart';
import 'package:task2_reward_redemption_flow/features/rewards/data/models/reward_model.dart';

class RewardImageSection extends StatelessWidget {
  final RewardModel reward;
  final bool canAfford;

  const RewardImageSection({
    super.key,
    required this.reward,
    required this.canAfford,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        width: 120.w,
        height: 120.w,
        decoration: BoxDecoration(
          color: canAfford
              ? ColorsManager.lightGreen
              : ColorsManager.lightGray,
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: canAfford ? [
            BoxShadow(
              color: ColorsManager.mainGreen.withValues(alpha: 0.3),
              blurRadius: 15,
              spreadRadius: 2,
              offset: Offset(0, 5),
            ),
          ] : [],
        ),
        child: Center(
          child: Text(
            reward.imageUrl,
            style: TextStyle(fontSize: 60.sp),
          ),
        ),
      ),
    );
  }
}
