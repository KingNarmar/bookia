import 'package:bookia/features/home/data/models/product_model/product.dart';
import 'package:bookia/features/home/data/models/slider_model.dart';
import 'package:bookia/features/home/data/repo/home_repo.dart';
import 'package:bookia/features/home/presentation/cubits/home_cubit/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInialState());
  List<SliderModel> sliders = [];
  List<Product> products = [];

  Future<void> getHomeData() async {
    emit(HomeLoadingState());
    final sliderRsponse = await HomeRepo.getSliders();
    final productsResponse = await HomeRepo.getBestSellerProducts();

    if (sliderRsponse != null && productsResponse != null) {
      sliders = sliderRsponse;
      products = productsResponse;
      emit(HomeSuccessState(products: products, sliders: sliders));
    } else {
      emit(HomeErrorState(errorMsg: "Faild To load Home Data"));
    }
  }
}
