import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../business_logic/cubit.dart';
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
  late Home home;
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
  void initState() {
    super.initState();
    BlocProvider.of<HomeCubit>(context).getHome();
  }

  dynamic _buildBlocWidget() {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeLoaded) {
          home = (state).home;
          return _buildLoadedHomePage();
        } else {
          return showloadingLoaded();
        }
      },
    );
  }

  Widget showloadingLoaded() {
    return const Center(
      child: CircularProgressIndicator(color: AppColors.secondaryColor),
    );
  }

  @override
  Widget build(BuildContext context) {
    // buildBlocWidget();
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
        appBar: AppBar(
          title: AppIcons.customIcon(iconName: "logo"),
          leading: Padding(
            padding: EdgeInsets.only(left: 20.w),
            child: AppIcons.customIcon(
                iconName: "ic_Burger", width: 24.w, height: 24.h),
          ),
          actions: [
            AppIcons.customIcon(iconName: "ic_Heart"),
            SizedBox(width: 26.w),
            AppIcons.customIcon(iconName: "ic_Notification"),
            SizedBox(
              width: 20.w,
            ),
          ],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: SearchField(
                    onChange: (press) {},
                    searchTextController: TextEditingController(),
                  ),
                ),
                SizedBox(height: 16.h),
                _buildBlocWidget()
              ],
            ),
          ),
        ));
  }

  Widget _buildLoadedHomePage() {
    return Column(
      children: [
        ProductImagesSlder(
          images: home.slider,
        ),
        SizedBox(height: 20.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 1.w),
          child: CategoriesHomeSection(categoryHome: HomeScreen.categoryHome),
        ),
        ViewAllHeader(
          text: 'Next Thing On Your Mind',
          onPressed: () {},
        ),
        Padding(
            padding: EdgeInsets.only(left: 15.w, right: 15.w),
            child: buildCategoryThingsMindGridView()),
        const SectionDivider(
          addMargin: true,
        ),
        ViewAllHeader(
          text: 'Make everyone go Wow',
          onPressed: () {},
        ),
        Padding(
          padding: EdgeInsets.only(left: 16.w),
          child: SizedBox(height: 270.h, child: buildeveryoneWowGridView()),
        ),
        const SectionDivider(
          addMargin: true,
        ),
        ViewAllHeader(
          text: 'Browser By Category',
          onPressed: () {},
        ),
        Padding(
          padding: EdgeInsets.only(left: 16.w),
          child: SizedBox(height: 230.h, child: buildHeavtDiscountGridView()),
        ),
        const SectionDivider(
          addMargin: true,
        ),
        ViewAllHeader(
          text: 'Bank Offers',
          onPressed: () {},
        ),
        Padding(
          padding: EdgeInsets.only(left: 16.w),
          child: SizedBox(height: 174.h, child: buildBankOffersGridView()),
        ),
        const SectionDivider(
          addMargin: true,
        ),
        ViewAllHeader(
          text: 'Work From Home',
          onPressed: () {},
        ),
        Padding(
          padding: EdgeInsets.only(left: 16.w),
          child: SizedBox(height: 196.h, child: buildWorkFromHomeGridView()),
        ),
        const SectionDivider(
          addMargin: true,
        ),
      ],
    );
  }

  Widget buildBankOffersGridView() {
    return BankOffersViewer(products: producItems);
  }

  Widget buildeveryoneWowGridView() {
    return EveryoneWowViewer(products: home.latestProducts);
  }

  Widget buildWorkFromHomeGridView() {
    return WorkFromHomeViewer(products: producItems);
  }

  Widget buildHeavtDiscountGridView() {
    return HeavyDiscountViewer(categories: home.homeCategory);
  }

  Widget buildCategoryThingsMindGridView() {
    return CategoryThingKeepMindViewer(categories: home.homeCategory);
  }
}
