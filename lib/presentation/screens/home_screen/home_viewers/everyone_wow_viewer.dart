import 'package:fixturez/core/constants/constants.dart';
import 'package:fixturez/presentation/router/app_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

import '../../../../data/models/models.dart';
import '../../widgets/widgets.dart';

class EveryoneWowViewer extends StatelessWidget {
  const EveryoneWowViewer({
    Key? key,
    required this.products,
  }) : super(key: key);

  final List<Product> products;

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
      itemCount: products.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (ctx, index) {
        return _ProductItems(
          product: products[index],
        );
      },
    );
  }
}

class _ProductItems extends StatelessWidget {
  const _ProductItems({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, AppRouter.product,
                arguments: product.id);
          },
          child: Container(
            width: 240.w,
            height: 200.h,
            margin: EdgeInsetsDirectional.fromSTEB(4.w, 0, 4.w, 0),
            child: PictureProvider(image: product.imageUrl),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(4.w, 8.h, 0, 4.h),
          child: Text(
            product.nameEn,
            style:
                AppTextStyles.PoppinsSubtitle(textColor: AppColors.darkColor),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 4.w, top: 4.h),
          child: RichText(
            text: TextSpan(
              style: AppTextStyles.PoppinsCaption(
                  textColor: AppColors.secondaryGreyColor),
              children: <TextSpan>[
                const TextSpan(text: 'Start at '),
                TextSpan(
                  text: '\$${product.price}',
                  style: AppTextStyles.PoppinsCaption(
                      textColor: const Color(0xFF34A853)),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
