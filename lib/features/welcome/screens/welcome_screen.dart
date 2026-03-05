import 'package:bookia/core/constants/app_images.dart';
import 'package:bookia/core/functions/navigations.dart';
import 'package:bookia/core/styles/app_colors.dart';
import 'package:bookia/core/styles/text_styles.dart';
import 'package:bookia/core/widgets/main_button.dart';
import 'package:bookia/features/auth/presentation/screens/login_screen.dart';
import 'package:bookia/features/auth/presentation/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            AppImages.welcome,
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: Column(
              children: [
                Spacer(flex: 1),
                SvgPicture.asset(AppImages.logoSvg),
                Gap(30),
                Text("Order Your Book Now!", style: TextStyles.w400s20),
                Spacer(flex: 4),
                MainButton(
                  text: "Login",
                  onPressed: () {
                    pushTo(LoginScreen(), context);
                  },
                ),
                Gap(15),
                MainButton(
                  text: "Register",
                  onPressed: () {
                    pushTo(RegisterScreen(), context);
                  },
                  color: AppColors.bgColor,
                ),
                Spacer(flex: 1),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
