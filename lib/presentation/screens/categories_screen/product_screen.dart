import 'package:fixturez/presentation/screens/categories_screen/widgets/review_tab_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/constants/constants.dart';
import '../../../data/models/models.dart';
import '../widgets/widgets.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key, required this.product}) : super(key: key);
  final Product product;

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

Color? heartColor;
int allReviewsCount = 142;
double productRating = 4.35;

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: AppIcons.customIcon(iconName: "ic_back"),
        ),
        actions: [
          AppIcons.customIcon(iconName: "ic_share"),
          SizedBox(width: 26.w),
          AppIcons.customIcon(iconName: "ic_cart"),
          SizedBox(
            width: 20.w,
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ProductImagesSlder(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: _productInfoSection(),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.h, left: 20.w, right: 20.w),
                child: _tabBarWithView(),
              ),
              Padding(
                padding: EdgeInsets.only(
                  bottom: 16.w,
                  top: 20.h,
                ),
                child: const SectionDivider(),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: _policiesSection(),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 16.h, top: 16.h),
                child: const SectionDivider(),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: _seeAllHeader(),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: SizedBox(
                  height: 222.h,
                  child: RecommendedProductsViewer(
                      products: [widget.product, widget.product]),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 13.h),
                child: _addToBagSection(),
              )
            ],
          ),
        ),
      ),
    );
  }

  Row _seeAllHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'You may also like',
          style: AppTextStyles.PoppinsBody2(textColor: Colors.black),
        ),
        TextButton(
            onPressed: () {},
            child: Text(
              "See All",
              style: AppTextStyles.PoppinsFootnote(
                textColor: AppColors.secondaryColor,
              ),
            ))
      ],
    );
  }

  Row _addToBagSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
            height: 59.h,
            width: 59.w,
            child: InkWell(
                onTap: () {
                  setState(() {
                    heartColor = const Color.fromRGBO(244, 67, 54, 1);
                  });
                },
                child: AppIcons.customIcon(
                    iconName: 'ic_Heart', iconColor: heartColor)),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(color: AppColors.secondaryGreyColor, width: 1),
            )),
        Container(
          height: 59.h,
          width: 264.w,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
              color: AppColors.primaryColor),
          child: TextButton(
              onPressed: () {},
              child: Text(
                "Add to bag",
                style: AppTextStyles.PoppinsH4(textColor: AppColors.whiteColor),
              )),
        )
      ],
    );
  }

  Column _policiesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _policyItem(
            iconName: "lock",
            subtitle: 'for all products',
            title: 'Security policy'),
        SizedBox(
          height: 10.h,
        ),
        _policyItem(
            iconName: "delivery",
            subtitle: 'Item will be shipped in 1-2 business days',
            title: 'Delivery policy'),
        SizedBox(
          height: 10.h,
        ),
        _policyItem(
            iconName: "return",
            subtitle: '7 Days of receiving your order',
            title: 'Return policy')
      ],
    );
  }

  Container _policyItem(
      {required String iconName,
      required String title,
      required String subtitle}) {
    return Container(
      width: double.infinity,
      // height: 100.h,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
          color: AppColors.tertiaryGreyColor,
          borderRadius: BorderRadius.circular(12.r)),
      child: ListTile(
        minVerticalPadding: 0.0,
        contentPadding: EdgeInsets.only(left: 8.w, top: 0),
        horizontalTitleGap: 11.w,
        leading:
            AppIcons.customIcon(iconName: iconName, width: 41.w, height: 41.h),
        title: Text(
          title,
          style: AppTextStyles.PoppinsCaption(textColor: Colors.black),
        ),
        subtitle: Text(
          subtitle,
          style: AppTextStyles.PoppinsCaption(
              textColor: AppColors.primaryGreyColor),
        ),
      ),
    );
  }

  Widget _tabBarWithView() {
    return DefaultTabController(
      length: 3,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TabBar(
              // padding: ,
              // labelPadding: EdgeInsets.only(left: -5, right: 20.w),
              indicatorSize: TabBarIndicatorSize.label,
              indicatorPadding:
                  EdgeInsets.only(left: 0, top: 8.h, bottom: 15.h),
              isScrollable: true,
              indicatorColor: AppColors.secondaryColor,
              labelColor: AppColors.secondaryColor,
              labelStyle: AppTextStyles.PoppinsFootnote(
                textColor: AppColors.secondaryColor,
              ),
              unselectedLabelColor: AppColors.primaryGreyColor,
              unselectedLabelStyle: AppTextStyles.PoppinsFootnote(
                textColor: AppColors.primaryGreyColor,
              ),
              tabs: [
                const Tab(
                  text: "Description",
                ),
                Tab(
                  text: "Reviews ($allReviewsCount)",
                ),
                const Tab(
                  text: "Additional information",
                ),
              ]),
          SizedBox(
            height: 500.h,
            width: double.infinity,
            child: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              children: [
                Text(
                  widget.product.infoEn,
                  style: AppTextStyles.PoppinsBody1(
                      textColor: AppColors.primaryGreyColor),
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                ),
                ReviewTabBarView(
                  productRating: productRating,
                  reviewsCount: allReviewsCount,
                ),
                Text(
                  'No information',
                  style: AppTextStyles.PoppinsBody1(
                      textColor: AppColors.primaryGreyColor),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _productInfoSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 16.h, bottom: 4.h),
          child: Text("Parin",
              style: AppTextStyles.PoppinsCaption(
                  textColor: AppColors.primaryGreyColor)),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 4.h),
          child: Text(
            widget.product.nameEn,
            style: AppTextStyles.PoppinsH2(textColor: AppColors.darkColor),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
        RichText(
          text: TextSpan(
            style: AppTextStyles.PoppinsH2(textColor: AppColors.secondaryColor),
            children: <TextSpan>[
              TextSpan(text: '\$${widget.product.offerPrice} '),
              TextSpan(
                text: '\$${widget.product.price}',
                style:
                    AppTextStyles.PoppinsH4(textColor: AppColors.primaryColor),
              ),
            ],
          ),
        ),
        SizedBox(height: 20.h),
        Padding(
          padding: EdgeInsets.only(bottom: 10.h),
          child: Text('Dimension',
              style: AppTextStyles.PoppinsSubtitle(
                  textColor: AppColors.darkColor)),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _productDimensions(),
            _productDimensions(heigt: 60, width: 90),
            _productDimensions(heigt: 80, width: 120),
          ],
        ),
      ],
    );
  }

  Container _productDimensions({int heigt = 40, int width = 60}) {
    return Container(
      alignment: Alignment.center,
      height: 34.h,
      width: 106.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.r),
        border: Border.all(color: AppColors.secondaryGreyColor, width: 1),
      ),
      child: Text(
        '$heigt x $width cm',
        style: AppTextStyles.PoppinsFootnote(
            textColor: AppColors.primaryGreyColor),
      ),
    );
  }
}

class RecommendedProductsViewer extends StatelessWidget {
  const RecommendedProductsViewer({Key? key, required this.products})
      : super(key: key);
  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ProductCard(product: products[0]),
        SizedBox(
          width: 11.w,
        ),
        ProductCard(
          product: products[1],
        )
      ],
    );
  }
}
