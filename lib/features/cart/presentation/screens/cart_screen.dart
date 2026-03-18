import 'package:bookia/core/styles/app_colors.dart';
import 'package:bookia/core/styles/text_styles.dart';
import 'package:bookia/core/widgets/main_button.dart';
import 'package:bookia/features/cart/presentation/widgets/cart_tile.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Cart", style: TextStyles.w400s24),
        centerTitle: true,
      ),
      body: ListView.separated(
        itemBuilder: (context, index) => CartTile(),
        separatorBuilder: (context, index) => Divider(),
        itemCount: 6,
      ),
      bottomNavigationBar: Padding(
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
      ),
    );
  }
}
