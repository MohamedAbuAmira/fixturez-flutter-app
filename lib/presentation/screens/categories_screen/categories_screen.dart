import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../business_logic/cubit.dart';
import '../../../presentation/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/constants/constants.dart';
import '../../../data/models/models.dart';
import '../widgets/widgets.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  late List<Category> allCategories;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<CategoriesCubit>(context).getAllCategories();
  }

  Widget buildBlocWidget() {
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (context, state) {
        if (state is CategoriesLoaded) {
          allCategories = (state).categories;
          return buildLoadedGridViewWidget();
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
    return Scaffold(
      appBar: AppBar(
        actions: [
          AppIcons.customIcon(iconName: "ic_Search"),
          SizedBox(width: 26.w),
          IconButton(
            icon: AppIcons.customIcon(
              iconName: "ic_Notification",
            ),
            onPressed: () {
              Navigator.pushNamed(context, AppRouter.notifications);
            },
          ),
          SizedBox(
            width: 20.w,
          ),
        ],
        title: Text("ِAll Categories",
            style: AppTextStyles.PoppinsH3(textColor: AppColors.darkColor)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SectionDivider(),
            SizedBox(
              height: 20.h,
            ),
            Center(child: buildBlocWidget()),
            SizedBox(
              height: 85.h,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildLoadedGridViewWidget() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: CategoriesGridView(
        categories: allCategories,
      ),
    );
  }
}

class CategoriesGridView extends StatelessWidget {
  const CategoriesGridView({Key? key, required this.categories})
      : super(key: key);
  final List<Category> categories;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //
      //     crossAxisCount: 2,
      //     childAspectRatio: 1,
      //     crossAxisSpacing: 0,
      //     mainAxisSpacing: 0),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
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
    return Padding(
      padding:  EdgeInsets.only(bottom: 5.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, AppRouter.subCategories,
                  arguments: category);
            },
            child: Container(
              height: 190.h,
              width: 162.w,
              decoration: BoxDecoration(
                  border:
                      Border.all(color: AppColors.tertiaryGreyColor, width: 1),
                  borderRadius: BorderRadius.circular(20.r)),
              alignment: Alignment.center,
              child: PictureProvider(image: category.imageUrl),
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          Text(
            category.nameEn,
            maxLines: 1,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.PoppinsH4(
                textColor: AppColors.darkColor, isSemiBold: true),
          ),
          SizedBox(
            height: 4.h,
          ),
          RichText(
            text: TextSpan(
              style: AppTextStyles.PoppinsFootnote(
                  textColor: AppColors.secondaryColor),
              children: <TextSpan>[
                TextSpan(
                  text: '${category.productsCount}+ Products',
                  style: AppTextStyles.PoppinsFootnote(
                      textColor: AppColors.primaryColor),
                ),
                TextSpan(
                  text: " - ${category.subCategoriesCount} Includes Categories",
                  style: AppTextStyles.PoppinsCaption(
                      textColor: AppColors.primaryGreyColor),
                )
              ],
            ),
          ),
          // Text('${category.productsCount}+ Products',
          //     style: AppTextStyles.PoppinsFootnote(
          //         textColor: AppColors.primaryGreyColor)),
        ],
      ),
    );
  }
}
