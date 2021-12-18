import 'package:fixturez/data/web_services/web_services.dart';
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
  late bool isFavourites;
  late Color heartIconColor;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bool isFavourites = widget.product.isFavorite;
    heartIconColor = isFavourites ? Colors.red : Colors.transparent;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onDoubleTap: () async {
            await setFavorite();
          },
          onTap: () {
            Navigator.pushNamed(context, AppRouter.product,
                arguments: widget.product.id);
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
                    width: 32.w,
                    height: 32.h,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: heartIconColor),
                    child: AppIcons.customIcon(
                        iconName: "ic_Heart",
                        iconColor: Colors.black,
                        width: 28.w,
                        height: 28.h),
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
              TextSpan(
                text: '\$${widget.product.price} ',
                style: AppTextStyles.PoppinsFootnote(
                    textColor: AppColors.primaryColor),
              ),
              widget.product.offerPrice != null
                  ? TextSpan(text: '\$${widget.product.offerPrice}')
                  : const TextSpan(text: 'No Offer'),
              TextSpan(
                text: "    ${widget.product.quantity} Quantities Available",
                style: AppTextStyles.PoppinsCaption(
                    textColor: AppColors.primaryGreyColor),
              )
            ],
          ),
        ),
      ],
    );
  }

  Future<void> setFavorite() async {
    bool status = await FavoritesWebService()
        .setFavorite(context, idProduct: widget.product.id.toString());
  }
}
