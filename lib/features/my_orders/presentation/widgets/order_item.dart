import 'package:bookia/core/styles/app_colors.dart';
import 'package:bookia/core/styles/text_styles.dart';
import 'package:flutter/material.dart';

class OrderItem extends StatelessWidget {
  final String orderNumber;
  final String date;
  final String totalAmount;

  const OrderItem({
    super.key,
    required this.orderNumber,
    required this.date,
    required this.totalAmount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 12),

      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text("OrderNo $orderNumber", style: TextStyles.w400s16),
              ),
              Text(
                date,
                style: TextStyles.w400s14.copyWith(color: AppColors.grayColor),
              ),
            ],
          ),
          const Divider(),

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'Total Amount: ',
                style: TextStyles.w400s16.copyWith(color: AppColors.grayColor),
              ),
              Text(totalAmount, style: TextStyles.w400s16),
            ],
          ),
        ],
      ),
    );
  }
}
