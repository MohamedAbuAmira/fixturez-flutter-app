import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/constants/constants.dart';
import '../../../data/models/models.dart';
import '../../router/app_router.dart';
import 'widgets.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({
    Key? key,
    required this.product,
    this.height = 170,
    this.width = 162,
  }) : super(key: key);
  final Product product;
  final double height;
  final double width;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  var heartIconColor;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onDoubleTap: () {
            setState(() {
              if (heartIconColor == null) {
                heartIconColor = Colors.red;
              } else {
                heartIconColor = null;
              }
            });
          },
          onTap: () {
            Navigator.pushNamed(context, AppRouter.product,
                arguments: widget.product);
          },
          child: Stack(children: [
            SizedBox(
              height: 170.h,
              width: 162.w,
              child: PictureProvider(
                borderRadius: 0,
                image: widget.product.imageUrl,
              ),
            ),
            Positioned(
                top: 6.h,
                right: 6.w,
                child: SizedBox(
                  child: Container(
                    width: 28.w,
                    height: 28.h,
                    child: AppIcons.customIcon(
                        iconName: 'ic_CircleHeart',
                        width: 28.w,
                        height: 28.h,
                        iconColor: heartIconColor),
                  ),
                )),
          ]),
        ),
        Padding(
          padding: EdgeInsets.only(top: 10.h, bottom: 4.h),
          child: Text(
            widget.product.nameEn,
            style:
                AppTextStyles.PoppinsFootnote(textColor: AppColors.darkColor),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
        RichText(
          text: TextSpan(
            style: AppTextStyles.PoppinsFootnote(
                textColor: AppColors.secondaryColor),
            children: <TextSpan>[
              TextSpan(text: '\$${widget.product.offerPrice} '),
              TextSpan(
                text: '\$${widget.product.price}',
                style: AppTextStyles.PoppinsFootnote(
                    textColor: AppColors.primaryColor),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
