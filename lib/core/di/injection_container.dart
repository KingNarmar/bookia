// Dependency Injection container — service locator for the entire app.
//
// Usage:
//   await initDependencies();   // call once in main()
//   sl<SomeType>()              // resolve anywhere
//
// Registration convention:
//   - Infrastructure (DioProvider, SharedPref) registered during Phase 1
//   - Data sources, repos, use cases, cubits  registered per feature (Phases 2-7)
import 'package:get_it/get_it.dart';
import 'package:bookia/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:bookia/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:bookia/features/auth/domain/repositories/auth_repository.dart';
import 'package:bookia/features/auth/domain/usecases/forget_password_usecase.dart';
import 'package:bookia/features/auth/domain/usecases/login_usecase.dart';
import 'package:bookia/features/auth/domain/usecases/logout_usecase.dart';
import 'package:bookia/features/auth/domain/usecases/register_usecase.dart';
import 'package:bookia/features/auth/domain/usecases/reset_password_usecase.dart';
import 'package:bookia/features/auth/presentation/cubit/auth_cubit.dart';

import 'package:bookia/features/home/home/data/data_sources/home_remote_data_source.dart';
import 'package:bookia/features/home/home/data/repositories/home_repository_impl.dart';
import 'package:bookia/features/home/home/domain/repositories/home_repository.dart';
import 'package:bookia/features/home/home/domain/usecases/get_best_sellers_usecase.dart';
import 'package:bookia/features/home/home/domain/usecases/get_sliders_usecase.dart';
import 'package:bookia/features/home/home/presentation/cubits/home_cubit/home_cubit.dart';

import 'package:bookia/features/home/search/data/data_sources/search_remote_data_source.dart';
import 'package:bookia/features/home/search/data/repositories/search_repository_impl.dart';
import 'package:bookia/features/home/search/domain/repositories/search_repository.dart';
import 'package:bookia/features/home/search/domain/usecases/get_all_products_usecase.dart';
import 'package:bookia/features/home/search/domain/usecases/search_products_usecase.dart';
import 'package:bookia/features/cart/data/data_sources/cart_remote_data_source.dart';
import 'package:bookia/features/cart/data/repositories/cart_repository_impl.dart';
import 'package:bookia/features/cart/domain/repositories/cart_repository.dart';
import 'package:bookia/features/cart/domain/usecases/add_to_cart_usecase.dart';
import 'package:bookia/features/cart/domain/usecases/checkout_usecase.dart';
import 'package:bookia/features/cart/domain/usecases/get_cart_usecase.dart';
import 'package:bookia/features/cart/domain/usecases/remove_from_cart_usecase.dart';
import 'package:bookia/features/cart/domain/usecases/update_cart_usecase.dart';
import 'package:bookia/features/cart/presentation/cubit/cart_cubit.dart';

import 'package:bookia/features/wishlist/data/data_sources/wishlist_remote_data_source.dart';
import 'package:bookia/features/wishlist/data/repositories/wishlist_repository_impl.dart';
import 'package:bookia/features/wishlist/domain/repositories/wishlist_repository.dart';
import 'package:bookia/features/wishlist/domain/usecases/add_to_wishlist_usecase.dart';
import 'package:bookia/features/wishlist/domain/usecases/get_wishlist_usecase.dart';
import 'package:bookia/features/wishlist/domain/usecases/remove_from_wishlist_usecase.dart';
import 'package:bookia/features/wish_list/presentation/cubit/wish_list_cubit.dart';
import 'package:bookia/features/book_details/presentation/cubit/book_details_cubit.dart';

final sl = GetIt.instance;

/// Initialise all dependencies.
/// Called once in [main] before [runApp].
Future<void> initDependencies() async {
  _registerAuth();
  _registerHome();
  _registerCart();
  _registerWishList();
  _registerBookDetails();
}

void _registerAuth() {
  sl.registerLazySingleton<AuthRemoteDataSource>(() => AuthRemoteDataSourceImpl());
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(remoteDataSource: sl()));
  
  sl.registerLazySingleton(() => LoginUseCase(sl()));
  sl.registerLazySingleton(() => RegisterUseCase(sl()));
  sl.registerLazySingleton(() => ForgetPasswordUseCase(sl()));
  sl.registerLazySingleton(() => ResetPasswordUseCase(sl()));
  sl.registerLazySingleton(() => LogoutUseCase(sl()));

  sl.registerFactory(() => AuthCubit(
    loginUseCase: sl(),
    registerUseCase: sl(),
    forgetPasswordUseCase: sl(),
    resetPasswordUseCase: sl(),
  ));
}

void _registerHome() {
  // Home feature
  sl.registerLazySingleton<HomeRemoteDataSource>(() => HomeRemoteDataSourceImpl());
  sl.registerLazySingleton<HomeRepository>(() => HomeRepositoryImpl(remoteDataSource: sl()));

  sl.registerLazySingleton(() => GetSlidersUseCase(sl()));
  sl.registerLazySingleton(() => GetBestSellersUseCase(sl()));

  sl.registerFactory(() => HomeCubit(
    getSlidersUseCase: sl(),
    getBestSellersUseCase: sl(),
  ));

  // Search Feature
  sl.registerLazySingleton<SearchRemoteDataSource>(() => SearchRemoteDataSourceImpl());
  sl.registerLazySingleton<SearchRepository>(() => SearchRepositoryImpl(remoteDataSource: sl()));

  sl.registerLazySingleton(() => GetAllProductsUseCase(sl()));
  sl.registerLazySingleton(() => SearchProductsUseCase(sl()));

}

void _registerCart() {
  sl.registerLazySingleton<CartRemoteDataSource>(() => CartRemoteDataSourceImpl());
  sl.registerLazySingleton<CartRepository>(() => CartRepositoryImpl(remoteDataSource: sl()));

  sl.registerLazySingleton(() => GetCartUseCase(sl()));
  sl.registerLazySingleton(() => AddToCartUseCase(sl()));
  sl.registerLazySingleton(() => RemoveFromCartUseCase(sl()));
  sl.registerLazySingleton(() => UpdateCartUseCase(sl()));
  sl.registerLazySingleton(() => CheckoutUseCase(sl()));

  sl.registerFactory(() => CartCubit(
    getCartUseCase: sl(),
    addToCartUseCase: sl(),
    removeFromCartUseCase: sl(),
    updateCartUseCase: sl(),
    checkoutUseCase: sl(),
  ));
}

void _registerWishList() {
  sl.registerLazySingleton<WishlistRemoteDataSource>(() => WishlistRemoteDataSourceImpl());
  sl.registerLazySingleton<WishlistRepository>(() => WishlistRepositoryImpl(remoteDataSource: sl()));

  sl.registerLazySingleton(() => GetWishlistUseCase(sl()));
  sl.registerLazySingleton(() => AddToWishlistUseCase(sl()));
  sl.registerLazySingleton(() => RemoveFromWishlistUseCase(sl()));

  sl.registerFactory(() => WishListCubit(
    getWishlistUseCase: sl(),
    addToWishlistUseCase: sl(),
    removeFromWishlistUseCase: sl(),
  ));
}

void _registerBookDetails() {
  sl.registerFactory(() => BookDetailsCubit(
    addToWishlistUseCase: sl(),
    addToCartUseCase: sl(),
  ));
}
