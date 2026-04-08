import 'dart:developer';

import 'package:bookia/core/services/dio/api.dart';
import 'package:bookia/core/services/dio/dio_provider.dart';
import 'package:bookia/core/services/local/shared_pref.dart';
import 'package:bookia/features/orders/order_details/data/models/order_details_response/order_details_response.dart';

class OrderDetailsRepo {
  static Future<OrderDetailsResponse?> getOrderDetails(int orderId) async {
    final token = SharedPref.getToken();

    final response = await DioProvider.getApi(
      endPoint: "${Apis.showSingleOrder}/$orderId",
      headers: {
        'Authorization': 'Bearer $token',
      },
      unwrapData: false,
    );

    return response.fold(
      (l) {
        log(l.message);
        return null;
      },
      (r) => OrderDetailsResponse.fromJson(r),
    );
  }
}