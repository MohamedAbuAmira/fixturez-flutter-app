import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../business_logic/cubit.dart';
import '../../../presentation/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/constants/constants.dart';
import '../../../data/models/models.dart';
import '../widgets/widgets.dart';

class SubCategoriesScreen extends StatefulWidget {
  const SubCategoriesScreen({Key? key, required this.category})
      : super(key: key);
  final Category category;

  @override
  State<SubCategoriesScreen> createState() => _SubCategoriesScreenState();
}

class _SubCategoriesScreenState extends State<SubCategoriesScreen> {
  late List<SubCategory> allSubCategories;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<SubCategoriesCubit>(context).getAllSubCategories();
  }

  Widget _buildBlocWidget() {
    return BlocBuilder<SubCategoriesCubit, SubCategoriesState>(
      builder: (context, state) {
        if (state is SubCategoriesLoaded) {
          allSubCategories = (state).subCategories;
          return _buildLoadedGridViewWidget();
        } else {
          return _showloadingLoaded();
        }
      },
    );
  }

  Widget _showloadingLoaded() {
    return const Center(
      child: CircularProgressIndicator(color: AppColors.secondaryColor),
    );
  }

  @override
  Widget build(BuildContext context) {
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
            const SectionDivider(),
            SizedBox(
              height: 20.h,
            ),
            _buildBlocWidget(),
          ],
        ),
      ),
    );
  }

  Widget _buildLoadedGridViewWidget() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: SubCategoriesGridView(subCategories: allSubCategories),
    );
  }
}

class SubCategoriesGridView extends StatelessWidget {
  const SubCategoriesGridView({Key? key, required this.subCategories})
      : super(key: key);
  final List<SubCategory> subCategories;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //     crossAxisCount: 2,
      //     childAspectRatio: 1,
      //     crossAxisSpacing: 12.h,
      //     mainAxisSpacing: 8.w),
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: subCategories.length,
      scrollDirection: Axis.vertical,
      itemBuilder: (ctx, index) {
        return SubCategoryCard(subCategory: subCategories[index]);
      },
    );
  }
}

class SubCategoryCard extends StatelessWidget {
  const SubCategoryCard({
    Key? key,
    required this.subCategory,
  }) : super(key: key);
  final SubCategory subCategory;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, AppRouter.productsInSubCategory,
                arguments: subCategory);
          },
          child: Container(
            height: 190.h,
            width: 162.w,
            decoration: BoxDecoration(
                border:
                    Border.all(color: AppColors.tertiaryGreyColor, width: 1),
                borderRadius: BorderRadius.circular(20.r)),
            alignment: Alignment.center,
            child: PictureProvider(image: subCategory.imageUrl),
          ),
        ),
        SizedBox(
          height: 8.h,
        ),
        Text(
          subCategory.nameEn,
          maxLines: 1,
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          style: AppTextStyles.PoppinsH4(
              textColor: AppColors.darkColor, isSemiBold: true),
        ),
        SizedBox(
          height: 4.h,
        ),
        Text('${subCategory.productsCount}+ Products',
            style: AppTextStyles.PoppinsFootnote(
                textColor: AppColors.primaryGreyColor)),
      ],
    );
  }
}
