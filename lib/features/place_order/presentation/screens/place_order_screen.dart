import 'package:bookia/core/constants/app_images.dart';
import 'package:bookia/core/functions/navigations.dart';
import 'package:bookia/core/routes/routes.dart';
import 'package:bookia/core/styles/app_colors.dart';
import 'package:bookia/core/styles/text_styles.dart';
import 'package:bookia/core/widgets/custom_text_form_field.dart';
import 'package:bookia/features/cart/presentation/widgets/cart_screen_btttom_nav_bar.dart';
import 'package:bookia/features/place_order/presentation/widgets/custom_drop_down_btn_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class PlaceOrderScreen extends StatelessWidget {
  const PlaceOrderScreen({super.key, required this.totalPrice});
  final double totalPrice;
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        title: IconButton(
          onPressed: () {
            pop(context);
          },
          icon: SvgPicture.asset(AppImages.backIconsvg),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Form(
        key: formKey,

        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Place Your Order", style: TextStyles.w400s30),
                Gap(10),
                Text(
                  "Don't worry! It occurs. Please enter the email address linked with your account.",
                  style: TextStyles.w400s16.copyWith(
                    color: AppColors.grayColor,
                  ),
                ),
                Gap(25),
                CustomTextFormField(hint: "Full Name"),
                Gap(12),
                CustomTextFormField(hint: "Email"),
                Gap(12),
                CustomTextFormField(hint: "Address"),
                Gap(12),
                CustomTextFormField(hint: "Phone Number"),
                Gap(12),
                CustomDropDownBtnFormField(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
        child: CartScreenBtttomNavBar(
          text: "Place Order",
          totalPrice: totalPrice,
          onPressed: () {
            if (formKey.currentState!.validate()) {
              pushTo(Routes.congrats, context);
            }
          },
        ),
      ),
    );
  }
}
