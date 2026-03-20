import 'package:bookia/core/constants/app_images.dart';
import 'package:bookia/core/styles/app_colors.dart';
import 'package:bookia/core/styles/text_styles.dart';
import 'package:bookia/features/cart/data/models/cart_response/cart_item.dart';
import 'package:bookia/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class CartTile extends StatelessWidget {
  const CartTile({super.key, this.cartItem});
  final CartItem? cartItem;
  @override
  Widget build(BuildContext context) {
    var cubit = context.read<CartCubit>();
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Center(
            child: ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(12),
              child: Image.network(
                cartItem?.itemProductImage ?? '',
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
                  cartItem?.itemProductName ?? '',
                  style: TextStyles.w400s18.copyWith(color: AppColors.black3),
                ),
                Gap(9),
                Text(
                  "₹${cartItem?.itemProductPrice ?? 0}",
                  style: TextStyles.w400s16,
                ),
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
            onPressed: () {
              cubit.removeFromCart(cartItem?.itemId ?? 0);
            },
            icon: SvgPicture.asset(AppImages.removeIconSvg),
          ),
        ],
      ),
    );
  }
}
