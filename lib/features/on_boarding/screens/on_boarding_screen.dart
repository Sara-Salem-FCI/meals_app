import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/colors.dart';
import '../../home/screens/home_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final CarouselSliderController _controller = CarouselSliderController();
  int currentIndex = 0;

  static const List<String> titles = [
    'Save Your\nMeals\nIngredient',
    'Use Our App\nThe Best\nChoice',
    'Our App\nYour Ultimate\nChoice',
  ];

  static const List<String> subtitles = [
    'Add Your Meals and its Ingredients and we will save it for you',
    'The best choice for your kitchen, do not hesitate',
    'All the best restaurants and their top menus are ready for you',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: 50.h,
            left: 30.w,
            right: 30.w,
            child: Container(
              height: 400.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(48),
                color: AppColors.orange.withValues(alpha: 0.9),
              ),
              child: Padding(
                padding: const EdgeInsets.all(40.0),
                child: Column(
                  children: [
                    CarouselSlider.builder(
                      carouselController: _controller,
                      itemCount: titles.length,
                      options: CarouselOptions(
                        viewportFraction: 1.0,
                        height: 220.h,
                        onPageChanged: (index, reason) {
                          setState(() {
                            currentIndex = index;
                          });
                        },
                      ),
                      itemBuilder:
                          (context, index, realIdx) => Column(
                            children: [
                              Text(
                                titles[index],
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 32.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.white,
                                ),
                              ),
                              SizedBox(height: 20.h),
                              Text(
                                subtitles[index],
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.white,
                                ),
                              ),
                            ],
                          ),
                    ),
                    SizedBox(height: 20.h),
                    DotsIndicator(
                      dotsCount: titles.length,
                      position: currentIndex.toDouble(),
                      decorator: DotsDecorator(
                        activeColor: AppColors.white,
                        size: Size(24.0.w, 6.0.h),
                        activeSize: Size(24.0.w, 6.0.h),
                        activeShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        color: AppColors.grey,
                      ),
                    ),
                    const Spacer(),
                    currentIndex < titles.length - 1
                        ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap:
                                  () => Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const HomeScreen(),
                                    ),
                                  ),
                              child: Text(
                                'skip',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.white,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () => _controller.nextPage(),
                              child: Text(
                                'next',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.white,
                                ),
                              ),
                            ),
                          ],
                        )
                        : GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HomeScreen(),
                              ),
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.white,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.arrow_forward_rounded,
                                color: AppColors.orange,
                                size: 24.sp,
                              ),
                            ),
                          ),
                        ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
