import 'package:flutter/material.dart';
import 'package:task2_reward_redemption_flow/core/helpers/extensions.dart';
import 'package:task2_reward_redemption_flow/core/helpers/spacing.dart';
import 'package:task2_reward_redemption_flow/core/routes/routes_name.dart';
import 'package:task2_reward_redemption_flow/features/rewards/data/models/reward_model.dart';
import 'package:task2_reward_redemption_flow/features/rewards/ui/widgets/reward_card.dart';

class RewardsList extends StatelessWidget {
  final List<RewardModel> rewards;
  final int userPoints;

  const RewardsList({
    super.key,
    required this.rewards,
    required this.userPoints,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: rewards.length,
      separatorBuilder: (context, index) => verticalSpace(12),
      itemBuilder: (context, index) {
        final reward = rewards[index];
        return RewardCard(
          reward: reward,
          userPoints: userPoints,
          delay: Duration(milliseconds: 100 * index),
          onTap: () => context.pushNamed(Routes.rewardDetails, arguments: reward),
        );
      },
    );
  }
}