import 'package:bookia/core/constants/app_images.dart';
import 'package:bookia/core/functions/navigations.dart';
import 'package:bookia/core/styles/app_colors.dart';
import 'package:bookia/core/styles/text_styles.dart';
import 'package:bookia/core/widgets/custom_text_form_field.dart';
import 'package:bookia/core/widgets/main_button.dart';
import 'package:bookia/core/widgets/password_text_form_field.dart';
import 'package:bookia/features/auth/functions/validators.dart';
import 'package:bookia/features/auth/screens/forget_password.dart';
import 'package:bookia/features/auth/screens/register_screen.dart';
import 'package:bookia/features/auth/widgets/auth_footer.dart';
import 'package:bookia/features/auth/widgets/social_auth_button.dart';
import 'package:bookia/features/home/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
      body: Form(
        key: formKey,
        autovalidateMode: AutovalidateMode.onUnfocus,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(22),
            child: Column(
              children: [
                Text(
                  "Welcome back! Glad to see you, Again!",
                  style: TextStyles.w400s30,
                ),
                Gap(32),
                CustomTextFormField(
                  hint: "Enter your email",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter Your Email";
                    } else if (!isEmailValid(value)) {
                      return "Please Enter The Right Email";
                    }
                    return null;
                  },
                ),
                Gap(15),
                PasswordTextFormField(
                  validator: (input) {
                    if (input == null || input.isEmpty) {
                      return "Please Enter Your Password";
                    } else if (!isPasswordValid(input)) {
                      return "Password Should Be (6+ chars, upper, lower, digit)";
                    }
                    return null;
                  },
                ),
                Gap(15),
                TextButton(
                  onPressed: () {},
                  child: Align(
                    alignment: AlignmentGeometry.centerRight,
                    child: GestureDetector(
                      onTap: () => pushTo(ForgetPasswordScreen(), context),
                      child: Text(
                        "Forgot Password?",
                        style: TextStyles.w400s14.copyWith(
                          color: AppColors.darkGray,
                        ),
                      ),
                    ),
                  ),
                ),
                Gap(30),
                MainButton(
                  text: "Login",
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      pushReplacment(HomeScreen(), context);
                    }
                  },
                ),
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
        ),
      ),
      bottomNavigationBar: AuthFooter(
        text: "Don’t have an account?",
        textButton: "Register Now",
        onPressed: () => pushTo(RegisterScreen(), context),
      ),
    );
  }
}
