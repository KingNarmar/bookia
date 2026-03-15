import 'package:bookia/core/constants/app_images.dart';
import 'package:bookia/core/functions/navigations.dart';
import 'package:bookia/core/routes/routes.dart';
import 'package:bookia/core/styles/app_colors.dart';
import 'package:bookia/core/styles/text_styles.dart';
import 'package:bookia/core/widgets/custom_text_form_field.dart';
import 'package:bookia/core/widgets/dialogs.dart';
import 'package:bookia/core/widgets/main_button.dart';
import 'package:bookia/core/widgets/password_text_form_field.dart';
import 'package:bookia/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:bookia/features/auth/presentation/cubit/auth_state.dart';
import 'package:bookia/features/auth/presentation/functions/app_validators.dart';
import 'package:bookia/features/auth/presentation/widgets/auth_footer.dart';
import 'package:bookia/features/auth/presentation/widgets/social_auth_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
            if (state is AuthSuccessState) {
              pushAndClearStack(Routes.mainApp, context);
            } else if (state is AuthErrorState) {
              pop(context);
              showMyDialog(context, state.message);
            } else if (state is AuthLoadingState) {
              showLoadingDialog(context);
            }
          },
          builder: (context, state) {
            var cubit = context.read<AuthCubit>();
            return Form(
              key: cubit.formKey,
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
                        validator: AppValidators.email,
                        controller: cubit.emailController,
                      ),
                      Gap(15),
                      PasswordTextFormField(
                        validator: AppValidators.password(
                          emptyMessage: "Enter Your Password",
                        ),
                        passwordController: cubit.passwordController,
                      ),
                      Gap(15),
                      TextButton(
                        onPressed: () {
                          pushTo(Routes.forgetPassword, context);
                        },
                        child: Align(
                          alignment: AlignmentGeometry.centerRight,
                          child: Text(
                            "Forgot Password?",
                            style: TextStyles.w400s14.copyWith(
                              color: AppColors.darkGray,
                            ),
                          ),
                        ),
                      ),
                      Gap(30),

                      MainButton(
                        text: "Login",
                        onPressed: () {
                          if (cubit.formKey.currentState!.validate()) {
                            cubit.login();
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
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
        bottomNavigationBar: AuthFooter(
          text: "Don’t have an account?",
          textButton: "Register Now",
          onPressed: () => pushTo(Routes.register, context),
        ),
      ),
    );
  }
}
