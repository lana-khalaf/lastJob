import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_jobs_app/contents.dart';
import 'package:flutter_jobs_app/screens/blog_screen.dart';
import 'package:flutter_jobs_app/screens/change_password_screen.dart';
import 'package:flutter_jobs_app/screens/freelancer_screen.dart';
import 'package:flutter_jobs_app/screens/home_%20body_screen.dart';
import 'package:flutter_jobs_app/screens/schedule_screen.dart';
import 'package:flutter_jobs_app/widgets/custom_floating_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
    FontAwesomeIcons.house,
    FontAwesomeIcons.house,
    FontAwesomeIcons.house,
    FontAwesomeIcons.house,
    FontAwesomeIcons.house,
  ];
  List<String> _titles = ['Home', 'Calendar', '', 'Saved', 'My Account'];

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
                child: ChangePasswordScreen(),
              ),
              Container(
                child: ScheduleScreen(),
              ),
              Container(
                child: BlogScreen(),
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
          borderRadius: BorderRadius.circular(20),
          child: AnimatedBottomNavigationBar.builder(
            itemCount: _iconOptions.length,
            height: 100,
            tabBuilder: (int index, bool isActive) {
              final color = isActive ? blue : grey;
              final iconSize = isActive ? 42.0 : 30.0;
              iconPadding = isActive ? 12 : 20;
              return Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  index != 2
                      ? Padding(
                          padding: EdgeInsets.only(top: iconPadding),
                          child: Column(
                            children: [
                              FaIcon(
                                _iconOptions[index],
                                size: iconSize,
                                color: color,
                              ),
                              Text(
                                _titles[index],
                                style: TextStyle(color: color),
                              ),
                            ],
                          ),
                        )
                      : CustomFloatingButton(
                          icon: _iconOptions[index],
                          function: () {
                            setState(() {
                              _currentIndex = index;
                              _pageController.animateToPage(
                                index,
                                duration: Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              );
                            });
                          },
                        )
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
