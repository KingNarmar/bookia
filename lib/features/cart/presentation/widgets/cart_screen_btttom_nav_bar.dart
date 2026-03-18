import 'package:bookia/core/styles/app_colors.dart';
import 'package:bookia/core/widgets/main_button.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CartScreenBtttomNavBar extends StatelessWidget {
  const CartScreenBtttomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total:",
                style: TextStyle(
                  fontFamily: "Nunito Sans",
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: AppColors.grayColor,
                ),
              ),
              Text(
                "\$ 95.00",
                style: TextStyle(
                  fontFamily: "Nunito Sans",
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          Gap(19),
          MainButton(text: "Checkout", onPressed: () {}),
        ],
      ),
    );
  }
}
