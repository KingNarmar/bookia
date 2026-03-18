import 'package:bookia/core/constants/app_images.dart';
import 'package:bookia/core/styles/app_colors.dart';
import 'package:bookia/core/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class CartTile extends StatelessWidget {
  const CartTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
    
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(12),
                child: Image.asset(
                  AppImages.welcome,
                  height: 118,
                  width: 100,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Gap(20),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "The Republic",
                    style: TextStyles.w400s18.copyWith(
                      color: AppColors.black3,
                    ),
                  ),
                  Gap(9),
                  Text("₹285", style: TextStyles.w400s16),
                  Gap(32),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(AppImages.addIconSvg),
                      ),
                      Gap(15),
                      Text(
                        "01",
                        style: TextStyles.w400s18.copyWith(
                          fontFamily: "Nunito Sans",
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Gap(15),
                      IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(AppImages.minusIconSvg),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(AppImages.removeIconSvg),
            ),
          ],
        ),
      ),
    );
  }
}
