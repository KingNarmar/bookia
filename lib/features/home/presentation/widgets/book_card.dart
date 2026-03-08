import 'package:bookia/core/constants/app_images.dart';
import 'package:bookia/core/styles/app_colors.dart';
import 'package:bookia/core/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class BookCard extends StatelessWidget {
  const BookCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(11),
      width: 163,
      height: 281,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.secondaryColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(10),
              child: Image.asset(
                AppImages.welcome,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text("The Republic", style: TextStyles.w400s18),
          Gap(24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("₹285", style: TextStyles.w400s16),
              Container(
                height: 28,
                width: 73,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: AppColors.darkColor,
                ),
                child: Center(
                  child: Text(
                    "Buy",
                    style: TextStyles.w400s14.copyWith(
                      color: AppColors.bgColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
