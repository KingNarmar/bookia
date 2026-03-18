import 'package:bookia/core/styles/text_styles.dart';
import 'package:bookia/features/cart/presentation/widgets/cart_tile.dart';
import 'package:flutter/material.dart';

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
    );
  }
}
