import 'package:bookia/core/constants/app_images.dart';
import 'package:bookia/core/functions/navigations.dart';
import 'package:bookia/core/styles/app_colors.dart';
import 'package:bookia/core/styles/text_styles.dart';
import 'package:bookia/core/widgets/custom_text_form_field.dart';
import 'package:bookia/core/widgets/main_button.dart';
import 'package:bookia/features/auth/functions/app_validators.dart';
import 'package:bookia/features/auth/screens/otp_verification_screen.dart';
import 'package:bookia/features/auth/widgets/auth_footer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({super.key});

  final formKey = GlobalKey<FormState>();

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
        child: Form(
          key: formKey,
          autovalidateMode: AutovalidateMode.onUnfocus,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Forgot Password?", style: TextStyles.w400s30),
              Gap(10),
              Text(
                "Don't worry! It occurs. Please enter the email address linked with your account.",
                style: TextStyles.w400s16.copyWith(color: AppColors.grayColor),
              ),
              Gap(30),
              CustomTextFormField(
                hint: "Enter Your Email",
                validator: AppValidators.email,
              ),
              Gap(40),
              MainButton(
                text: "Send Code",
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    pushTo(OtpVerificationScreen(), context);
                  }
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: AuthFooter(
        text: "Remember Password?",
        textButton: "Login",
        onPressed: () => pop(context),
      ),
    );
  }
}
