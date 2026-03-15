import 'package:bookia/core/constants/app_images.dart';
import 'package:bookia/core/functions/navigations.dart';
import 'package:bookia/core/routes/routes.dart';
import 'package:bookia/core/styles/app_colors.dart';
import 'package:bookia/core/styles/text_styles.dart';
import 'package:bookia/core/widgets/dialogs.dart';
import 'package:bookia/core/widgets/main_button.dart';
import 'package:bookia/core/widgets/password_text_form_field.dart';
import 'package:bookia/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:bookia/features/auth/presentation/cubit/auth_state.dart';
import 'package:bookia/features/auth/presentation/functions/app_validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class CreateNewPasswordScreen extends StatelessWidget {
  const CreateNewPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AuthCubit>();
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthLoadingState) {
          showLoadingDialog(context);
        } else if (state is AuthSuccessState) {
          pushReplacment(Routes.passwordChanged, context, extra: cubit);
        } else if (state is AuthErrorState) {
          showMyDialog(context, state.message);
        }
      },
      builder: (context, state) {
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
            key: cubit.formKey,
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
                    style: TextStyles.w400s16.copyWith(
                      color: AppColors.grayColor,
                    ),
                  ),
                  Gap(32),
                  PasswordTextFormField(
                    hint: "New Password",
                    validator: AppValidators.password(),
                    passwordController: cubit.passwordController,
                  ),

                  Gap(15),
                  PasswordTextFormField(
                    hint: "Confirm Password",
                    validator: AppValidators.confirmPassword(
                      passwordProvider: () => cubit.passwordController.text,
                    ),
                    passwordController: cubit.confirmController,
                  ),
                  Gap(38),
                  MainButton(
                    text: "Reset Password",
                    onPressed: () {
                      if (cubit.formKey.currentState!.validate()) {
                        cubit.resetPassword();
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
