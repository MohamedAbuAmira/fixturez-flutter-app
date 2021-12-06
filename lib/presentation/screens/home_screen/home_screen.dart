import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:fixturez/core/constants/constants.dart';
import 'package:fixturez/presentation/screens/home_screen/widgets/widgets.dart';

import '../../../data/models/models.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static CategoryHome categoryHomeItem = CategoryHome();
  static List<CategoryHome> categoryHome = [
    categoryHomeItem,
    categoryHomeItem,
    categoryHomeItem,
    categoryHomeItem
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
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
            SizedBox(height: 20.h),
            SizedBox(
              height: 184.h,
              child: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                children: categoryHome,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: ViewAllHeader(
                onPressed: () {
                  print("view all");
                },
              ),
            )
          ],
        ),
      ),
    ));
  }
}

class ViewAllHeader extends StatelessWidget {
  const ViewAllHeader({
    Key? key,
    required this.onPressed,
  }) : super(key: key);
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("the best products"),
        TextButton(
            onPressed: onPressed,
            child: Text(
              "View All",
              style: AppTextStyles.PoppinsFootnote(
                  textColor: const Color(0xFF007AFF)),
            ))
      ],
    );
  }
}

class CategoryHome extends StatelessWidget {
  const CategoryHome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90.h,
      width: 94.w,
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.tertiaryGreyColor, width: 1)),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppIcons.customIcon(iconName: 'icon_cat_sofas'),
          SizedBox(
            height: 5.h,
          ),
          Text(
            "Product",
            style: AppTextStyles.PoppinsCaption(textColor: AppColors.darkColor),
          )
        ],
      ),
    );
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
