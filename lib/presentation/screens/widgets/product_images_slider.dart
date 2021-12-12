import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/constants.dart';
import '../../../../data/models/models.dart';
import 'widgets.dart';

class ProductImagesSlder extends StatefulWidget {
  const ProductImagesSlder({
    Key? key,
  }) : super(key: key);

  @override
  State<ProductImagesSlder> createState() => _ProductImagesSlderState();
}

class _ProductImagesSlderState extends State<ProductImagesSlder> {
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
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        SizedBox(
          height: 375.h,
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
              return PictureProvider(
                image: slides[index].getImageUrl(),
                borderRadius: 0,
              );
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 10.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < slides.length; i++)
                currentIndex == i
                    ? _pageIndexIndicator(true)
                    : _pageIndexIndicator(false),
            ],
          ),
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
