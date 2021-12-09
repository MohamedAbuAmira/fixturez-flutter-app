import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PictureProvider extends StatelessWidget {
  const PictureProvider({
    Key? key,
    required this.image,
    this.borderRadius = 12,
  }) : super(key: key);

  final String image;
  final int borderRadius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius.r),
      clipBehavior: Clip.antiAlias,
      child: image.isNotEmpty
          ? FadeInImage.assetNetwork(
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.fill,
              placeholder: 'assets/images/loading-dots.gif',
              image: image,
            )
          : Image.asset('assets/images/placeholder-avatar.gif',
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.cover),
    );
  }
}
