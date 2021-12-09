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
    return Container(
      width: 270.w,
      height: 178.h,
      margin: EdgeInsetsDirectional.fromSTEB(4.w, 0, 4.w, 0),
      child: PictureProvider(image: product.imageUrl),
    );
  }
}
