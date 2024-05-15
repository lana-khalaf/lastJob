// import 'package:flutter/material.dart';
// import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';

// class CustomBottomNavigationBar extends StatefulWidget {
//   const CustomBottomNavigationBar({super.key});

//   @override
//   State<CustomBottomNavigationBar> createState() => _CustomBottomNavigationBarState();
// }

// class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
//  List<IconData> _iconOptions = [
//     Icons.home,
//     Icons.bar_chart,
//     Icons.shopping_bag,
//     Icons.settings,
//   ];

 
//   @override
//   Widget build(BuildContext context) {
//     return    Align(
//             alignment: Alignment.bottomCenter,
//             child: Container(
//               decoration: BoxDecoration(
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black.withOpacity(0.2),
//                     spreadRadius: 2,
//                     blurRadius: 5,
//                     offset: Offset(0, -3),
//                   ),
//                 ],
//               ),
//               child: ClipRRect(
//                 borderRadius: BorderRadius.only(
//                   bottomLeft: Radius.circular(20),
//                   bottomRight: Radius.circular(20),
//                 ),
//                 child: AnimatedBottomNavigationBar.builder(
//                   itemCount: _iconOptions.length,
//                   height: 60,
//                   tabBuilder: (int index, bool isActive) {
//                     final color = isActive ? Colors.white : Colors.amber;
//                     final iconSize = isActive ? 42.0 : 30.0;
//                     return Column(
//                       mainAxisSize: MainAxisSize.max,
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Icon(
//                           _iconOptions[index],
//                           size: iconSize,
//                           color: color,
//                         ),
//                       ],
//                     );
//                   },
//                   gapLocation: GapLocation.none,
//                   backgroundColor: Colors.redAccent,
//                   activeIndex: _currentIndex,
//                   splashColor: Colors.transparent,
//                   notchSmoothness: NotchSmoothness.defaultEdge,
//                   onTap: (index) {
//                     setState(() {
//                       _currentIndex = index;
//                       _pageController.animateToPage(
//                         index,
//                         duration: Duration(milliseconds: 300),
//                         curve: Curves.easeInOut,
//                       );
//                     });
//                   },
//                 ),
//               ),
//             ),
//           ),
       
//   }
// }
