import 'package:fixturez/presentation/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/constants/constants.dart';
import '../../../data/models/models.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);
  static String imageUrl =
      "https://images.unsplash.com/photo-1592078615290-033ee584e267?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=464&q=80";

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  List<Category> categoriesItems = [];
  Category get getCategories {
    final Category category = Category();
    category.imageUrl = CategoriesScreen.imageUrl;
    category.nameEn = "My category";

    return category;
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      categoriesItems = [
        getCategories,
        getCategories,
        getCategories,
        getCategories,
        getCategories,
        getCategories,
        getCategories,
        getCategories,
        getCategories,
        getCategories,
        getCategories,
        getCategories,
        getCategories,
        getCategories,
      ];
    });
    return Scaffold(
        appBar: AppBar(
          actions: [
            AppIcons.customIcon(iconName: "ic_Search"),
            AppIcons.customIcon(iconName: "ic_Notification")
          ],
          title: Text("ِAll Categories",
              style: AppTextStyles.PoppinsH3(textColor: AppColors.darkColor)),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: CategoriesGridView(
              categories: categoriesItems,
            ),
          ),
        ));
  }
}

class CategoriesGridView extends StatelessWidget {
  const CategoriesGridView({Key? key, required this.categories})
      : super(key: key);
  final List<Category> categories;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1,
          crossAxisSpacing: 12.h,
          mainAxisSpacing: 20.w),
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: categories.length,
      scrollDirection: Axis.vertical,
      itemBuilder: (ctx, index) {
        return CategoryCard(category: categories[index]);
      },
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.category,
  }) : super(key: key);
  final Category category;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20.r),
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(context, AppRouter.productsInCategoryPage,
                  arguments: category);
            },
            child: Container(
              height: 104.h,
              width: 104.w,
              decoration: BoxDecoration(
                  border:
                      Border.all(color: AppColors.tertiaryGreyColor, width: 1),
                  borderRadius: BorderRadius.circular(20.r)),
              alignment: Alignment.center,
              child: category.imageUrl.isNotEmpty
                  ? FadeInImage.assetNetwork(
                      width: 61.w,
                      height: 61.h,
                      fit: BoxFit.fill,
                      placeholder: 'assets/images/loading-dots.gif',
                      image: category.imageUrl,
                    )
                  : Image.asset('assets/images/placeholder-avatar.gif',
                      width: 61.w, height: 61.h, fit: BoxFit.cover),
            ),
          ),
        ),
        SizedBox(
          height: 8.h,
        ),
        Text(
          category.nameEn,
          style: AppTextStyles.PoppinsCaption(textColor: AppColors.darkColor),
        )
      ],
    );
  }
}
