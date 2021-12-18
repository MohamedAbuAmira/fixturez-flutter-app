import 'package:fixturez/presentation/router/app_router.dart';

import '../../../../core/constants/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

import '../../../../data/models/models.dart';
import '../../widgets/widgets.dart';

class HeavyDiscountViewer extends StatelessWidget {
  const HeavyDiscountViewer({
    Key? key,
    required this.categories,
  }) : super(key: key);

  final List<Category> categories;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      // gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      //   crossAxisCount: 1,
      //   childAspectRatio: 1,
      //   crossAxisSpacing: 1,
      //   mainAxisSpacing: 1,
      // ),
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: categories.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (ctx, index) {
        return _ProductItem(
          category: categories[index],
        );
      },
    );
  }
}

class _ProductItem extends StatelessWidget {
  const _ProductItem({
    Key? key,
    required this.category,
  }) : super(key: key);

  final Category category;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
          clipBehavior: Clip.antiAlias,
          alignment: Alignment.center,
          children: [
            Container(
              width: 240.w,
              height: 240.h,
              margin: EdgeInsetsDirectional.fromSTEB(4.w, 0, 4.w, 0),
              child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, AppRouter.subCategories,
                        arguments: category);
                  },
                  child: PictureProvider(image: category.imageUrl)),
            ),
            Text(category.nameEn,
                style:
                    AppTextStyles.PoppinsH4(textColor: AppColors.whiteColor)),
          ]),
    );
  }
}
