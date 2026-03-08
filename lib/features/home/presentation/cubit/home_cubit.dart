import 'package:bookia/features/home/data/repo/home_repo.dart';
import 'package:bookia/features/home/presentation/cubit/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInialState());

  Future<void> getSliders() async {
    emit(HomeLoadingState());
    var response = await HomeRepo.getSliders();
    if (response != null&& response.isNotEmpty) {
      emit(HomeSuccessState(sliders: response));
    } else {
      emit(HomeErrorState(errorMsg: "Error"));
    }
  }
}
