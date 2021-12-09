import 'package:fixturez/core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'screens.dart';
import 'widgets/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final ValueNotifier<int> screenIndex = ValueNotifier(0);
  final ValueNotifier<String> title = ValueNotifier('Home');

  final screens = [
    HomeScreen(),
    const CategoriesScreen(),
    const CardScreen(),
    const ProfileScreen()
  ];

  final screenTitles = const ["Home", "Categories", "Card", "Profile"];

  void _onNavigationItemSelected(index) {
    title.value = screenTitles[index];
    screenIndex.value = index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      // appBar: AppBar(
      //   iconTheme: Theme.of(context).iconTheme,
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      //   centerTitle: true,
      //   leadingWidth: 54,
      //   title: ValueListenableBuilder(
      //       valueListenable: title,
      //       builder: (BuildContext context, String value, _) {
      //         return Text(
      //           value,
      //           style: const TextStyle(
      //             fontSize: 16,
      //             fontWeight: FontWeight.bold,
      //           ),
      //         );
      //       }),
      // actions: const [
      //   Padding(
      //     padding: EdgeInsets.only(right: 24.0),
      //     child: Icon(Icons.person),
      //   )
      // ],
      // leading: Align(
      //   alignment: Alignment.centerRight,
      //   child: IconBackground(
      //       icon: Icons.search,
      //       onTap: () {
      //         print("TODO, Search icon");
      //       }),
      // ),
      // ),
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
