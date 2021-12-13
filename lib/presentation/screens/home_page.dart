import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:fixturez/core/constants/constants.dart';

import '../../business_logic/cubit.dart';
import '../../data/repository/repository.dart';
import '../../data/web_services/web_services.dart';
import 'screens.dart';
import 'widgets/widgets.dart';

class HomePage extends StatefulWidget {
  late CategoryRepository categoryRepository;
  late CategoriesCubit categoriesCubit;

  HomePage() {
    categoryRepository = CategoryRepository(CategoriesWebService());
    categoriesCubit = CategoriesCubit(categoryRepository);
  }

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ValueNotifier<int> screenIndex = ValueNotifier(0);

  final ValueNotifier<String> title = ValueNotifier('Home');

  final screenTitles = const ["Home", "Categories", "Card", "Profile"];

  void _onNavigationItemSelected(index) {
    title.value = screenTitles[index];
    screenIndex.value = index;
  }

  @override
  void initState() {
    super.initState();
  }

  final screens = [
    HomeScreen(),
    BlocProvider(
      create: (BuildContext contex) => HomePage().categoriesCubit,
      child: const CategoriesScreen(),
    ),
    const CardScreen(),
    const ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: ValueListenableBuilder(
          valueListenable: screenIndex,
          builder: (BuildContext context, int value, _) {
            return screens[value];
          }),
      extendBody: true,
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        ),
        child: BottomAppBar(
          elevation: 10,
          shape: CircularNotchedRectangle(),
          notchMargin: 10.0,
          child: _bottomNavigationBar(
            onItemSelected: _onNavigationItemSelected,
          ),
        ),
      ),
      floatingActionButton: GlowingActionButton(
        color: AppColors.secondaryColor,
        iconName: 'ic_Discount',
        onPressed: () {
          print('TODO: Glowing action button');
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _bottomNavigationBar extends StatefulWidget {
  final ValueChanged<int> onItemSelected;
  const _bottomNavigationBar({
    Key? key,
    required this.onItemSelected,
  }) : super(key: key);

  @override
  State<_bottomNavigationBar> createState() => _bottomNavigationBarState();
}

class _bottomNavigationBarState extends State<_bottomNavigationBar> {
  var selectedIndex = 0;
  void handleItemSelected(int index) {
    setState(() {
      selectedIndex = index;
    });
    widget.onItemSelected(index);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            _bottomNavigationItem(
              index: 0,
              isSelected: selectedIndex == 0,
              onTap: handleItemSelected,
              iconName: 'ic_Home',
            ),
            SizedBox(
              width: 42.w,
            ),
            _bottomNavigationItem(
              index: 1,
              isSelected: selectedIndex == 1,
              onTap: handleItemSelected,
              iconName: 'ic_Category',
            ),
          ],
        ),
        SizedBox(
          width: 132.w,
        ),
        Row(
          children: [
            _bottomNavigationItem(
              index: 2,
              isSelected: selectedIndex == 2,
              onTap: handleItemSelected,
              iconName: 'ic_cart',
            ),
            SizedBox(
              width: 42.w,
            ),
            _bottomNavigationItem(
              index: 3,
              isSelected: selectedIndex == 3,
              onTap: handleItemSelected,
              iconName: 'ic_Profile',
            ),
          ],
        )
      ],
    );
  }
}

class _bottomNavigationItem extends StatelessWidget {
  final int index;
  final bool isSelected;
  final String iconName;

  final ValueChanged<int> onTap;

  const _bottomNavigationItem(
      {Key? key,
      required this.index,
      required this.onTap,
      this.isSelected = false,
      required this.iconName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        onTap(index);
      },
      child: SizedBox(
        height: 84.h,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 0,
              child: Visibility(
                  visible: isSelected ? true : false,
                  child: AppIcons.customIcon(iconName: 'Ellipse 18')),
            ),
            isSelected
                ? AppIcons.customIcon(iconName: '${iconName}_fill')
                : AppIcons.customIcon(iconName: iconName)
          ],
        ),
      ),
    );
  }
}
