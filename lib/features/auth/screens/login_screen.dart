import 'package:bookia/core/constants/app_images.dart';
import 'package:bookia/core/functions/navigations.dart';
import 'package:bookia/core/styles/app_colors.dart';
import 'package:bookia/core/styles/text_styles.dart';
import 'package:bookia/core/widgets/custom_text_form_field.dart';
import 'package:bookia/core/widgets/main_button.dart';
import 'package:bookia/core/widgets/password_text_form_field.dart';
import 'package:bookia/features/auth/widgets/auth_footer.dart';
import 'package:bookia/features/auth/widgets/social_auth_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
          children: [
            Text(
              "Welcome back! Glad to see you, Again!",
              style: TextStyles.w400s30,
            ),
            Gap(32),
            CustomTextFormField(hint: "Enter your email"),
            Gap(15),
            PasswordTextFormField(),
            Gap(15),
            TextButton(
              onPressed: () {},
              child: Align(
                alignment: AlignmentGeometry.centerRight,
                child: Text(
                  "Forgot Password?",
                  style: TextStyles.w400s14.copyWith(color: AppColors.darkGray),
                ),
              ),
            ),
            Gap(30),
            MainButton(text: "Login", onPressed: () {}),
            Gap(30),
            Row(
              children: [
                Expanded(child: Divider()),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 45),
                  child: Text(
                    "Or",
                    style: TextStyles.w400s14.copyWith(
                      color: AppColors.darkGray,
                    ),
                  ),
                ),
                Expanded(child: Divider()),
              ],
            ),
            Gap(30),
            SocialAuthButton(
              iconPath: AppImages.googleIconSvg,
              text: "Sign in with Google",
              onTap: () {},
            ),
            Gap(15),
            SocialAuthButton(
              iconPath: AppImages.appleIconSvg,
              text: "Sign in with Apple",
            ),
          ],
        ),
      ),
      bottomNavigationBar: AuthFooter(
        text: "Don’t have an account?",
        textButton: "Register Now",
      ),
    );
  }
}
