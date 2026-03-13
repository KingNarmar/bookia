import 'package:bookia/core/constants/app_images.dart';
import 'package:bookia/core/functions/navigations.dart';
import 'package:bookia/core/routes/routes.dart';
import 'package:bookia/core/styles/app_colors.dart';
import 'package:bookia/core/styles/text_styles.dart';
import 'package:bookia/core/widgets/main_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class PasswordChangedScreen extends StatelessWidget {
  const PasswordChangedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(22),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(AppImages.successSvg),
              Gap(35),
              Text("Password Changed!", style: TextStyles.w400s26),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 53),
                child: Text(
                  "Your password has been changed successfully.",
                  style: TextStyles.w400s15.copyWith(
                    color: AppColors.grayColor,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Gap(40),
              MainButton(
                text: "Back to Login",
                onPressed: () {
                  pushAndClearStack(Routes.login, context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
