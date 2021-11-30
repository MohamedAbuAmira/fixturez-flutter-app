// import 'package:fixturez/core/constants/colors.dart';
// import 'package:fixturez/presentation/screens/card_screen/card_screen.dart';
// import 'package:fixturez/presentation/screens/categories_screen/categories_screen.dart';
// import 'package:fixturez/presentation/screens/home_screen/home_screen.dart';
// import 'package:fixturez/presentation/screens/profile_screen/profile_screen.dart';
// import 'package:flutter/material.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({
//     Key? key,
//   }) : super(key: key);

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   void _selectScreen(int index) {
//     setState(() {
//       _selectedScreenIndex = index;
//     });
//   }

//   int _selectedScreenIndex = 0;

//   late List<Map<String, Widget>> _screens;

//   @override
//   void initState() {
//     _screens = [
//       {
//         'Screen': HomeScreen(),
//         // 'Title': 'Home',
//       },
//       {
//         'Screen': CategoriesScreen(),
//         // 'Title': 'Explore',
//       },
//       {
//         'Screen': CardScreen(),
//         // 'Title': 'Explore',
//       },
//       {
//         'Screen': ProfileScreen(),
//         // 'Title': 'Explore',
//       },
//     ];
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _screens[_selectedScreenIndex]['Screen'],
//       bottomNavigationBar: BottomNavigationBar(
//         onTap: _selectScreen,
//         backgroundColor: AppColors.whiteColor,
//         selectedItemColor: LightColors.darkColor,
//         unselectedItemColor: LightColors.greyTwoColor,
//         currentIndex: _selectedScreenIndex,
//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.category),
//             label: 'Categories',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.car_rental_rounded),
//             label: 'Card',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person),
//             label: 'Profile',
//           ),
//         ],
//       ),
//       floatingActionButton: IconButton(onPressed: () {}, icon: Icon(Icons.add)),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//     );
//   }
// }
