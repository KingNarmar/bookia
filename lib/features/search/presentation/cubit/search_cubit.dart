import 'package:bookia/features/home/data/models/product_model/product.dart';
import 'package:bookia/features/search/data/repo/search_repo.dart';
import 'package:bookia/features/search/presentation/cubit/search_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  List<Product> products = [];

  Future<void> getAllProducts() async {
    emit(SearchLoading());

    try {
      final response = await SearchRepo.getAllProducts();

      products = response ?? [];

      emit(SearchSuccess(products: products));
    } catch (e) {
      emit(SearchError(message: 'Failed to load products'));
    }
  }

  Future<void> searchProducts(String name) async {
    if (name.trim().isEmpty) {
      await getAllProducts();
      return;
    }

    emit(SearchLoading());

    try {
      final response = await SearchRepo.searchProducts(name: name.trim());

      products = response ?? [];

      emit(SearchSuccess(products: products));
    } catch (e) {
      emit(SearchError(message: 'Failed to load search results'));
    }
  }
}
