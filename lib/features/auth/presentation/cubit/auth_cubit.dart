import 'package:bookia/features/auth/data/models/forget_password_params.dart';
import 'package:bookia/features/auth/data/models/register_params.dart';
import 'package:bookia/features/auth/data/repo/auth_repo.dart';
import 'package:bookia/features/auth/presentation/cubit/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitialState());
  final formKey = GlobalKey<FormState>();
  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();
  final otpController = TextEditingController();

  Future<void> login() async {
    emit(AuthLoadingState());
    var response = await AuthRepo.login(
      RegisterParams(
        email: emailController.text,
        password: passwordController.text,
      ),
    );
    if (response != null) {
      emit(AuthSuccessState());
    } else {
      emit(AuthErrorState(message: "Login Failed"));
    }
  }

  Future<void> register() async {
    emit(AuthLoadingState());
    var response = await AuthRepo.register(
      RegisterParams(
        name: userNameController.text,
        email: emailController.text,
        password: passwordController.text,
        passwordConfirmation: confirmController.text,
      ),
    );
    if (response != null) {
      emit(AuthSuccessState());
    } else {
      emit(AuthErrorState(message: "Register Failed"));
    }
  }

  Future<void> forgetPassword() async {
    emit(AuthLoadingState());

    try {
      final params = ForgetPasswordParams(email: emailController.text);

      final response = await AuthRepo.forgetPassword(params);

      if (response != null) {
        emit(AuthSuccessState());
      } else {
        emit(AuthErrorState(message: "Wrong Email"));
      }
    } catch (e) {
      emit(AuthErrorState(message: e.toString()));
    }
  }
}
