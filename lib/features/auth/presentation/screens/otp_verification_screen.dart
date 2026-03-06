import 'package:bookia/core/constants/app_images.dart';
import 'package:bookia/core/functions/navigations.dart';
import 'package:bookia/core/styles/app_colors.dart';
import 'package:bookia/core/styles/text_styles.dart';
import 'package:bookia/core/widgets/main_button.dart';
import 'package:bookia/features/auth/presentation/screens/create_new_password_screen.dart';
import 'package:bookia/features/auth/presentation/widgets/auth_footer.dart';
import 'package:bookia/features/auth/presentation/widgets/pin_code_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class OtpVerificationScreen extends StatelessWidget {
  const OtpVerificationScreen({super.key, this.pinController});
  final TextEditingController? pinController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            pop(context);
          },
          icon: SvgPicture.asset(AppImages.backIconsvg),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("OTP Verification", style: TextStyles.w400s30),
            Gap(10),
            Text(
              "Enter the verification code we just sent on your email address.",
              style: TextStyles.w400s16.copyWith(color: AppColors.grayColor),
            ),
            Gap(35),
            PinCodeSection(controller: pinController),
            Gap(35),
            MainButton(
              text: "Verify",
              onPressed: () {
                pushTo(CreateNewPasswordScreen(), context);
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: AuthFooter(
        text: "Didn’t received code?",
        textButton: "Resend",
      ),
    );
  }
}
