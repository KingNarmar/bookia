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
    emit(CartSuccessState());
  }

  void removeFromCart(int itemId) async {
    emit(CartLoadingState());
    final data = await CartRepo.removeFromCart(itemId);
    cartItems = data;
    emit(CartSuccessState());
  }

  
}
