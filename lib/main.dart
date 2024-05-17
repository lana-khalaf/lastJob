import 'package:flutter/material.dart';
import 'package:flutter_jobs_app/contents.dart';
import 'package:flutter_jobs_app/screens/blog_screen.dart';
import 'package:flutter_jobs_app/screens/change_password_screen.dart';
import 'package:flutter_jobs_app/screens/check_screen.dart';
import 'package:flutter_jobs_app/screens/create_job.dart';
import 'package:flutter_jobs_app/screens/home_screen.dart';
import 'package:flutter_jobs_app/screens/schedule_screen.dart';
import 'package:flutter_jobs_app/screens/search%20screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      theme: ThemeData(
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: kMainColor,
          // selectionColor: kMainColor,
          selectionHandleColor: kMainColor,
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: kMainColor),
        useMaterial3: true,
      ),
      initialRoute: HomeScreen.id,
      routes: {
        HomeScreen.id: (context) => HomeScreen(),
        CheckScreen.id: (context) => CheckScreen(),
        ChangePasswordScreen.id: (context) => ChangePasswordScreen(),
        SearchScreen.id: (context) => SearchScreen(),
        CreatJobScreen.id: (context) => CreatJobScreen(),
        BlogScreen.id: (context) => BlogScreen(),
        ScheduleScreen.id:(context)=> ScheduleScreen(),
      },
      // home: const MainScreen(),
    );
  }
}
