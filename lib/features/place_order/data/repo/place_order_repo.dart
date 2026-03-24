import 'package:bookia/core/services/api/api.dart';
import 'package:bookia/core/services/api/dio_provider.dart';
import 'package:bookia/core/services/local/shared_pref.dart';
import 'package:bookia/features/place_order/data/models/governorates_response/governorate_model.dart';

class PlaceOrderRepo {
  static Future<List<GovernorateModel>> getGovernorates() async {
    try {
      final response = await DioProvider.get(
        endPoint: Apis.governorates,
        headers: {"Authorization": "Bearer ${SharedPref.getToken()}"},
      );

      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        final List data = response.data["data"] ?? [];
        return data.map((e) => GovernorateModel.fromJson(e)).toList();
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }
}
