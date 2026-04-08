import 'dart:developer';

import 'package:bookia/core/services/dio/api.dart';
import 'package:bookia/core/services/dio/dio_provider.dart';
import 'package:bookia/core/services/local/shared_pref.dart';
import 'package:bookia/features/wish_list/data/models/wish_list_response/wish_list_response.dart';

class WishListRepo {
  static Future<WishListResponse?> getWishList() async {
    var response = await DioProvider.getApi(
      endPoint: Apis.wishlist,
      queryParameters: {"page": 1},
      headers: {"Authorization": "Bearer ${SharedPref.getToken()}"},
      unwrapData: false,
    );

    return response.fold(
      (l) {
        log(l.message);
        return null;
      },
      (r) => WishListResponse.fromJson(r),
    );
  }

  static Future<WishListResponse?> addToWishList(int productID) async {
    var response = await DioProvider.postApi(
      endPoint: Apis.addToWishlist,
      queryParameters: {"page": 1},
      data: {"product_id": productID},
      headers: {"Authorization": "Bearer ${SharedPref.getToken()}"},
      unwrapData: false,
    );
    return response.fold(
      (l) => null,
      (r) => WishListResponse.fromJson(r),
    );
  }

  static Future<WishListResponse?> removeFromWishList(int productId) async {
    var response = await DioProvider.postApi(
      endPoint: Apis.removeFromWishlist,
      data: {"product_id": productId},
      headers: {"Authorization": "Bearer ${SharedPref.getToken()}"},
      queryParameters: {"page": 1},
      unwrapData: false,
    );
    return response.fold(
      (l) => null,
      (r) => WishListResponse.fromJson(r),
    );
  }
}
