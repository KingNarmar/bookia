import 'package:bookia/core/styles/app_colors.dart';
import 'package:bookia/core/styles/text_styles.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hint,
    this.keyboardType,
    this.validator,
    this.icon,
  });
  final String hint;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final IconButton? icon;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.accentColor,
        hintText: hint,
        hintStyle: TextStyles.w400s15.copyWith(color: AppColors.grayColor),
        prefixIcon: icon,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.borderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.borderColor),
        ),
      ),
      validator: validator,
      onChanged: (value) {},
    );
  }
}
