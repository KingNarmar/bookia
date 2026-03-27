import 'package:bookia/core/constants/app_images.dart';
import 'package:bookia/core/functions/navigations.dart';
import 'package:bookia/core/styles/text_styles.dart';
import 'package:bookia/core/widgets/main_button.dart';
import 'package:bookia/core/widgets/password_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: IconButton(
          onPressed: () {
            pop(context);
          },
          icon: SvgPicture.asset(AppImages.backIconsvg),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("New Password", style: TextStyles.w400s30),
            Gap(73),
            PasswordTextFormField(hint: "Current Password"),
            Gap(26),
            PasswordTextFormField(hint: "New Password"),
            Gap(26),
            PasswordTextFormField(hint: "Confirm Password"),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: MainButton(text: "Update Password", onPressed: () {}),
      ),
    );
  }
}
