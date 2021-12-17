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

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Home home;

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
          padding: EdgeInsets.only(left: 16.w, bottom: 5.h),
          child: SizedBox(height: 230.h, child: buildHeavtDiscountGridView()),
        ),
      ],
    );
  }

  Widget buildeveryoneWowGridView() {
    return EveryoneWowViewer(products: home.latestProducts);
  }

  Widget buildHeavtDiscountGridView() {
    return HeavyDiscountViewer(categories: home.homeCategory);
  }

  Widget buildCategoryThingsMindGridView() {
    return CategoryThingKeepMindViewer(categories: home.homeCategory);
  }
}
