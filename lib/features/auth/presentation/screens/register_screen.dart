import 'package:bookia/core/constants/app_images.dart';
import 'package:bookia/core/functions/navigations.dart';
import 'package:bookia/core/styles/text_styles.dart';
import 'package:bookia/core/widgets/custom_text_form_field.dart';
import 'package:bookia/core/widgets/main_button.dart';
import 'package:bookia/core/widgets/password_text_form_field.dart';
import 'package:bookia/features/auth/presentation/functions/app_validators.dart';
import 'package:bookia/features/auth/presentation/widgets/auth_footer.dart';
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
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();
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
                  validator: AppValidators.name,
                ),
                Gap(11),
                CustomTextFormField(
                  hint: "Email",
                  validator: AppValidators.email,
                ),
                Gap(11),
                PasswordTextFormField(
                  hint: "Password",
                  validator: AppValidators.password(),
                  passwordController: passwordController,
                ),
                Gap(11),
                PasswordTextFormField(
                  hint: "Confirm Password",
                  validator: AppValidators.confirmPassword(
                    passwordProvider: () => passwordController.text,
                  ),
                  passwordController: confirmController,
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
