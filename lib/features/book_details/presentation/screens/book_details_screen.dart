import 'package:bookia/core/constants/app_images.dart';
import 'package:bookia/core/styles/app_colors.dart';
import 'package:bookia/core/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class BookDetailsScreen extends StatelessWidget {
  const BookDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SvgPicture.asset(AppImages.backIconsvg),
        automaticallyImplyLeading: false,
        actions: [
          SvgPicture.asset(AppImages.bookMarkIconSvg),
          const SizedBox(width: 16),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Gap(30),
                ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(7),
                  child: Image.asset(AppImages.welcome, height: 270),
                ),
                Gap(10),
                Text("Black Heart", style: TextStyles.w400s30),
                Gap(10),
                Text(
                  "Broché",
                  style: TextStyles.w400s30.copyWith(
                    color: AppColors.primaryColor,
                  ),
                ),
                Gap(16),
                Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. ",
                  style: TextStyles.w400s12,
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("\$ 258", style: TextStyles.w400s24),
            Container(
              height: 56,
              width: 212,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: AppColors.darkColor,
              ),
              child: Center(
                child: Text(
                  "Buy",
                  style: TextStyles.w400s14.copyWith(color: AppColors.bgColor),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
