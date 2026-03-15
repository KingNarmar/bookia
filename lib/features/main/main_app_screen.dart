import 'package:bookia/core/constants/app_images.dart';
import 'package:bookia/core/styles/app_colors.dart';
import 'package:bookia/features/home/presentation/screens/home_screen.dart';
import 'package:bookia/features/wish_list/presentation/cubit/wish_list_cubit.dart';
import 'package:bookia/features/wish_list/presentation/screens/wish_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class MainAppScreen extends StatefulWidget {
  const MainAppScreen({super.key});

  @override
  State<MainAppScreen> createState() => _MainAppScreenState();
}

class _MainAppScreenState extends State<MainAppScreen> {
  int selectedIndex = 0;
  List<Widget> screens = [
    HomeScreen(),
    BlocProvider(
      create: (context) => WishListCubit()..getWishList(),
      child: WishlistScreen(),
    ),
    Center(child: Text("Cart")),
    Center(child: Text("Profile")),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _navBar(),
      body: screens[selectedIndex],
    );
  }

  BottomNavigationBar _navBar() {
    return BottomNavigationBar(
      onTap: (value) {
        setState(() {
          selectedIndex = value;
        });
      },
      type: BottomNavigationBarType.fixed,
      currentIndex: selectedIndex,
      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset(AppImages.homeIconSvg),
          activeIcon: SvgPicture.asset(
            AppImages.homeIconSvg,
            colorFilter: ColorFilter.mode(
              AppColors.primaryColor,
              BlendMode.srcIn,
            ),
          ),
          label: "",
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(AppImages.bookMarkIconSvg),
          activeIcon: SvgPicture.asset(
            AppImages.bookMarkIconSvg,
            colorFilter: ColorFilter.mode(
              AppColors.primaryColor,
              BlendMode.srcIn,
            ),
          ),
          label: "",
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(AppImages.cartIconSvg),
          activeIcon: SvgPicture.asset(
            AppImages.cartIconSvg,
            colorFilter: ColorFilter.mode(
              AppColors.primaryColor,
              BlendMode.srcIn,
            ),
          ),
          label: "",
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(AppImages.profileIconSvg),
          activeIcon: SvgPicture.asset(
            AppImages.profileIconSvg,
            colorFilter: ColorFilter.mode(
              AppColors.primaryColor,
              BlendMode.srcIn,
            ),
          ),
          label: "",
        ),
      ],
    );
  }
}
