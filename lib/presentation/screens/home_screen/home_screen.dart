import 'home_viewers/viewers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/constants.dart';
import '../widgets/widgets.dart';
import '../../../data/models/models.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  static CategoryHome categoryHomeItem = const CategoryHome(
    imageName: 'icon_cat_sofas',
    productName: 'My product',
  );
  static List<CategoryHome> categoryHome = [
    categoryHomeItem,
    categoryHomeItem,
    categoryHomeItem,
    categoryHomeItem,
    categoryHomeItem,
    categoryHomeItem,
    categoryHomeItem,
    const CategoryHome(
      imageName: 'icon_cat_menu',
      productName: 'More',
    )
  ];

  static String imageUrl =
      "https://images.unsplash.com/photo-1592078615290-033ee584e267?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=464&q=80";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Product> producItems = [];
  Product get getproduct {
    final Product product = Product();
    product.imageUrl = HomeScreen.imageUrl;

    return product;
  }

  List<Category> categoriesItems = [];
  Category get getCategories {
    final Category category = Category();
    category.imageUrl = HomeScreen.imageUrl;
    category.nameEn = "My category";

    return category;
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      producItems = [
        getproduct,
        getproduct,
        getproduct,
        getproduct,
        getproduct
      ];

      categoriesItems = [
        getCategories,
        getCategories,
        getCategories,
        getCategories,
        getCategories,
        getCategories
      ];
    });
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 14.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                children: [
                  AppIcons.customIcon(iconName: "ic_Burger"),
                  SizedBox(width: 15.w),
                  AppIcons.customIcon(iconName: "logo"),
                  SizedBox(width: 106.w),
                  AppIcons.customIcon(iconName: "ic_Heart"),
                  SizedBox(width: 26.w),
                  AppIcons.customIcon(iconName: "ic_Notification")
                ],
              ),
            ),
            SizedBox(height: 26.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: const SearchField(),
            ),
            SizedBox(height: 16.h),
            const HomeSlider(),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 1.w),
              child:
                  CategoriesHomeSection(categoryHome: HomeScreen.categoryHome),
            ),
            ViewAllHeader(
              text: 'Next Thing On Your Mind',
              onPressed: () {},
            ),
            Padding(
                padding: EdgeInsets.only(left: 15.w, right: 15.w),
                child: buildCategoryThingsMindGridView()),
            const SectionDivider(),
            ViewAllHeader(
              text: 'Bank Offers',
              onPressed: () {},
            ),
            Padding(
              padding: EdgeInsets.only(left: 16.w),
              child: SizedBox(height: 174.h, child: buildBankOffersGridView()),
            ),
            const SectionDivider(),
            ViewAllHeader(
              text: 'Work From Home',
              onPressed: () {},
            ),
            Padding(
              padding: EdgeInsets.only(left: 16.w),
              child:
                  SizedBox(height: 196.h, child: buildWorkFromHomeGridView()),
            ),
            const SectionDivider(),
            ViewAllHeader(
              text: 'Heavy Discount',
              onPressed: () {},
            ),
            Padding(
              padding: EdgeInsets.only(left: 16.w),
              child:
                  SizedBox(height: 230.h, child: buildHeavtDiscountGridView()),
            ),
            const SectionDivider(),
            ViewAllHeader(
              text: 'Make everyone go Wow',
              onPressed: () {},
            ),
            Padding(
              padding: EdgeInsets.only(left: 16.w),
              child: SizedBox(height: 178.h, child: buildeveryoneWowGridView()),
            ),
          ],
        ),
      ),
    ));
  }

  Widget buildBankOffersGridView() {
    return BankOffersViewer(products: producItems);
  }

  Widget buildeveryoneWowGridView() {
    return EveryoneWowViewer(products: producItems);
  }

  Widget buildWorkFromHomeGridView() {
    return WorkFromHomeViewer(products: producItems);
  }

  Widget buildHeavtDiscountGridView() {
    return HeavyDiscountViewer(products: producItems);
  }

  Widget buildCategoryThingsMindGridView() {
    return CategoryThingKeepMindViewer(categories: categoriesItems);
  }
}
