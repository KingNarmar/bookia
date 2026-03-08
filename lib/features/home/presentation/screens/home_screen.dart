import 'package:bookia/core/constants/app_images.dart';
import 'package:bookia/core/styles/text_styles.dart';
import 'package:bookia/core/widgets/dialogs.dart';
import 'package:bookia/features/home/presentation/cubits/home_cubit/home_cubit.dart';
import 'package:bookia/features/home/presentation/cubits/home_cubit/home_state.dart';
import 'package:bookia/features/home/presentation/widgets/book_card.dart';
import 'package:bookia/features/home/presentation/widgets/home_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getHomeData(),
      child: Scaffold(
        appBar: AppBar(
          title: SvgPicture.asset(AppImages.logoSvg, height: 30),
          titleSpacing: 13,
          actions: [
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(AppImages.searchSvg),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: BlocConsumer<HomeCubit, HomeState>(
            listener: (context, state) {
              if (state is HomeLoadingState) {
                showLoadingDialog(context);
              }

              if (state is HomeSuccessState || state is HomeErrorState) {
                // pop(context);
              }
            },
            builder: (context, state) {
              if (state is HomeErrorState) {
                return Center(child: Text(state.errorMsg));
              }

              if (state is HomeSuccessState) {
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HomeSlider(),
                      const Gap(31),
                      Text("Best Seller", style: TextStyles.w400s24),
                      const Gap(15),
                      GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 11,
                              mainAxisSpacing: 11,
                              childAspectRatio: 0.7,
                            ),
                        itemBuilder: (context, index) {
                          return BookCard(product: state.products[index]);
                        },
                        itemCount: state.products.length,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                      ),
                    ],
                  ),
                );
              }

              return const SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }
}
