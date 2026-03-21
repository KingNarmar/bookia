import 'package:bookia/core/constants/app_images.dart';
import 'package:bookia/core/functions/navigations.dart';
import 'package:bookia/core/styles/text_styles.dart';
import 'package:bookia/core/widgets/custom_text_form_field.dart';
import 'package:bookia/core/widgets/main_button.dart';
import 'package:bookia/features/profile/presentation/widgets/edit_profile_pic_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Profile", style: TextStyles.w400s24),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: IconButton(
            onPressed: () {
              pop(context);
            },
            icon: SvgPicture.asset(AppImages.backIconsvg),
          ),
        ),
        leadingWidth: 70,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            EditProfilePicSection(),
            Gap(54),
            CustomTextFormField(hint: "Full Name"),
            Gap(20),
            CustomTextFormField(hint: "Phone"),
            Gap(20),
            CustomTextFormField(hint: "Address"),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: MainButton(text: "Update Profile", onPressed: () {}),
      ),
    );
  }
}
