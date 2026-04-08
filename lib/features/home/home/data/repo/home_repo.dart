import 'dart:developer';

import 'package:bookia/core/services/dio/api.dart';
import 'package:bookia/core/services/dio/dio_provider.dart';
import 'package:bookia/features/home/home/data/models/product_model/product.dart';
import 'package:bookia/features/home/home/data/models/slider_model.dart';

class HomeRepo {
  static Future<List<SliderModel>?> getSliders() async {
    var response = await DioProvider.getApi(endPoint: Apis.sliders, unwrapData: true);

    return response.fold(
      (l) {
        log(l.message);
        return [];
      },
      (r) {
        final List slidersJson = r["sliders"] ?? [];
        return slidersJson.map((e) => SliderModel.fromJson(e)).toList();
      },
    );
  }

  static Future<List<Product>?> getBestSellerProducts() async {
    var response = await DioProvider.getApi(
      endPoint: Apis.productsBestSeller,
      unwrapData: true,
    );

    return response.fold(
      (l) {
        log(l.message);
        return null;
      },
      (r) {
        final List bestSellerJson = r["products"] ?? [];
        return bestSellerJson.map((e) => Product.fromJson(e)).toList();
      },
    );
  }
}
