import 'dart:developer';

import 'package:bookia/core/services/dio/api.dart';
import 'package:bookia/core/services/dio/dio_provider.dart';
import 'package:bookia/core/services/local/shared_pref.dart';
import 'package:bookia/features/profile_folder/reset_password/data/models/reset_password_params.dart';
import 'package:bookia/features/profile_folder/reset_password/data/models/reset_password_response/reset_password_response.dart';

abstract class ResetPasswordRepo {
  static Future<ResetPasswordResponse?> updatePassword(
    ResetPasswordParams params,
  ) async {
    final token = SharedPref.getToken();

    var response = await DioProvider.postApi(
      endPoint: Apis.updatePassword,
      data: params.toJson(),
      headers: {'Authorization': 'Bearer $token'},
      unwrapData: false,
    );

    return response.fold(
      (l) {
        log(l.message);
        return null;
      },
      (r) => ResetPasswordResponse.fromJson(r),
    );
  }
}
