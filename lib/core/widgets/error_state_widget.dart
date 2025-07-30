import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task2_reward_redemption_flow/core/helpers/spacing.dart';
import 'package:task2_reward_redemption_flow/core/theming/color_manger.dart';
import 'package:task2_reward_redemption_flow/core/theming/text_styles.dart';
import 'package:task2_reward_redemption_flow/core/widgets/app_text_button.dart';

class ErrorStateWidget extends StatelessWidget {
  final String message;
  final void Function() onPressed;
  const ErrorStateWidget({super.key, required this.message, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline,
            size: 64.sp,
            color: ColorsManager.red,
          ),
          verticalSpace(16),
          Text(
            message,
            style: TextStyles.font16GrayMedium,
            textAlign: TextAlign.center,
          ),
          verticalSpace(24),
          AppTextButton(
            onPressed: onPressed,
            textButton: 'Retry',
          ),
        ],
      ),
    );
  }
}
