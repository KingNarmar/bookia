import 'package:bookia/core/styles/app_colors.dart';
import 'package:bookia/core/styles/text_styles.dart';
import 'package:flutter/material.dart';

class PasswordTextFormField extends StatefulWidget {
  const PasswordTextFormField({
    super.key,
    this.validator,
    this.hint = "Enter Your Password",
    this.passwordController,
  });

  final String? Function(String?)? validator;
  final String? hint;
  final TextEditingController? passwordController;
  @override
  State<PasswordTextFormField> createState() => _PasswordTextFormFieldState();
}

class _PasswordTextFormFieldState extends State<PasswordTextFormField> {
  bool ishide = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.passwordController,
      obscureText: ishide,
      keyboardType: TextInputType.emailAddress,
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      decoration: InputDecoration(
        fillColor: AppColors.accentColor,
        filled: true,
        suffixIcon: IconButton(
          icon: ishide
              ? Icon(Icons.remove_red_eye)
              : Icon(Icons.visibility_off),
          onPressed: () {
            setState(() {
              ishide = !ishide;
            });
          },
        ),
        hintText: widget.hint,
        hintStyle: TextStyles.w400s15.copyWith(color: AppColors.grayColor),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.borderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.borderColor),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.errorColor),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.errorColor),
        ),
      ),
      validator: widget.validator,
      onChanged: (value) {},
    );
  }
}
