import 'package:bookia/core/constants/app_images.dart';
import 'package:bookia/core/functions/navigations.dart';
import 'package:bookia/core/styles/app_colors.dart';
import 'package:bookia/core/styles/text_styles.dart';
import 'package:bookia/core/widgets/dialogs.dart';
import 'package:bookia/features/book_details/presentation/cubit/book_details_cubit.dart';
import 'package:bookia/features/book_details/presentation/cubit/book_details_state.dart';
import 'package:bookia/features/book_details/presentation/widgets/wish_list_icon.dart';
import 'package:bookia/features/home/data/models/product_model/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class BookDetailsScreen extends StatelessWidget {
  const BookDetailsScreen({super.key, required this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {
    return BlocListener<BookDetailsCubit, BookDetailsState>(
      listener: (context, state) {
        if (state is BookDetailsSuccessState) {
          pop(context);
          showMyDialog(
            context,
            "Added to wish list successfully",
            type: DialogType.success,
          );
        } else if (state is BookDetailsErrorState) {
          pop(context);
          showMyDialog(context, "Failed to add to wish list");
        } else if (state is BookDetailsLoadingState) {
          showLoadingDialog(context);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: IconButton(
            onPressed: () {
              pop(context);
            },
            icon: SvgPicture.asset(AppImages.backIconsvg),
          ),
          automaticallyImplyLeading: false,
          actions: [
            WishListIcon(product: product),
            const SizedBox(width: 16),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Gap(30),
                ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(7),
                  child: Hero(
                    tag: product.id?.toInt() ?? 0,
                    child: Image.network(product.image ?? '', height: 270),
                  ),
                ),
                Gap(10),
                Text(
                  product.name ?? 'Unknown Title',
                  style: TextStyles.w400s30,
                ),
                Gap(10),
                Text(
                  product.category ?? 'Unknown Author',
                  style: TextStyles.w400s30.copyWith(
                    color: AppColors.primaryColor,
                  ),
                ),
                Gap(16),
                Text(
                  product.description ?? "No description available.",
                  style: TextStyles.w400s12,
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("\$ 258", style: TextStyles.w400s24),
              BookDetailsCubit().isInCart(product.id ?? 0)
                  ? Text(
                      "Already in Cart",
                      style: TextStyles.w400s14.copyWith(
                        color: AppColors.primaryColor,
                      ),
                    )
                  : GestureDetector(
                      onTap: () {
                        // Handle buy button tap
                        context.read<BookDetailsCubit>().addToCart(
                          product.id ?? 0,
                        );
                      },
                      child: Container(
                        height: 56,
                        width: 212,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: AppColors.darkColor,
                        ),
                        child: Center(
                          child: Text(
                            "Add to Cart",
                            style: TextStyles.w400s14.copyWith(
                              color: AppColors.bgColor,
                            ),
                          ),
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
