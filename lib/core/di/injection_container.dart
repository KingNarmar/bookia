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
import 'package:bookia/features/home/search/presentation/cubit/search_cubit.dart';

final sl = GetIt.instance;

/// Initialise all dependencies.
/// Called once in [main] before [runApp].
Future<void> initDependencies() async {
  _registerAuth();
  _registerHome();
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

  sl.registerFactory(() => SearchCubit(
    getAllProductsUseCase: sl(),
    searchProductsUseCase: sl(),
  ));
}
