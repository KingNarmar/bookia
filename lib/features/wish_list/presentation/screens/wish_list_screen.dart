import 'package:bookia/core/styles/text_styles.dart';
import 'package:bookia/core/widgets/shimmer/grid_shimmer.dart';
import 'package:bookia/features/home/presentation/widgets/book_card.dart';
import 'package:bookia/features/wish_list/presentation/cubit/wish_list_cubit.dart';
import 'package:bookia/features/wish_list/presentation/cubit/wish_list_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Wishlist", style: TextStyles.w400s24),
        centerTitle: true,
      ),
      body: BlocBuilder<WishListCubit, WishListState>(
        builder: (context, state) {
          if (state is WishListSuccessState) {
            var cubit = context.read<WishListCubit>().products;
            if (cubit.isEmpty) {
              return Center(child: Text("No items in wishlist"));
            }
            return Padding(
              padding: const EdgeInsets.all(22),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 11,
                  mainAxisSpacing: 11,
                  childAspectRatio: 0.7,
                ),
                itemBuilder: (context, index) {
                  return BookCard(
                    product: cubit[index],
                    isInWishList: true,
                    onRemoveFromWishList: () {
                      context.read<WishListCubit>().removeFromWishList(
                        cubit[index].id ?? 0,
                      );
                    },
                  );
                },
                itemCount: cubit.length,
              ),
            );
          } else if (state is WishListLoadingState) {
            return GridShimmer();
          } else {
            return Center(child: Text("No items in wishlist"));
          }
        },
      ),
    );
  }
}
