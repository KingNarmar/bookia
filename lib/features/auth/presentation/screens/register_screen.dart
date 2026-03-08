import 'package:bookia/core/constants/app_images.dart';
import 'package:bookia/core/functions/navigations.dart';
import 'package:bookia/core/styles/text_styles.dart';
import 'package:bookia/core/widgets/custom_text_form_field.dart';
import 'package:bookia/core/widgets/dialogs.dart';
import 'package:bookia/core/widgets/main_button.dart';
import 'package:bookia/core/widgets/password_text_form_field.dart';
import 'package:bookia/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:bookia/features/auth/presentation/cubit/auth_state.dart';
import 'package:bookia/features/auth/presentation/functions/app_validators.dart';
import 'package:bookia/features/auth/presentation/widgets/auth_footer.dart';
import 'package:bookia/features/main/main_app_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

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
              pushAndClearStack(MainAppScreen(), context);
            } else if (state is AuthErrorState) {
              pop(context);
              showErrorDialog(context, state.message);
            } else if (state is AuthLoadingState) {
              showLoadingDialog(context);
            }
          },
          builder: (context, state) {
            var cubit = context.read<AuthCubit>();
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(22),
                child: Form(
                  key: cubit.formKey,
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
                        controller: cubit.userNameController,
                      ),
                      Gap(11),
                      CustomTextFormField(
                        hint: "Email",
                        validator: AppValidators.email,
                        controller: cubit.emailController,
                      ),
                      Gap(11),
                      PasswordTextFormField(
                        hint: "Password",
                        validator: AppValidators.password(),
                        passwordController: cubit.passwordController,
                      ),
                      Gap(11),
                      PasswordTextFormField(
                        hint: "Confirm Password",
                        validator: AppValidators.confirmPassword(
                          passwordProvider: () => cubit.passwordController.text,
                        ),
                        passwordController: cubit.confirmController,
                      ),
                      Gap(30),

                      MainButton(
                        text: "Register",
                        onPressed: () {
                          if (cubit.formKey.currentState!.validate()) {
                            cubit.register();
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
        bottomNavigationBar: AuthFooter(
          text: "Already have an account?",
          textButton: "Login Now",
          onPressed: () => pop(context),
        ),
      ),
    );
  }
}
