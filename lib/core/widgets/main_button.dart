import 'package:bookia/core/styles/app_colors.dart';
import 'package:bookia/core/styles/text_styles.dart';
import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.color = AppColors.primaryColor,
  });
  final String text;
  final Function() onPressed;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        minimumSize: const Size(double.infinity, 55),
        foregroundColor: AppColors.bgColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(8),
          side: color != AppColors.primaryColor
              ? BorderSide(color: AppColors.darkColor, width: 1)
              : BorderSide.none,
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyles.w400s15.copyWith(
          color: color != AppColors.primaryColor
              ? AppColors.darkColor
              : AppColors.bgColor,
        ),
      ),
    );
  }
}
