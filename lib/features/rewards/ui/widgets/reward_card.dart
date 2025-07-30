import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task2_reward_redemption_flow/core/helpers/spacing.dart';
import 'package:task2_reward_redemption_flow/core/theming/color_manger.dart';
import 'package:task2_reward_redemption_flow/core/theming/text_styles.dart';
import 'package:task2_reward_redemption_flow/features/rewards/data/models/reward_model.dart';

class RewardCard extends StatefulWidget {
  final RewardModel reward;
  final int userPoints;
  final VoidCallback onTap;
  final Duration delay;

  const RewardCard({
    super.key,
    required this.reward,
    required this.userPoints,
    required this.onTap,
    required this.delay,
  });

  @override
  State<RewardCard> createState() => _RewardCardState();
}

class _RewardCardState extends State<RewardCard> with SingleTickerProviderStateMixin {
  bool _visible = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(widget.delay, () {
      if (mounted) {
        setState(() {
          _visible = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final canAfford = widget.userPoints >= widget.reward.pointsCost;

    return AnimatedOpacity(
      opacity: _visible ? 1 : 0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeOut,
      child: AnimatedSlide(
        offset: _visible ? Offset.zero : Offset(0, -0.3),
        duration: const Duration(milliseconds: 500),
        curve: Curves.linear,
        child: GestureDetector(
          onTap: widget.onTap,
          child: Container(
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              color: ColorsManager.white,
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(
                color: canAfford
                    ? ColorsManager.mainGreen.withValues(alpha: 0.8)
                    : ColorsManager.darkGray.withValues(alpha: 0.2),
                width: 1.5,
              ),
            ),
            child: Row(
              children: [
                Container(
                  width: 60.w,
                  height: 60.w,
                  decoration: BoxDecoration(
                    color: canAfford
                        ? ColorsManager.lightGreen
                        : ColorsManager.lightGray,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Center(
                    child: Text(widget.reward.imageUrl, style: TextStyle(fontSize: 30.sp)),
                  ),
                ),
                horizontalSpace(16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.reward.name, style: TextStyles.font16GrayMedium),
                      verticalSpace(4),
                      Text(widget.reward.category, style: TextStyles.font14WhiteMedium),
                      verticalSpace(8),
                      Row(
                        children: [
                          Icon(Icons.stars, color: ColorsManager.mainGreen, size: 16.sp),
                          horizontalSpace(4),
                          Text('${widget.reward.pointsCost} point'),
                        ],
                      ),
                    ],
                  ),
                ),
                Icon(Icons.arrow_forward_ios, color: ColorsManager.mainGreen, size: 16.sp),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
