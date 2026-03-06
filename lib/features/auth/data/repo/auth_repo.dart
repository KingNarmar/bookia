import 'dart:developer';

import 'package:bookia/core/services/api/api.dart';
import 'package:bookia/core/services/api/dio_provider.dart';
import 'package:bookia/features/auth/data/models/auth_response/auth_response.dart';
import 'package:bookia/features/auth/data/models/register_params.dart';

abstract class AuthRepo {
  static Future<AuthResponse?> register(RegisterParams params) async {
    try {
      var response = await DioProvider.post(
        endPoint: Apis.register,
        data: params.toJson(),
      );

      if (response.statusCode == 201) {
        response.data;
        var data = AuthResponse.fromJson(response.data);
        return data;
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<AuthResponse?> login(RegisterParams params) async {
    try {
      var response = await DioProvider.post(
        endPoint: Apis.login,
        data: params.toJson(),
      );

      if (response.statusCode == 200) {
        response.data;
        var data = AuthResponse.fromJson(response.data);
        return data;
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }
}
