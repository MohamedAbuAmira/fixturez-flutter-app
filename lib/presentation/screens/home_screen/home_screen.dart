import 'package:fixturez/core/constants/constants.dart';
import 'package:fixturez/presentation/screens/home_screen/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../data/models/models.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 14.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                children: [
                  AppIcons.customIcon(iconName: "ic_Burger"),
                  SizedBox(width: 15.h),
                  AppIcons.customIcon(iconName: "logo"),
                  SizedBox(width: 106.h),
                  AppIcons.customIcon(iconName: "ic_Heart"),
                  SizedBox(width: 26.h),
                  AppIcons.customIcon(iconName: "ic_Notification")
                ],
              ),
            ),
            SizedBox(height: 26.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: const SearchField(),
            ),
            SizedBox(height: 16.h),
            HomeSlider(),
          ],
        ),
      ),
    ));
  }
}

class HomeSlider extends StatefulWidget {
  const HomeSlider({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeSlider> createState() => _HomeSliderState();
}

class _HomeSliderState extends State<HomeSlider> {
  late PageController pageViewcontroller;
  List<SliderModel> slides = <SliderModel>[];
  late int currentIndex;
  @override
  void initState() {
    super.initState();
    // initilize when the screen open

    slides = getSlides();
    currentIndex = 0;
    pageViewcontroller = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 290.h,
          width: double.infinity,
          child: PageView.builder(
            // controller: pageViewcontroller,
            itemCount: slides.length,
            onPageChanged: (value) {
              setState(() {
                currentIndex = value;
              });
            },
            itemBuilder: (context, index) {
              return Image.asset(slides[index].getImagePath(),
                  fit: BoxFit.fill);
            },
          ),
        ),
        SizedBox(
          height: 12.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (int i = 0; i < slides.length; i++)
              currentIndex == i
                  ? _pageIndexIndicator(true)
                  : _pageIndexIndicator(false),
          ],
        ),
      ],
    );
  }

  Widget _pageIndexIndicator(bool isCurrentPage) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 6.w),
      height: isCurrentPage ? 9.h : 8.h,
      width: isCurrentPage ? 9.w : 8.w,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color:
            isCurrentPage ? AppColors.darkColor : AppColors.secondaryGreyColor,
      ),
    );
  }
}
