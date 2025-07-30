import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task2_reward_redemption_flow/core/helpers/spacing.dart';
import 'package:task2_reward_redemption_flow/core/theming/color_manger.dart';
import 'package:task2_reward_redemption_flow/core/theming/text_styles.dart';
import 'package:task2_reward_redemption_flow/core/widgets/app_text_button.dart';

class ConfirmationDialog extends StatelessWidget {
  final String title;
  final String content;
  final String confirmText;
  final String cancelText;
  final VoidCallback onConfirm;

  const ConfirmationDialog({
    super.key,
    required this.title,
    required this.content,
    required this.confirmText,
    required this.cancelText,
    required this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: ColorsManager.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
      ),
      title: Center(
        child: Text(
          title,
          style: TextStyles.font18BlackSemiBold,
        ),
      ),
      content: Text(
        content,
        style: TextStyles.font16GrayMedium,
      ),
      actionsPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      actions: [
        AppTextButton(
          textButton: cancelText,
          onPressed: () => Navigator.pop(context),
          backgroundColor: ColorsManager.lightGray,
          textColor: ColorsManager.darkGray,
        ),
        verticalSpace(12),
        AppTextButton(
          textButton: confirmText,
          onPressed: onConfirm,
          backgroundColor: ColorsManager.mainGreen,
          textColor: ColorsManager.white,
        ),
      ],
    );
  }
}
