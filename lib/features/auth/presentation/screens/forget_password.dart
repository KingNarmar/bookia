import 'package:bookia/core/constants/app_images.dart';
import 'package:bookia/core/functions/navigations.dart';
import 'package:bookia/core/routes/routes.dart';
import 'package:bookia/core/styles/app_colors.dart';
import 'package:bookia/core/styles/text_styles.dart';
import 'package:bookia/core/widgets/custom_text_form_field.dart';
import 'package:bookia/core/widgets/dialogs.dart';
import 'package:bookia/core/widgets/main_button.dart';
import 'package:bookia/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:bookia/features/auth/presentation/cubit/auth_state.dart';
import 'package:bookia/features/auth/presentation/functions/app_validators.dart';
import 'package:bookia/features/auth/presentation/widgets/auth_footer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              pop(context);
            },
            icon: SvgPicture.asset(AppImages.backIconsvg),
          ),
        ),
        body: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthLoadingState) {
              showLoadingDialog(context);
            } else if (state is AuthSuccessState) {
              pop(context);
              pushTo(
                Routes.otpScreen,
                context,
                extra: context.read<AuthCubit>(),
              );
            } else if (state is AuthErrorState) {
              pop(context);
              showMyDialog(context, state.message);
            }
          },
          builder: (context, state) {
            var cubit = context.read<AuthCubit>();
            return Padding(
              padding: const EdgeInsets.all(22),
              child: Form(
                key: cubit.formKey,
                autovalidateMode: AutovalidateMode.onUnfocus,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Forgot Password?", style: TextStyles.w400s30),
                    Gap(10),
                    Text(
                      "Don't worry! It occurs. Please enter the email address linked with your account.",
                      style: TextStyles.w400s16.copyWith(
                        color: AppColors.grayColor,
                      ),
                    ),
                    Gap(30),
                    CustomTextFormField(
                      hint: "Enter Your Email",
                      validator: AppValidators.email,
                      controller: cubit.emailController,
                    ),
                    Gap(40),
                    MainButton(
                      text: "Send Code",
                      onPressed: () {
                        if (cubit.formKey.currentState!.validate()) {
                          cubit.forgetPassword();
                        }
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        bottomNavigationBar: AuthFooter(
          text: "Remember Password?",
          textButton: "Login",
          onPressed: () => pop(context),
        ),
      ),
    );
  }
}
