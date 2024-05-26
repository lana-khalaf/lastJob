import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_jobs_app/blocs/forget_bloc/forget_password_bloc.dart';
import 'package:flutter_jobs_app/config.dart';
import 'package:flutter_jobs_app/contents.dart';
import 'package:flutter_jobs_app/screens/blog_screen.dart';
import 'package:flutter_jobs_app/screens/change_password_screen.dart';
import 'package:flutter_jobs_app/screens/check_screen.dart';
import 'package:flutter_jobs_app/screens/create_job.dart';
import 'package:flutter_jobs_app/screens/forget_pass_page.dart';
import 'package:flutter_jobs_app/screens/home_screen.dart';
import 'package:flutter_jobs_app/screens/roadmap_screen.dart';
import 'package:flutter_jobs_app/screens/schedule_screen.dart';
import 'package:flutter_jobs_app/screens/search%20screen.dart';
import 'package:flutter_jobs_app/screens/step_road_map_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ForgetPasswordBloc(),
        ),
      ],
      child: MaterialApp(
        
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
        initialRoute: ForgetPassPage().id,
        routes: {
          HomeScreen.id: (context) => HomeScreen(),
          CheckScreen.id: (context) => CheckScreen(),
          ChangePasswordScreen.id: (context) => ChangePasswordScreen(),
          SearchScreen.id: (context) => SearchScreen(),
          CreatJobScreen.id: (context) => CreatJobScreen(),
          BlogScreen.id: (context) => BlogScreen(),
          ScheduleScreen.id: (context) => ScheduleScreen(),
          RoadMapScreen.id: (context) => RoadMapScreen(),
          StepRoadMapScreen.id: (context) => StepRoadMapScreen(),
          ForgetPassPage().id: (context) => ForgetPassPage(),
        },
        // home: const MainScreen(),
      ),
    );
  }
}
