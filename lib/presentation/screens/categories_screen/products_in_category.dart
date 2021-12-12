import '../../../presentation/screens/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/constants/constants.dart';
import '../../../data/models/models.dart';
import '../../router/app_router.dart';

class ProductsInCategory extends StatefulWidget {
  const ProductsInCategory({Key? key, required this.category})
      : super(key: key);
  final Category category;
  static String imageUrl =
      "https://images.unsplash.com/photo-1592078615290-033ee584e267?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=464&q=80";

  @override
  _ProductsInCategoryState createState() => _ProductsInCategoryState();
}

class _ProductsInCategoryState extends State<ProductsInCategory> {
  List<Product> producItems = [];
  Product get getproduct {
    final Product product = Product();
    product.imageUrl = ProductsInCategory.imageUrl;
    product.nameEn = "Modern Swivel Accent Chair";
    product.price = 47;
    product.offerPrice = 33;
    product.infoEn =
        'Embodying the raw, wayward spirit of rock  roll, the Kilburn portable active stereo speaker takes the unmistakable look and sound of Marshall, unplugs the chords, and takes the show on the road. Weighing in under 7 pounds, the Kilburn is a lightweight piece of vintage styled engineering. Setting the bar as one of the loudest speakers in its class, the Kilburn is a compact, stout-hearted hero with a well-balanced audio which boasts a clear midrange and extended highs for a sound that is both articulate and pronounced. The analogue knobs allow you to fine tune the controls to your personal preferences while the guitar-influenced leather strap enables easy and stylish travel';

    return product;
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      producItems = [
        getproduct,
        getproduct,
        getproduct,
        getproduct,
        getproduct,
        getproduct,
        getproduct,
        getproduct,
        getproduct,
        getproduct,
        getproduct,
        getproduct,
        getproduct,
        getproduct,
      ];
    });
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: AppIcons.customIcon(iconName: "ic_back"),
          ),
          actions: [
            AppIcons.customIcon(iconName: "ic_Search"),
            SizedBox(width: 26.w),
            AppIcons.customIcon(iconName: "ic_Notification"),
            SizedBox(
              width: 20.w,
            ),
          ],
          title: Text(widget.category.nameEn,
              style: AppTextStyles.PoppinsH3(textColor: AppColors.darkColor)),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SectionDivider(),
              SizedBox(
                height: 52.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: ProductsGridView(
                  products: producItems,
                ),
              ),
            ],
          ),
        ));
  }
}

class ProductsGridView extends StatelessWidget {
  const ProductsGridView({Key? key, required this.products}) : super(key: key);
  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1,
          crossAxisSpacing: 11.h,
          mainAxisSpacing: 16.w),
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: products.length,
      scrollDirection: Axis.vertical,
      itemBuilder: (ctx, index) {
        return ProductCard(product: products[index]);
      },
    );
  }
}
