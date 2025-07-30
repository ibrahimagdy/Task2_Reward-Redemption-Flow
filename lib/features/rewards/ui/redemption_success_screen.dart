import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task2_reward_redemption_flow/core/helpers/extensions.dart';
import 'package:task2_reward_redemption_flow/core/helpers/spacing.dart';
import 'package:task2_reward_redemption_flow/core/routes/routes_name.dart';
import 'package:task2_reward_redemption_flow/core/theming/color_manger.dart';
import 'package:task2_reward_redemption_flow/core/theming/text_styles.dart';
import 'package:task2_reward_redemption_flow/core/widgets/app_text_button.dart';

class RedemptionSuccessScreen extends StatelessWidget {
  final int remainingPoints;
  const RedemptionSuccessScreen({super.key, required this.remainingPoints});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(20.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 80.w,
              height: 80.w,
              decoration: BoxDecoration(
                color: ColorsManager.mainGreen,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.check,
                color: ColorsManager.white,
                size: 40.sp,
              ),
            ),
            verticalSpace(24),
            Text(
              'Redemption Successful! 🎉',
              style: TextStyles.font24BlackBold,
              textAlign: TextAlign.center,
            ),
            verticalSpace(8),
            Text(
              'Remaining points: $remainingPoints',
              style: TextStyles.font16GrayMedium,
            ),
            verticalSpace(24),
            AppTextButton(
              textButton: 'Continue',
              onPressed: () {
                context.pushReplacementNamed(Routes.rewardsList);
              },
            ),
          ],
        ),
      ),
    );
  }
}
