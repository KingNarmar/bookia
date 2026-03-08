import 'package:bookia/core/styles/app_colors.dart';
import 'package:bookia/features/home/presentation/cubit/home_cubit.dart';
import 'package:bookia/features/home/presentation/cubit/home_state.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeSlider extends StatefulWidget {
  const HomeSlider({super.key});

  @override
  State<HomeSlider> createState() => _HomeSliderState();
}

class _HomeSliderState extends State<HomeSlider> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeLoadingState) {
          return const SizedBox(
            height: 180,
            child: Center(child: CircularProgressIndicator()),
          );
        }

        if (state is HomeErrorState) {
          return SizedBox(
            height: 180,
            child: Center(child: Text(state.errorMsg)),
          );
        }

        if (state is HomeSuccessState) {
          final sliders = state.sliders;

          if (sliders.isEmpty) {
            return const SizedBox(
              height: 180,
              child: Center(child: Text('No sliders found')),
            );
          }

          return Column(
            children: [
              CarouselSlider.builder(
                itemCount: sliders.length,
                itemBuilder: (context, itemIndex, pageViewIndex) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      sliders[itemIndex].image,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          width: double.infinity,
                          color: Colors.grey.shade300,
                          child: const Center(child: Icon(Icons.broken_image)),
                        );
                      },
                    ),
                  );
                },
                options: CarouselOptions(
                  height: 150,
                  viewportFraction: 1,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.3,
                  onPageChanged: (index, reason) {
                    setState(() {
                      activeIndex = index;
                    });
                  },
                  scrollDirection: Axis.horizontal,
                ),
              ),
              const Gap(14),
              AnimatedSmoothIndicator(
                activeIndex: activeIndex,
                count: sliders.length,
                effect: ExpandingDotsEffect(
                  dotColor: AppColors.borderColor,
                  activeDotColor: AppColors.primaryColor,
                ),
              ),
            ],
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
