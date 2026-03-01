import 'package:bookia/core/constants/app_fonts.dart';
import 'package:bookia/core/styles/app_colors.dart';
import 'package:bookia/features/auth/screens/login_screen.dart';
import 'package:flutter/material.dart';

class Bookia extends StatelessWidget {
  const Bookia({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: AppFonts.dmSerifDisplay,
        scaffoldBackgroundColor: AppColors.bgColor,
        appBarTheme: AppBarThemeData(backgroundColor: AppColors.bgColor),
        dividerColor: AppColors.borderColor,
      ),
      home: LoginScreen(),
    );
  }
}
