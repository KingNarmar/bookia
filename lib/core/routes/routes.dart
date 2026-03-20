import 'package:bookia/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:bookia/features/auth/presentation/screens/create_new_password_screen.dart';
import 'package:bookia/features/auth/presentation/screens/forget_password.dart';
import 'package:bookia/features/auth/presentation/screens/login_screen.dart';
import 'package:bookia/features/auth/presentation/screens/otp_verification_screen.dart';
import 'package:bookia/features/auth/presentation/screens/password_changed_screen.dart';
import 'package:bookia/features/auth/presentation/screens/register_screen.dart';
import 'package:bookia/features/book_details/presentation/cubit/book_details_cubit.dart';
import 'package:bookia/features/book_details/presentation/screens/book_details_screen.dart';
import 'package:bookia/features/home/data/models/product_model/product.dart';
import 'package:bookia/features/home/presentation/screens/home_screen.dart';
import 'package:bookia/features/main/main_app_screen.dart';
import 'package:bookia/features/place_order/presentation/screens/congrats_screen.dart';
import 'package:bookia/features/place_order/presentation/screens/place_order_screen.dart';
import 'package:bookia/features/welcome/screens/splash_screen.dart';
import 'package:bookia/features/welcome/screens/welcome_screen.dart';
import 'package:bookia/features/wish_list/presentation/screens/wish_list_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class Routes {
  static const String splash = "/";
  static const String welcome = "/welcome";
  static const String login = "/login";
  static const String register = "/register";
  static const String mainApp = "/mainApp";
  static const String home = "/home";
  static const String forgetPassword = "/forget-password";
  static const String passwordChanged = "/password-changed";
  static const String otpScreen = "/otpScreen";
  static const String createNewPassword = "/create-new-password";
  static const String bookDetails = "/book-details";
  static const String wishList = "/wish-list";
  static const String placeOrder = "/place-order";
  static const String congrats = "/congrats";

  static var routs = GoRouter(
    routes: [
      GoRoute(
        path: Routes.splash,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: Routes.welcome,
        builder: (context, state) => const WelcomeScreen(),
      ),
      GoRoute(
        path: Routes.login,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: Routes.register,
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(
        path: Routes.mainApp,
        builder: (context, state) => const MainAppScreen(),
      ),
      GoRoute(
        path: Routes.home,
        builder: (context, state) => const HomeScreen(),
      ),

      GoRoute(
        path: Routes.passwordChanged,
        builder: (context, state) => const PasswordChangedScreen(),
      ),
      GoRoute(
        path: Routes.otpScreen,
        builder: (context, state) {
          final cubit = state.extra as AuthCubit;
          return BlocProvider.value(
            value: cubit,
            child: const OtpVerificationScreen(),
          );
        },
      ),
      GoRoute(
        path: Routes.createNewPassword,
        builder: (context, state) {
          final cubit = state.extra as AuthCubit;
          return BlocProvider.value(
            value: cubit,
            child: const CreateNewPasswordScreen(),
          );
        },
      ),
      GoRoute(
        path: Routes.passwordChanged,
        builder: (context, state) {
          final cubit = state.extra as AuthCubit;
          return BlocProvider.value(
            value: cubit,
            child: const PasswordChangedScreen(),
          );
        },
      ),

      GoRoute(
        path: Routes.forgetPassword,
        builder: (context, state) => const ForgetPasswordScreen(),
      ),

      GoRoute(
        path: Routes.bookDetails,
        builder: (context, state) => BlocProvider(
          create: (context) => BookDetailsCubit(),
          child: BookDetailsScreen(product: state.extra as Product),
        ),
      ),

      GoRoute(
        path: Routes.wishList,
        builder: (context, state) => const WishlistScreen(),
      ),

      GoRoute(
        path: Routes.placeOrder,
        builder: (context, state) => const PlaceOrderScreen(),
      ),
      GoRoute(
        path: Routes.congrats,
        builder: (context, state) => const CongratsScreen(),
      ),
    ],
  );
}
