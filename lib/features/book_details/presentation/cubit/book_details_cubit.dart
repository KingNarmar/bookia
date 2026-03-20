import 'package:bookia/core/services/local/shared_pref.dart';
import 'package:bookia/features/book_details/presentation/cubit/book_details_state.dart';
import 'package:bookia/features/cart/data/models/cart_response/cart_item.dart';
import 'package:bookia/features/cart/data/repo/cart_repo.dart';
import 'package:bookia/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:bookia/features/wish_list/data/repo/wish_list_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDetailsCubit extends Cubit<BookDetailsState> {
  BookDetailsCubit() : super(BookDetailsInitialState());
  List<CartItem?> cartItems = [];
  void addToWishList(int productId) async {
    emit(BookDetailsLoadingState());
    var data = await WishListRepo.addToWishList(productId);
    var products = data?.data?.product ?? [];
    SharedPref.cashWishListIds(products);
    if (data != null) {
      emit(BookDetailsSuccessState());
    } else {
      emit(BookDetailsErrorState());
    }
  }

  bool isInWishList(int productId) {
    var wishListIds = SharedPref.getWishListIds();
    return wishListIds.contains(productId);
  }

  void addToCart(int productId) async {
    emit(BookDetailsLoadingState());
    var data = await CartRepo.addToCart(productId);
    cartItems = data;
    emit(BookDetailsSuccessState());
  }

  bool isInCart(int productId) {
    return CartCubit().cartItems.any(
      (item) => item?.itemProductId == productId,
    );
  }
}
