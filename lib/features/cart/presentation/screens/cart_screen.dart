import 'package:bookia/core/functions/navigations.dart';
import 'package:bookia/core/routes/routes.dart';
import 'package:bookia/core/styles/text_styles.dart';
import 'package:bookia/core/widgets/shimmer/list_shimmer.dart';
import 'package:bookia/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:bookia/features/cart/presentation/cubit/cart_state.dart';
import 'package:bookia/features/cart/presentation/widgets/cart_screen_btttom_nav_bar.dart';
import 'package:bookia/features/cart/presentation/widgets/cart_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Cart", style: TextStyles.w400s24),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 10, top: 50),
        child: BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            final cubit = context.read<CartCubit>();

            if (state is CartLoadingState) {
              return const ListShimmer();
            }

            if (state is CartErrorState) {
              return const Center(child: Text("Failed to load cart"));
            }

            if (cubit.cartItems.isEmpty) {
              return const Center(child: Text("Your cart is empty"));
            }

            return ListView.separated(
              itemCount: cubit.cartItems.length,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, index) =>
                  CartTile(cartItem: cubit.cartItems[index]),
            );
          },
        ),
      ),
      bottomNavigationBar: CartScreenBtttomNavBar(
        onPressed: () => pushTo(Routes.placeOrder, context),
      ),
    );
  }
}
