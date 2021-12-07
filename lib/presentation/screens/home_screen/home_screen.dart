import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:fixturez/core/constants/constants.dart';
import 'package:fixturez/presentation/screens/home_screen/widgets/widgets.dart';

import '../../../data/models/models.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static CategoryHome categoryHomeItem = const CategoryHome(
    imageName: 'icon_cat_sofas',
    productName: 'My product',
  );
  static List<CategoryHome> categoryHome = [
    categoryHomeItem,
    categoryHomeItem,
    categoryHomeItem,
    categoryHomeItem,
    categoryHomeItem,
    categoryHomeItem,
    categoryHomeItem,
    const CategoryHome(
      imageName: 'icon_cat_menu',
      productName: 'More',
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 14.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                children: [
                  AppIcons.customIcon(iconName: "ic_Burger"),
                  SizedBox(width: 15.w),
                  AppIcons.customIcon(iconName: "logo"),
                  SizedBox(width: 106.w),
                  AppIcons.customIcon(iconName: "ic_Heart"),
                  SizedBox(width: 26.w),
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
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 1.w),
              child: SizedBox(
                height: 184.h,
                child: GridView(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4),
                  children: categoryHome,
                ),
              ),
            ),
            SizedBox(height: 16.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: ViewAllHeader(
                text: 'Next Thing On Your Mind',
                onPressed: () {
                  print("view all");
                },
              ),
            ),
            SizedBox(height: 10.h),
            CategoryThingMind(),
            Container(
              color: AppColors.tertiaryGreyColor,
              height: 6.h,
              width: double.infinity,
            )
          ],
        ),
      ),
    ));
  }
}

class CategoryThingMind extends StatelessWidget {
  const CategoryThingMind({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 162.w,
      height: 162.h,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(16.r)),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Container(
            color: Colors.red,
          ),
          Positioned(bottom: 8.h, child: const Text("Category"))
        ],
      ),
    );
  }
}

class ViewAllHeader extends StatelessWidget {
  const ViewAllHeader({
    Key? key,
    required this.onPressed,
    required this.text,
  }) : super(key: key);
  final VoidCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: AppTextStyles.PoppinsBody2(textColor: AppColors.darkColor),
        ),
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
    required this.productName,
    required this.imageName,
  }) : super(key: key);
  final String productName;
  final String imageName;

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
          AppIcons.customIcon(iconName: imageName, width: 44.w, height: 44.h),
          SizedBox(
            height: 5.h,
          ),
          Text(
            productName,
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
