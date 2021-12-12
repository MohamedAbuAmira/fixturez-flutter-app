import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/constants.dart';

class ReviewTabBarView extends StatelessWidget {
  const ReviewTabBarView(
      {Key? key, required this.productRating, required this.reviewsCount})
      : super(key: key);
  final double productRating;
  final int reviewsCount;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            productRating.toString(),
            style: const TextStyle(
                color: Color(0xFF272727),
                fontSize: 92,
                fontWeight: FontWeight.w800),
          ),
          RatingBarIndicator(
            itemPadding: EdgeInsets.symmetric(horizontal: 3.w),
            unratedColor: Color(0xFFF1F1F1),
            rating: productRating,
            itemBuilder: (context, index) => const Icon(
              Icons.star,
              color: Color(0xFFFAC917),
            ),
            itemCount: 5,
            itemSize: 23.0,
            direction: Axis.horizontal,
          ),
          Padding(
            padding: EdgeInsets.only(top: 12.h, bottom: 30.h),
            child: Text(
              '$reviewsCount reviews',
              style:
                  AppTextStyles.PoppinsSubtitle(textColor: Color(0xFF272727)),
            ),
          ),
          _reviewStarBar(
              numReviews: 100, starNum: 5, colorFillrate: 100 / reviewsCount),
          _reviewStarBar(
              numReviews: 12, starNum: 4, colorFillrate: 12 / reviewsCount),
          _reviewStarBar(
              numReviews: 22, starNum: 3, colorFillrate: 22 / reviewsCount),
          _reviewStarBar(
              numReviews: 6, starNum: 2, colorFillrate: 6 / reviewsCount),
          _reviewStarBar(
              numReviews: 2, starNum: 1, colorFillrate: 2 / reviewsCount),
          _userReview(
              rateDate: '21 May 28 at 21:45',
              rateDescription:
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi id enim quis mi bibendum volutpat. Morbi mi eros, venenatis et malesuada efficitur, rutrum ut sem. Praesent vitae magna vitae lacus consectetur egestas eget sed lorem.',
              userName: 'Jhon Snow',
              userRating: 3.41),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 17.h),
            child: Divider(
              color: AppColors.tertiaryGreyColor,
              thickness: 1,
              height: 1.h,
            ),
          ),
          _userReview(
              rateDate: '31 July 19 at 22:08',
              rateDescription:
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi id enim quis mi bibendum volutpat. Morbi mi eros, venenatis et malesuada efficitur, rutrum ut sem. Praesent vitae magna vitae lacus consectetur egestas eget sed lorem.',
              userName: 'Williams Jack',
              userRating: 4.12),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 17.h),
            child: Divider(
              color: AppColors.tertiaryGreyColor,
              thickness: 1,
              height: 1.h,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16.h),
            child: TextButton(
                onPressed: () {},
                child: Text('View all reviews',
                    style: AppTextStyles.PoppinsBody2(
                        textColor: AppColors.secondaryColor))),
          )
        ],
      ),
    );
  }
}

Widget _userReview(
    {required String userName,
    required String rateDate,
    required String rateDescription,
    required double userRating}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      ListTile(
        contentPadding: EdgeInsets.zero,
        leading: CircleAvatar(
          radius: 20.5,
          backgroundColor: Colors.transparent,
          child: AppIcons.customIcon(iconName: 'user_place_holder'),
        ),
        title: Text(
          userName,
          style: AppTextStyles.PoppinsSubtitle(textColor: AppColors.darkColor),
        ),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              rateDate,
              style: AppTextStyles.PoppinsFootnote(
                  textColor: AppColors.primaryGreyColor),
            ),
            RatingBarIndicator(
              itemPadding: EdgeInsets.symmetric(horizontal: 3.w),
              unratedColor: Color(0xFFF1F1F1),
              rating: userRating,
              itemBuilder: (context, index) => const Icon(
                Icons.star,
                color: Color(0xFFFAC917),
              ),
              itemCount: 5,
              itemSize: 12.0,
              direction: Axis.horizontal,
            ),
          ],
        ),
      ),
      Padding(
        padding: EdgeInsets.only(top: 16.h),
        child: Text(rateDescription,
            overflow: TextOverflow.ellipsis,
            maxLines: 5,
            style: AppTextStyles.PoppinsBody2(
                textColor: AppColors.primaryGreyColor)),
      ),
    ],
  );
}

Widget _reviewStarBar(
    {required int starNum,
    required int numReviews,
    required double colorFillrate}) {
  double barWidth = 237;
  return Padding(
    padding: EdgeInsets.only(bottom: 18.w),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          "$starNum Stars",
          style: AppTextStyles.PoppinsCaption(textColor: AppColors.darkColor),
        ),
        SizedBox(
          width: 15.w,
        ),
        Stack(alignment: AlignmentDirectional.centerStart, children: [
          Container(
            height: 4.h,
            width: barWidth.w,
            decoration: BoxDecoration(
              color: AppColors.tertiaryGreyColor,
              // color: Color(0xFFFAC917),
              borderRadius: BorderRadius.circular(2.r),
            ),
          ),
          Container(
            height: 4.h,
            width: (colorFillrate * barWidth).w,
            decoration: BoxDecoration(
              color: const Color(0xFFFAC917),
              borderRadius: BorderRadius.circular(2.r),
            ),
          ),
        ]),
        Expanded(
            child: SizedBox(
          width: 5.w,
        )),
        Text(
          numReviews.toString(),
          style:
              AppTextStyles.PoppinsCaption(textColor: AppColors.secondaryColor),
        ),
      ],
    ),
  );
}
