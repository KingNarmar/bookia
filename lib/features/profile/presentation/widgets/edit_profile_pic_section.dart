import 'package:bookia/core/styles/app_colors.dart';
import 'package:flutter/material.dart';

class EditProfilePicSection extends StatelessWidget {
  const EditProfilePicSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(backgroundColor: AppColors.grayColor, radius: 60),
        Positioned(
          right: 0,
          bottom: 0,
          child: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: AppColors.bgColor,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 2),
            ),
            child: Center(
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.camera_alt_outlined,
                  size: 20,
                  color: AppColors.primaryColor,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
