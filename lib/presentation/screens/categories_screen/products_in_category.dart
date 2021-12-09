import 'package:flutter/material.dart';

import '../../../data/models/models.dart';

class ProductsInCategory extends StatefulWidget {
  const ProductsInCategory({Key? key, required this.category})
      : super(key: key);
  final Category category;

  @override
  _ProductsInCategoryState createState() => _ProductsInCategoryState();
}

class _ProductsInCategoryState extends State<ProductsInCategory> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(widget.category.nameEn),
    );
  }
}
