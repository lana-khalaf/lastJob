import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_jobs_app/screens/change_password_screen.dart';
import 'package:flutter_jobs_app/screens/freelancer_screen.dart';
import 'package:flutter_jobs_app/screens/home_%20body_screen.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static String id = 'HomeScreen';
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  late double iconPadding;
  PageController _pageController = PageController(initialPage: 0);

  List<IconData> _iconOptions = [
    Icons.home,
    Icons.bar_chart,
    Icons.shopping_bag,
    Icons.settings,
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'images/Rectangle 4307.png',
            fit: BoxFit.fill,
            height: double.infinity,
            width: double.infinity,
          ),
          PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            children: <Widget>[
              Container(
                child: HomeBodyScreen(),
              ),
              Container(
                child: FreeLancerScreen(),
              ),
              Container(
                child: HomeBodyScreen(),
              ),
              Container(
                child: ChangePasswordScreen(),
              ),
            ],
          ),
          // Align(
          //   alignment: Alignment.bottomCenter,
          //   child:),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 12, 4, 86),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, -3),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
          child: AnimatedBottomNavigationBar.builder(
            itemCount: _iconOptions.length,
            height: 70,
            tabBuilder: (int index, bool isActive) {
              final color = isActive ? Colors.blue : Colors.white;
              final iconSize = isActive ? 42.0 : 30.0;
              iconPadding = isActive ? 12 : 20;
              return Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: iconPadding),
                    child: Icon(
                      _iconOptions[index],
                      size: iconSize,
                      color: color,
                    ),
                  ),
                ],
              );
            },
            gapLocation: GapLocation.none,
            backgroundColor: Color.fromRGBO(41, 52, 94, 1),
            activeIndex: _currentIndex,
            splashColor: Colors.transparent,
            notchSmoothness: NotchSmoothness.defaultEdge,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
                _pageController.animateToPage(
                  index,
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              });
            },
          ),
        ),
      ),
    );
  }
}
