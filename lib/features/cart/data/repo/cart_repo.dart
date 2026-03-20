import 'package:bookia/core/services/api/api.dart';
import 'package:bookia/core/services/api/dio_provider.dart';
import 'package:bookia/core/services/local/shared_pref.dart';
import 'package:bookia/features/cart/data/models/cart_response/cart_item.dart';

class CartRepo {
  // This is a placeholder for the actual implementation of the CartRepo.
  // In a real application, this would include methods to interact with a database or API.
  static Future<List<CartItem?>> getCartItems() async {
    try {
      var response = await DioProvider.get(
        endPoint: Apis.cart,
        headers: {"Authorization": "Bearer ${SharedPref.getToken()}"},
      );

      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        List<CartItem?> cartItems =
            (response.data['data']["cart_items"] as List)
                .map((item) => CartItem.fromJson(item))
                .toList();
        return cartItems;
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  static Future<List<CartItem?>> addToCart(int productId) async {
    // Logic to add a product to the cart

    try {
      var response = await DioProvider.post(
        endPoint: Apis.addToCart,
        data: {"product_id": productId},
        headers: {"Authorization": "Bearer ${SharedPref.getToken()}"},
      );
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        List<CartItem?> cartItems =
            (response.data["data"]["cart_items"] as List)
                .map((item) => CartItem.fromJson(item))
                .toList();
        return cartItems;
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  static Future<List<CartItem?>> removeFromCart(int cartItemId) async {
    // Logic to remove a product from the cart
    try {
      var response = await DioProvider.post(
        endPoint: Apis.removeFromCart,
        data: {"cart_item_id": cartItemId},
        headers: {"Authorization": "Bearer ${SharedPref.getToken()}"},
      );

      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        List<CartItem?> cartItems =
            (response.data["data"]["cart_items"] as List)
                .map((item) => CartItem.fromJson(item))
                .toList();
        return cartItems;
      } else {
        return [];
      }
    } catch (e) {
      // Handle error
      return [];
    }
  }
}
