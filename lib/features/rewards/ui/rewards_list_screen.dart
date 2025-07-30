import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task2_reward_redemption_flow/core/helpers/spacing.dart';
import 'package:task2_reward_redemption_flow/core/theming/text_styles.dart';
import 'package:task2_reward_redemption_flow/core/widgets/custom_snack_bar.dart';
import 'package:task2_reward_redemption_flow/core/widgets/error_state_widget.dart';
import 'package:task2_reward_redemption_flow/core/widgets/loading_progress_indicator.dart';
import 'package:task2_reward_redemption_flow/features/rewards/logic/rewards_cubit.dart';
import 'package:task2_reward_redemption_flow/features/rewards/logic/rewards_state.dart';
import 'package:task2_reward_redemption_flow/features/rewards/ui/redemption_success_screen.dart';
import 'package:task2_reward_redemption_flow/features/rewards/ui/widgets/rewards_list.dart';
import 'package:task2_reward_redemption_flow/features/rewards/ui/widgets/user_points_header.dart';

class RewardsListScreen extends StatelessWidget {
  const RewardsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Drop Me Rewards', style: TextStyles.font16WhiteMedium),
      ),
      body: BlocConsumer<RewardsCubit, RewardsState>(
        listener: (context, state) {
          if (state is RewardsError) {
            CustomSnackBar.showError(context, state.message);
          }
        },
        builder: (context, state) {
          return state.when(
            initial: () => Center(child: Text('Start exploring rewards')),
            loading:
                () => LoadingProgressIndicator(message: 'Loading rewards...'),
            loaded:
                (rewards, userPoints) => SingleChildScrollView(
                  padding: EdgeInsets.all(16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      UserPointsHeader(points: userPoints),
                      verticalSpace(24),
                      Text(
                        'Available Rewards',
                        style: TextStyles.font18BlackSemiBold,
                      ),
                      verticalSpace(16),
                      RewardsList(rewards: rewards, userPoints: userPoints),
                    ],
                  ),
                ),
            redemptionLoading:
                () => LoadingProgressIndicator(message: 'Loading rewards...'),
            redemptionSuccess:
                (reward, remainingPoints) =>
                    RedemptionSuccessScreen(remainingPoints: remainingPoints),
            error:
                (message) => ErrorStateWidget(
                  message: message,
                  onPressed: () => context.read<RewardsCubit>().loadRewards(),
                ),
          );
        },
      ),
    );
  }
}
