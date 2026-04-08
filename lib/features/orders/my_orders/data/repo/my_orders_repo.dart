import 'dart:developer';

import 'package:bookia/core/services/dio/api.dart';
import 'package:bookia/core/services/dio/dio_provider.dart';
import 'package:bookia/core/services/local/shared_pref.dart';
import 'package:bookia/features/orders/my_orders/data/models/my_orders_response/my_orders_response.dart';

class MyOrdersRepo {
  static Future<MyOrdersResponse?> getOrders() async {
    final token = SharedPref.getToken();
    var response = await DioProvider.getApi(
      endPoint: Apis.myOrders,
      headers: {'Authorization': 'Bearer $token'},
      unwrapData: false,
    );
    return response.fold(
      (l) {
        log(l.message);
        return null;
      },
      (r) => MyOrdersResponse.fromJson(r),
    );
  }
}
