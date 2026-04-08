
import 'package:bookia/core/services/dio/api.dart';
import 'package:bookia/core/services/dio/dio_provider.dart';
import 'package:bookia/core/services/dio/failure.dart';
import 'package:bookia/core/services/local/shared_pref.dart';
import 'package:bookia/features/auth/data/models/auth_response/auth_response.dart';
import 'package:bookia/features/auth/data/models/auth_response/data.dart';
import 'package:bookia/features/auth/data/models/forget_password_params.dart';
import 'package:bookia/features/auth/data/models/register_params.dart';
import 'package:bookia/features/auth/data/models/reset_password_params.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepo {
  static Future<Either<Failure, Data>> register(RegisterParams params) async {
    var response = await DioProvider.postApi(
      endPoint: Apis.register,
      data: params.toJson(),
    );

    return response.fold(
      (l) {
        return Left(l);
      },
      (right) {
        try {
          var data = Data.fromJson(right);
          SharedPref.setToken(data.token ?? "");
          SharedPref.setUserInfo(data.user);
          return Right(data);
        } on Exception catch (e) {
          return Left(ParseFailure(message: e.toString()));
        }
      },
    );
  }

  static Future<Either<Failure, Data>> login(RegisterParams params) async {
    var response = await DioProvider.postApi(
      endPoint: Apis.login,
      data: params.toJson(),
    );

    return response.fold(
      (l) {
        return Left(l);
      },
      (right) {
        try {
          var data = Data.fromJson(right);
          SharedPref.setToken(data.token ?? "");
          SharedPref.setUserInfo(data.user);
          return Right(data);
        } on Exception catch (e) {
          return Left(ParseFailure(message: e.toString()));
        }
      },
    );
  }

  static Future<Either<Failure, Data>> forgetPassword(
    ForgetPasswordParams params,
  ) async {
    var response = await DioProvider.postApi(
      endPoint: Apis.forgetPassword,
      data: params.toJson(),
    );

    return response.fold(
      (l) {
        return Left(l);
      },
      (right) {
        try {
          var data = Data.fromJson(right);
          SharedPref.setToken(data.token ?? "");
          SharedPref.setUserInfo(data.user);
          return Right(data);
        } on Exception catch (e) {
          return Left(ParseFailure(message: e.toString()));
        }
      },
    );
  }

  static Future<Either<Failure, AuthResponse>> resetPassword(ResetPasswordParams params) async {
    var response = await DioProvider.postApi(
      endPoint: Apis.resetPassword,
      data: params.toJson(),
      unwrapData: false,
    );

    return response.fold(
      (l) => Left(l),
      (r) {
        try {
          return Right(AuthResponse.fromJson(r));
        } on Exception catch (e) {
          return Left(ParseFailure(message: e.toString()));
        }
      },
    );
  }

  static Future<bool> logout() async {
    await DioProvider.postApi(
      endPoint: Apis.logout,
      headers: {'Authorization': 'Bearer ${SharedPref.getToken()}'},
    );

    // Force clear local session if network fails or token is already invalid
    await SharedPref.clear();
    return true;
  }
}
