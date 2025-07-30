import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task2_reward_redemption_flow/core/helpers/spacing.dart';
import 'package:task2_reward_redemption_flow/core/theming/color_manger.dart';
import 'package:task2_reward_redemption_flow/core/theming/text_styles.dart';
import 'package:task2_reward_redemption_flow/core/widgets/app_text_button.dart';
import 'package:task2_reward_redemption_flow/features/rewards/data/models/reward_model.dart';
import 'package:task2_reward_redemption_flow/features/rewards/logic/rewards_cubit.dart';
import 'package:task2_reward_redemption_flow/features/rewards/ui/widgets/confirmation_dialog.dart';

class RedeemButtonSection extends StatelessWidget {
  final RewardModel reward;
  final bool canAfford;
  final int userPoints;

  const RedeemButtonSection({
    super.key,
    required this.reward,
    required this.canAfford,
    required this.userPoints,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (!canAfford) ...[
          Container(
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              color: Colors.red.shade50,
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(color: Colors.red.shade200),
            ),
            child: Row(
              children: [
                Icon(Icons.warning_amber,
                    color: Colors.red.shade600,
                    size: 20.sp
                ),
                horizontalSpace(8),
                Expanded(
                  child: Text(
                    'You need ${reward.pointsCost - userPoints} more points',
                    style: TextStyles.font14WhiteMedium.copyWith(
                      color: Colors.red.shade600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          verticalSpace(16),
        ],
        AppTextButton(
          textButton: canAfford ? 'Redeem Reward' : 'Insufficient Points',
          onPressed: canAfford ? () => _showConfirmationDialog(context) : null,
          backgroundColor: canAfford
              ? ColorsManager.mainGreen
              : ColorsManager.lightGray,
          textColor: canAfford
              ? ColorsManager.white
              : Colors.grey.shade600,
        ),
      ],
    );
  }

  void _showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => ConfirmationDialog(
        title: 'Confirm Redemption',
        content: 'Are you sure you want to redeem "${reward.name}"?\n\n'
            '${reward.pointsCost} points will be deducted from your account.',
        confirmText: 'Redeem',
        cancelText: 'Cancel',
        onConfirm: () {
          Navigator.pop(context);
          context.read<RewardsCubit>().redeemReward(reward);
        },
      ),
    );
  }
}