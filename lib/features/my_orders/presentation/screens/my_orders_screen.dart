import 'package:bookia/core/constants/app_images.dart';
import 'package:bookia/core/functions/navigations.dart';
import 'package:bookia/core/styles/text_styles.dart';
import 'package:bookia/features/my_orders/presentation/widgets/order_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyOrdersScreen extends StatelessWidget {
  const MyOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Orders", style: TextStyles.w400s20),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: SvgPicture.asset(AppImages.backIconsvg),
          onPressed: () => pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView.builder(
          itemBuilder: (context, index) => OrderItem(
            orderNumber: "123456789",
            date: "2023-10-10",
            totalAmount: "\$99.99",
          ),
          itemCount: 4,
        ),
      ),
    );
  }
}
