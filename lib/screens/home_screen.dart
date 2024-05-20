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
    FontAwesomeIcons.calendar,
    FontAwesomeIcons.bagShopping,
    FontAwesomeIcons.bookmark,
    FontAwesomeIcons.user,
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
          Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.89),
            child: Container(
              decoration: BoxDecoration(
                // color: Color.fromARGB(255, 12, 4, 86),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 30,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: Image.asset(
                'images/Rectangle 15.png',
                fit: BoxFit.fill,
                height: MediaQuery.of(context).size.height * 0.11,
                width: MediaQuery.of(context).size.width,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: 2,
                right: 2,
                top: MediaQuery.of(context).size.height * 0.912),
            child: ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
              child: AnimatedBottomNavigationBar.builder(
                itemCount: _iconOptions.length,
                safeAreaValues:
                    SafeAreaValues(top: false, bottom: false, left: false),
                height: 70,
                tabBuilder: (int index, bool isActive) {
                  final color = isActive ? blue : grey;
                  final iconSize = isActive ? 26.0 : 24.0;
                  iconPadding = isActive ? 8 : 6;
                  return index != 2
                      ? Padding(
                          padding: EdgeInsets.only(
                            top: iconPadding,
                          ),
                          child: Column(
                            children: [
                              FaIcon(
                                _iconOptions[index],
                                size: iconSize,
                                color: color,
                              ),
                              Text(
                                _titles[index],
                                style: TextStyle(color: color, fontSize: 12),
                              ),
                            ],
                          ),
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CustomFloatingButton(
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
                            ),
                          ],
                        );
                },
                gapLocation: GapLocation.none,
                backgroundColor: Colors.white.withOpacity(1),
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
        ],
      ),
    );
  }
}
