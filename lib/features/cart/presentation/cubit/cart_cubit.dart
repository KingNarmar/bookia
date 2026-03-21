import 'package:bookia/core/services/local/shared_pref.dart';
import 'package:bookia/features/cart/data/models/cart_response/cart_item.dart';
import 'package:bookia/features/cart/data/repo/cart_repo.dart';
import 'package:bookia/features/cart/presentation/cubit/cart_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitialState());

  List<CartItem?> cartItems = [];

  void getCartItems() async {
    emit(CartLoadingState());
    var data = await CartRepo.getCartItems();
    cartItems = data;
    SharedPref.cashCartListIds(cartItems);
    emit(CartSuccessState());
  }

  void removeFromCart(int itemId) async {
    emit(CartLoadingState());
    final data = await CartRepo.removeFromCart(itemId);
    cartItems = data;
    SharedPref.cashCartListIds(cartItems);
    emit(CartSuccessState());
  }

  double get totalPrice {
    double total = 0.0;

    for (var item in cartItems) {
      if (item != null) {
        final double price =
            item.itemProductPriceAfterDiscount ??
            double.tryParse(item.itemProductPrice ?? '0') ??
            0.0;

        final int quantity = item.itemQuantity ?? 1;

        total += price * quantity;
      }
    }

    return total;
  }

  void increaseQuantity(int itemId) {
    for (int i = 0; i < cartItems.length; i++) {
      final item = cartItems[i];

      if (item != null && item.itemId == itemId) {
        final currentQty = item.itemQuantity ?? 1;
        final stock = item.itemProductStock ?? 0;

        if (currentQty < stock) {
          item.itemQuantity = currentQty + 1;
        }
        break;
      }
    }

    emit(CartSuccessState());
  }

  void decreaseQuantity(int itemId) {
    for (int i = 0; i < cartItems.length; i++) {
      final item = cartItems[i];

      if (item != null && item.itemId == itemId) {
        final currentQty = item.itemQuantity ?? 1;

        if (currentQty > 1) {
          item.itemQuantity = currentQty - 1;
        }
        break;
      }
    }

    emit(CartSuccessState());
  }
}
