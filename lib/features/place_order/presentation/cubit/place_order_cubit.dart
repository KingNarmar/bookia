import 'package:bookia/features/place_order/data/models/governorates_response/governorate_model.dart';
import 'package:bookia/features/place_order/data/repo/place_order_repo.dart';
import 'package:bookia/features/place_order/presentation/cubit/place_order_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlaceOrderCubit extends Cubit<PlaceOrderState> {
  PlaceOrderCubit() : super(PlaceOrderInitialState());

  List<GovernorateModel> governorates = [];
  GovernorateModel? selectedGovernorate;

  Future<void> getGovernorates() async {
    if (governorates.isNotEmpty) {
      emit(PlaceOrderGovernoratesSuccessState());
      return;
    }

    emit(PlaceOrderGovernoratesLoadingState());

    final data = await PlaceOrderRepo.getGovernorates();

    if (data.isNotEmpty) {
      governorates = data;
      emit(PlaceOrderGovernoratesSuccessState());
    } else {
      emit(
        PlaceOrderGovernoratesErrorState(
          message: "Failed to load governorates",
        ),
      );
    }
  }

  void selectGovernorate(GovernorateModel governorate) {
    selectedGovernorate = governorate;
    emit(PlaceOrderGovernoratesSuccessState());
  }
}
