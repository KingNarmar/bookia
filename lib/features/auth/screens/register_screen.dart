import 'package:bookia/core/constants/app_images.dart';
import 'package:bookia/core/functions/navigations.dart';
import 'package:bookia/core/styles/text_styles.dart';
import 'package:bookia/core/widgets/custom_text_form_field.dart';
import 'package:bookia/core/widgets/main_button.dart';
import 'package:bookia/core/widgets/password_text_form_field.dart';
import 'package:bookia/features/auth/functions/validators.dart';
import 'package:bookia/features/auth/widgets/auth_footer.dart';
import 'package:bookia/features/home/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formKey = GlobalKey<FormState>();
  String _password = "";
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(22),
          child: Form(
            key: formKey,
            autovalidateMode: AutovalidateMode.onUnfocus,
            child: Column(
              children: [
                Text(
                  "Hello! Register to get started",
                  style: TextStyles.w400s30,
                ),
                Gap(32),
                CustomTextFormField(
                  hint: "Username",
                  validator: (input) {
                    if (input == null || input.isEmpty) {
                      return "Please Enter the User Name ";
                    } else if (!isNameValid(input) || input.length < 3) {
                      return "Please Enter Valid Name More than 3 Chr";
                    }
                    return null;
                  },
                ),
                Gap(11),
                CustomTextFormField(
                  hint: "Email",
                  validator: (input) {
                    if (input == null || input.isEmpty) {
                      return "Enter Your Email";
                    } else if (!isEmailValid(input)) {
                      return "Enter Your Correct Email";
                    }
                    return null;
                  },
                ),
                Gap(11),
                PasswordTextFormField(
                  hint: "Password",
                  validator: (input) {
                    if (input == null || input.isEmpty) {
                      return "Create Your Password";
                    } else if (!isPasswordValid(input)) {
                      return "Password Should Be (6+ chars, upper, lower, digit)";
                    }
                    _password = input;
                    return null;
                  },
                ),
                Gap(11),
                PasswordTextFormField(
                  hint: "Confirm Password",
                  validator: (input) {
                    if (input != _password || input == null || input.isEmpty) {
                      return "password not matching";
                    }
                    return null;
                  },
                ),
                Gap(30),
                MainButton(
                  text: "Register",
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      pushReplacment(HomeScreen(), context);
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: AuthFooter(
        text: "Already have an account?",
        textButton: "Login Now",
        onPressed: () => pop(context),
      ),
    );
  }
}
