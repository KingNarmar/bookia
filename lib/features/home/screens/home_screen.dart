import 'package:bookia/core/constants/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SvgPicture.asset(AppImages.logoSvg, height: 30),
        titleSpacing: 13,
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(AppImages.searchSvg),
          ),
        ],
      ),
    );
  }
}
