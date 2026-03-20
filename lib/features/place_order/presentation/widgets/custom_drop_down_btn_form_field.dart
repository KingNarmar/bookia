import 'package:bookia/core/styles/app_colors.dart';
import 'package:bookia/core/styles/text_styles.dart';
import 'package:flutter/material.dart';

class CustomDropDownBtnFormField extends StatelessWidget {
  const CustomDropDownBtnFormField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      items: [
        DropdownMenuItem(value: "Cairo", child: Text("Cairo")),
        DropdownMenuItem(
          value: "Alexandria",
          child: Text("Alexandria"),
        ),
      ],
      onChanged: (value) {},
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.accentColor,
        hint:Text("Governorate", style: TextStyles.w400s15.copyWith(color: AppColors.grayColor)),
       
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.borderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.borderColor),
        ),
      ),
    );
  }
}
