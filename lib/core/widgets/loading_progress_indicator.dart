import 'package:flutter/material.dart';
import 'package:task2_reward_redemption_flow/core/helpers/spacing.dart';
import 'package:task2_reward_redemption_flow/core/theming/color_manger.dart';
import 'package:task2_reward_redemption_flow/core/theming/text_styles.dart';

class LoadingProgressIndicator extends StatelessWidget {
  final String message;

  const LoadingProgressIndicator({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(color: ColorsManager.mainGreen),
          verticalSpace(16),
          Text(message, style: TextStyles.font16GrayMedium),
        ],
      ),
    );
  }
}