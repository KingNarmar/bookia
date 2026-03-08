import 'dart:developer';

import 'package:bookia/core/services/api/api.dart';
import 'package:bookia/core/services/api/dio_provider.dart';
import 'package:bookia/features/home/data/models/slider_model.dart';

class HomeRepo {
  static Future<List<SliderModel>?> getSliders() async {
    try {
      var response = await DioProvider.get(endPoint: Apis.sliders);

      if (response.statusCode == 200) {
        final List slidersJson = response.data["data"]["sliders"];
        final List<SliderModel> sliders = slidersJson
            .map((e) => SliderModel.fromJson(e))
            .toList();

        return sliders;
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }
}
