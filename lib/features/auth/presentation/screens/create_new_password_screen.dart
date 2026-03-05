import 'package:bookia/core/constants/app_images.dart';
import 'package:bookia/core/functions/navigations.dart';
import 'package:bookia/core/styles/app_colors.dart';
import 'package:bookia/core/styles/text_styles.dart';
import 'package:bookia/core/widgets/main_button.dart';
import 'package:bookia/core/widgets/password_text_form_field.dart';
import 'package:bookia/features/auth/presentation/functions/app_validators.dart';
import 'package:bookia/features/auth/presentation/screens/password_changed_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class CreateNewPasswordScreen extends StatefulWidget {
  const CreateNewPasswordScreen({super.key});

  @override
  State<CreateNewPasswordScreen> createState() =>
      _CreateNewPasswordScreenState();
}

class _CreateNewPasswordScreenState extends State<CreateNewPasswordScreen> {
  final formKey = GlobalKey<FormState>();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(AppImages.backIconsvg),
        ),
      ),
      body: Form(
        key: formKey,
        autovalidateMode: AutovalidateMode.onUnfocus,
        child: Padding(
          padding: const EdgeInsets.all(22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Create new password", style: TextStyles.w400s30),
              Gap(10),
              Text(
                "Your new password must be unique from those previously used.",
                style: TextStyles.w400s16.copyWith(color: AppColors.grayColor),
              ),
              Gap(32),
              PasswordTextFormField(
                hint: "New Password",
                validator: AppValidators.password(),
                passwordController: passwordController,
              ),

              Gap(15),
              PasswordTextFormField(
                hint: "Confirm Password",
                validator: AppValidators.confirmPassword(
                  passwordProvider: () => passwordController.text,
                ),
              ),
              Gap(38),
              MainButton(
                text: "Reset Password",
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    pushReplacment(PasswordChangedScreen(), context);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
