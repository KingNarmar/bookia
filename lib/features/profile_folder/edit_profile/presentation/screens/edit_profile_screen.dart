import 'package:bookia/core/constants/app_images.dart';
import 'package:bookia/core/functions/app_validators.dart';
import 'package:bookia/core/functions/navigations.dart';
import 'package:bookia/core/styles/text_styles.dart';
import 'package:bookia/core/widgets/custom_text_form_field.dart';
import 'package:bookia/core/widgets/dialogs.dart';
import 'package:bookia/core/widgets/main_button.dart';
import 'package:bookia/features/profile_folder/edit_profile/presentation/cubit/edit_profile_cubit.dart';
import 'package:bookia/features/profile_folder/edit_profile/presentation/cubit/edit_profile_state.dart';
import 'package:bookia/features/profile_folder/edit_profile/presentation/widgets/edit_profile_pic_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    var cubit = context.read<EditProfileCubit>();
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
      body: BlocConsumer<EditProfileCubit, EditProfileState>(
        listener: (context, state) {
          if (state is EditProfileUpdated) {
            pop(context); // close loading dialog
            pop(context); // pop back to profile screen
          } else if (state is EditProfileError) {
            pop(context); // close loading dialog
            showMyDialog(context, state.message);
          } else if (state is EditProfileLoading) {
            showLoadingDialog(context);
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: cubit.formKey,
              autovalidateMode: AutovalidateMode.onUnfocus,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    EditProfilePicSection(),
                    Gap(54),
                    CustomTextFormField(
                      hint: "Full Name",
                      controller: cubit.nameController,
                      validator: AppValidators.name,
                    ),
                    Gap(20),
                    CustomTextFormField(
                      hint: "Phone",
                      controller: cubit.phoneController,
                      validator: AppValidators.phone,
                    ),
                    Gap(20),
                    CustomTextFormField(
                      hint: "Address",
                      controller: cubit.addressController,
                      validator: AppValidators.address,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: MainButton(
          text: "Update Profile",
          onPressed: () {
            if (cubit.formKey.currentState!.validate()) {
              cubit.editProfile();
            }
          },
        ),
      ),
    );
  }
}
