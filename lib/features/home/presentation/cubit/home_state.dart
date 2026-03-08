import 'package:bookia/features/home/data/models/slider_model.dart';

class HomeState {}

class HomeInialState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeSuccessState extends HomeState {
  final List<SliderModel> sliders;

  HomeSuccessState({required this.sliders});
}

class HomeErrorState extends HomeState {
  final String errorMsg;

  HomeErrorState({required this.errorMsg});
}
