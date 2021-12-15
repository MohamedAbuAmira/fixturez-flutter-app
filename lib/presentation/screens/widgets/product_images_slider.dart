import 'package:fixturez/presentation/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/constants.dart';
import '../../../../data/models/models.dart';
import 'widgets.dart';

class ProductImagesSlder extends StatefulWidget {
  const ProductImagesSlder({
    Key? key,
    required this.images,
  }) : super(key: key);
  final List<ImagesSlider> images;

  @override
  State<ProductImagesSlder> createState() => _ProductImagesSlderState();
}

class _ProductImagesSlderState extends State<ProductImagesSlder> {
  late PageController pageViewcontroller;

  late int currentIndex;
  @override
  void initState() {
    super.initState();
    // initilize when the screen open

    currentIndex = 0;
    pageViewcontroller = PageController();
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      Future.delayed(const Duration(seconds: 3), () {
        currentIndex <= widget.images.length
            ? currentIndex = 2
            : currentIndex = 3;
      });
    });
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        SizedBox(
          height: 375.h,
          width: double.infinity,
          child: PageView.builder(
            // controller: pageViewcontroller,
            itemCount: widget.images.length,

            onPageChanged: (value) {
              setState(() {
                currentIndex = value;
              });
            },
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.pushNamed(context, AppRouter.product,
                      arguments: widget.images[index].objectId);
                },
                child: PictureProvider(
                  image: widget.images[index].imageUrl,
                  borderRadius: 0,
                ),
              );
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 10.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < widget.images.length; i++)
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
