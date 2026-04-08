import 'dart:developer';

import 'package:bookia/core/services/dio/api.dart';
import 'package:bookia/core/services/dio/dio_provider.dart';
import 'package:bookia/core/services/local/shared_pref.dart';
import 'package:bookia/features/place_order/data/models/governorates_response/governorate_model.dart';

class PlaceOrderRepo {
  static Future<List<GovernorateModel>> getGovernorates() async {
    final response = await DioProvider.getApi(
      endPoint: Apis.governorates,
      headers: {"Authorization": "Bearer ${SharedPref.getToken()}"},
      unwrapData: true,
    );

    return response.fold(
      (l) => [],
      (r) {
        final List data = r ?? [];
        return data.map((e) => GovernorateModel.fromJson(e)).toList();
      },
    );
  }

  static Future<int?> placeOrder({
    required int governorateId,
    required String name,
    required String phone,
    required String address,
    required String email,
  }) async {
    final response = await DioProvider.postApi(
      endPoint: Apis.placeOrder,
      data: {
        "governorate_id": governorateId,
        "name": name,
        "phone": phone,
        "address": address,
        "email": email,
      },
      headers: {"Authorization": "Bearer ${SharedPref.getToken()}"},
    );

    return response.fold(
      (l) {
        log(l.message);
        return null;
      },
      (r) {
        final orderId = r?["id"];
        if (orderId is int) return orderId;
        return int.tryParse(orderId?.toString() ?? '');
      },
    );
  }
}
