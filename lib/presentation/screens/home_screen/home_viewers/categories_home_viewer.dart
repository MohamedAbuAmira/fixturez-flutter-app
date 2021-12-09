import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/constants.dart';

class CategoriesHomeSection extends StatelessWidget {
  const CategoriesHomeSection({
    Key? key,
    required this.categoryHome,
  }) : super(key: key);

  final List<CategoryHome> categoryHome;

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      children: categoryHome,
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
