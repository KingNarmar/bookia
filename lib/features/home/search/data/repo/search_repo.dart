import 'dart:developer';

import 'package:bookia/core/services/dio/api.dart';
import 'package:bookia/core/services/dio/dio_provider.dart';
import 'package:bookia/features/home/home/data/models/product_model/product.dart';

class SearchRepo {
  static Future<List<Product>?> getAllProducts() async {
    var response = await DioProvider.getApi(
      endPoint: Apis.allProducts,
      unwrapData: true,
    );

    return response.fold(
      (l) {
        log(l.message);
        return [];
      },
      (r) {
        final List productsJson = r["products"] ?? [];
        return productsJson.map((e) => Product.fromJson(e)).toList();
      },
    );
  }

  static Future<List<Product>?> searchProducts({required String name}) async {
    var response = await DioProvider.getApi(
      endPoint: Apis.productsSearch,
      queryParameters: {"name": name},
      unwrapData: true,
    );

    return response.fold(
      (l) {
        log(l.message);
        return [];
      },
      (r) {
        final List productsJson = r["products"] ?? [];
        return productsJson.map((e) => Product.fromJson(e)).toList();
      },
    );
  }
}
