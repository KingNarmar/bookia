class PlaceOrderState {}

class PlaceOrderInitialState extends PlaceOrderState {}

class PlaceOrderGovernoratesLoadingState extends PlaceOrderState {}

class PlaceOrderGovernoratesSuccessState extends PlaceOrderState {}

class PlaceOrderGovernoratesErrorState extends PlaceOrderState {
  final String message;

  PlaceOrderGovernoratesErrorState({required this.message});
}