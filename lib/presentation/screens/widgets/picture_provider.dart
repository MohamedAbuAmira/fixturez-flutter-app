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
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: const Color(0xFFF1F1F1),
        borderRadius: BorderRadius.circular(borderRadius.r),
      ),
      child: image.isNotEmpty
          ? FadeInImage.assetNetwork(
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.fill,
              placeholder: 'assets/images/loading.gif',
              image: image,
            )
          : Image.asset('assets/images/background_placeholder.jpg',
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.cover),
    );
  }
}
