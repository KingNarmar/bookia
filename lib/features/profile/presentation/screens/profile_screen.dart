import 'package:bookia/core/constants/app_images.dart';
import 'package:bookia/core/functions/navigations.dart';
import 'package:bookia/core/routes/routes.dart';
import 'package:bookia/core/services/local/shared_pref.dart';
import 'package:bookia/core/styles/app_colors.dart';
import 'package:bookia/core/styles/text_styles.dart';
import 'package:bookia/features/profile/presentation/widgets/profile_tile.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var profileData = SharedPref.getUserInfo();
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile", style: TextStyles.w400s24),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(AppImages.logoutIconSvg),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: CachedNetworkImageProvider(
                    profileData?.image ?? "",
                    
                  ),
                  radius: 40,
                ),
                Gap(13),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(profileData?.name ?? "", style: TextStyles.w400s20),
                    Text(
                      profileData?.email ?? "",
                      style: TextStyles.w400s14.copyWith(
                        color: AppColors.grayColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Gap(35),
            ProfileTile(
              title: "My Orders",
              onTap: () => pushTo(Routes.myOrders, context),
            ),
            Gap(10),
            ProfileTile(
              title: "Edit Profile",
              onTap: () {
                pushTo(Routes.editProfile, context);
              },
            ),
            Gap(10),
            ProfileTile(
              title: "Reset Password",
              onTap: () => pushTo(Routes.resetPassword, context),
            ),
            Gap(10),
            ProfileTile(title: "FAQ"),
            Gap(10),
            ProfileTile(title: "Contact Us"),
            Gap(10),
            ProfileTile(title: "Privacy & Terms"),
            Gap(10),
          ],
        ),
      ),
    );
  }
}
