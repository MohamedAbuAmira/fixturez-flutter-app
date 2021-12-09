import '../../../../core/constants/constants.dart';
import '../../../../data/models/models.dart';
import '../../widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryThingKeepMindViewer extends StatelessWidget {
  const CategoryThingKeepMindViewer({
    Key? key,
    required this.categories,
  }) : super(key: key);

  final List<Category> categories;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1,
        crossAxisSpacing: 1,
        mainAxisSpacing: 1,
      ),
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: 4,
      scrollDirection: Axis.vertical,
      itemBuilder: (ctx, index) {
        return CategoryItem(category: categories[index]);
      },
    );
  }
}

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    Key? key,
    required this.category,
  }) : super(key: key);
  final Category category;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 162.w,
      height: 162.h,
      margin: EdgeInsetsDirectional.fromSTEB(5.w, 5.h, 5.w, 5.h),
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          PictureProvider(image: category.imageUrl, borderRadius: 16),
          Positioned(
              bottom: 8.h,
              child: Text(
                category.nameEn,
                style: AppTextStyles.PoppinsSubtitle(
                    textColor: AppColors.whiteColor),
              ))
        ],
      ),
    );
  }
}
