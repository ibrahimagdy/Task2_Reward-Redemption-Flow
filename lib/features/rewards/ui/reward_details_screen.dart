import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task2_reward_redemption_flow/core/helpers/extensions.dart';
import 'package:task2_reward_redemption_flow/core/helpers/spacing.dart';
import 'package:task2_reward_redemption_flow/core/theming/color_manger.dart';
import 'package:task2_reward_redemption_flow/core/theming/text_styles.dart';
import 'package:task2_reward_redemption_flow/core/widgets/app_text_button.dart';
import 'package:task2_reward_redemption_flow/core/widgets/custom_snack_bar.dart';
import 'package:task2_reward_redemption_flow/features/rewards/data/models/reward_model.dart';
import 'package:task2_reward_redemption_flow/features/rewards/logic/rewards_cubit.dart';
import 'package:task2_reward_redemption_flow/features/rewards/logic/rewards_state.dart';
import 'package:task2_reward_redemption_flow/features/rewards/ui/widgets/confirmation_dialog.dart';
import 'package:task2_reward_redemption_flow/features/rewards/ui/widgets/reward_image_section.dart';
import 'package:task2_reward_redemption_flow/features/rewards/ui/widgets/reward_info_section.dart';

class RewardDetailsScreen extends StatelessWidget {
  final RewardModel reward;

  const RewardDetailsScreen({super.key, required this.reward});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reward Details', style: TextStyles.font16WhiteMedium),
      ),
      body: BlocConsumer<RewardsCubit, RewardsState>(
        listener: (context, state) {
          if (state is RedemptionSuccess) {
            context.pop();
          } else if (state is RewardsError) {
            CustomSnackBar.showError(context, state.message);
          }
        },
        builder: (context, state) {
          if (state is RewardsLoaded) {
            final canAfford = state.userPoints >= reward.pointsCost;
            return SingleChildScrollView(
              padding: EdgeInsets.all(20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RewardImageSection(reward: reward, canAfford: canAfford),
                  verticalSpace(24),
                  RewardInfoSection(reward: reward, canAfford: canAfford),
                  verticalSpace(36),
                  AppTextButton(
                    textButton: 'Redeem Reward',
                    onPressed:
                    canAfford
                        ? () {
                      showDialog(
                        context: context,
                        builder:
                            (_) => ConfirmationDialog(
                          title: 'Confirm Redemption',
                          content:
                          'Are you sure you want to redeem this reward? ${reward.pointsCost} points will be deducted.',
                          confirmText: 'Confirm',
                          cancelText: 'Cancel',
                          onConfirm: () {
                            Navigator.pop(context);
                            context
                                .read<RewardsCubit>()
                                .redeemReward(reward);
                          },
                        ),
                      );
                    }
                        : null,
                    backgroundColor:
                    canAfford
                        ? ColorsManager.mainGreen
                        : ColorsManager.lightGray,
                    textColor:
                    canAfford ? ColorsManager.white : Colors.grey.shade600,
                  ),
                ],
              ),
            );
          } else if (state is RewardsLoading || state is RedemptionLoading) {
            return Center(
              child: CircularProgressIndicator(color: ColorsManager.mainGreen),
            );
          } else {
            return Center(
              child: Text(
                'Failed to load reward details',
                style: TextStyles.font16GrayMedium,
              ),
            );
          }
        },
      ),
    );
  }
}