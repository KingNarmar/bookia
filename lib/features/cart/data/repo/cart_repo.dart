import 'package:bookia/core/services/dio/api.dart';
import 'package:bookia/core/services/dio/dio_provider.dart';
import 'package:bookia/core/services/local/shared_pref.dart';
import 'package:bookia/features/cart/data/models/cart_response/data.dart';
import 'package:bookia/features/cart/data/models/checkout_response/checkout_data.dart';

class CartRepo {
  static Future<Data?> getCartItems() async {
    var response = await DioProvider.getApi(
      endPoint: Apis.cart,
      headers: {"Authorization": "Bearer ${SharedPref.getToken()}"},
      unwrapData: true,
    );

    return response.fold(
      (l) => null,
      (r) => Data.fromJson(r),
    );
  }

  static Future<Data?> addToCart(int productId) async {
    var response = await DioProvider.postApi(
      endPoint: Apis.addToCart,
      data: {"product_id": productId},
      headers: {"Authorization": "Bearer ${SharedPref.getToken()}"},
    );

    return response.fold(
      (l) => null,
      (r) => Data.fromJson(r),
    );
  }

  static Future<bool> removeFromCart(int cartItemId) async {
    var response = await DioProvider.postApi(
      endPoint: Apis.removeFromCart,
      data: {"cart_item_id": cartItemId},
      headers: {"Authorization": "Bearer ${SharedPref.getToken()}"},
    );

    return response.isRight();
  }

  static Future<Data?> updateCartQuantity({
    required int cartItemId,
    required int quantity,
  }) async {
    var response = await DioProvider.postApi(
      endPoint: Apis.updateCart,
      data: {"cart_item_id": cartItemId, "quantity": quantity},
      headers: {"Authorization": "Bearer ${SharedPref.getToken()}"},
    );

    return response.fold(
      (l) => null,
      (r) => Data.fromJson(r),
    );
  }

  static Future<CheckoutData?> checkout() async {
    var response = await DioProvider.getApi(
      endPoint: Apis.checkout,
      headers: {"Authorization": "Bearer ${SharedPref.getToken()}"},
      unwrapData: true,
    );

    return response.fold(
      (l) => null,
      (r) => CheckoutData.fromJson(r),
    );
  }
}
