import 'package:bookia/core/constants/app_fonts.dart';
import 'package:bookia/features/welcome/screens/splash_screen.dart';
import 'package:flutter/material.dart';

class Bookia extends StatelessWidget {
  const Bookia({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: AppFonts.dmSerifDisplay),
      home: SplashScreen(),
    );
  }
}
