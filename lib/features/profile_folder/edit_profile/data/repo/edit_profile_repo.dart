import 'dart:developer';
import 'dart:io';

import 'package:bookia/core/services/dio/api.dart';
import 'package:bookia/core/services/dio/dio_provider.dart';
import 'package:bookia/core/services/local/shared_pref.dart';
import 'package:bookia/features/auth/data/models/auth_response/user.dart';
import 'package:bookia/features/profile_folder/edit_profile/data/models/edit_profile_params.dart';
import 'package:bookia/features/profile_folder/edit_profile/data/models/edit_profile_response/edit_profile_response.dart';
import 'package:dio/dio.dart';

abstract class EditProfileRepo {
  static Future<EditProfileResponse?> editProfile(
    EditProfileParams params, {
    File? image,
  }) async {
    final token = SharedPref.getToken();

    final formData = FormData.fromMap({
      'name': params.name,
      'phone': params.phone,
      'address': params.address,
      if (image != null)
        'image': await MultipartFile.fromFile(
          image.path,
          filename: image.path.split('/').last,
        ),
    });

    var response = await DioProvider.postApi(
      endPoint: Apis.editProfile,
      data: formData,
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'multipart/form-data',
      },
      unwrapData: false,
    );

    return await response.fold(
      (l) async {
        log(l.message);
        return null;
      },
      (r) async {
        var data = EditProfileResponse.fromJson(r);

        // Update cached user info
        final updatedUser = User(
          id: SharedPref.getUserInfo()?.id,
          name: data.data?.name,
          email: SharedPref.getUserInfo()?.email,
          address: data.data?.address,
          phone: data.data?.phone,
          image: data.data?.image,
          emailVerified: SharedPref.getUserInfo()?.emailVerified,
        );
        await SharedPref.setUserInfo(updatedUser);

        return data;
      },
    );
  }
}
