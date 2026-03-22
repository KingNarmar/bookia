import 'package:bookia/core/styles/app_colors.dart';
import 'package:bookia/core/widgets/main_button.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CartScreenBtttomNavBar extends StatelessWidget {
  const CartScreenBtttomNavBar({
    super.key,
    required this.onPressed,
    this.totalPrice = 0,
  });
  final double totalPrice;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Column(
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
              "\$ ${totalPrice.toStringAsFixed(2)}",
              style: TextStyle(
                fontFamily: "Nunito Sans",
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        Gap(19),
        MainButton(text: "Checkout", onPressed: onPressed),
      ],
    );
  }
}
