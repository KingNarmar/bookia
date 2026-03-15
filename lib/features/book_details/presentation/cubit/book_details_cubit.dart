import 'package:bookia/features/book_details/presentation/cubit/book_details_state.dart';
import 'package:bookia/features/wish_list/data/repo/wish_list_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDetailsCubit extends Cubit<BookDetailsState> {
  BookDetailsCubit() : super(BookDetailsInitialState());

  void addToWishList(int productId) async {
    emit(BookDetailsLoadingState());
    var data = await WishListRepo.addToWishList(productId);
    if (data != null) {
      emit(BookDetailsSuccessState());
    } else {
      emit(BookDetailsErrorState());
    }
  }
}
