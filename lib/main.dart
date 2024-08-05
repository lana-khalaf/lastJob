import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_jobs_app/blocs/auth_bloc.dart';
import 'package:flutter_jobs_app/blocs/auth_event.dart';
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
import 'package:flutter_jobs_app/service/login.dart';
import 'package:flutter_jobs_app/service/register.dart';
import 'package:flutter_jobs_app/theme/dark_theme.dart';
import 'package:flutter_jobs_app/theme/light_theme.dart';
import 'package:flutter_jobs_app/views/Second_welcome_page.dart';
import 'package:flutter_jobs_app/views/applicationAuth_page.dart';
import 'package:flutter_jobs_app/views/community_auth.dart';
import 'package:flutter_jobs_app/views/application_page.dart';
import 'package:flutter_jobs_app/views/community_profile.dart';
import 'package:flutter_jobs_app/views/cv_page.dart';
import 'package:flutter_jobs_app/views/drawer.dart';
import 'package:flutter_jobs_app/views/first_welcome_page.dart';
import 'package:flutter_jobs_app/views/job_details.dart';
import 'package:flutter_jobs_app/views/login_page.dart';
import 'package:flutter_jobs_app/views/payment.dart';
import 'package:flutter_jobs_app/views/profile.dart';
import 'package:flutter_jobs_app/views/profile_auth.dart';
import 'package:flutter_jobs_app/views/proposals.dart';

import 'package:flutter_jobs_app/views/register_page.dart';
import 'package:flutter_jobs_app/views/see_all.dart';
import 'package:flutter_jobs_app/views/settings.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SimpleBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    print('Bloc Event: $event');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print('Bloc Transition: $transition');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print('Bloc Error: $error');
    super.onError(bloc, error, stackTrace);
  }
}

void main() async {
   Bloc.observer = SimpleBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  init();
  runApp(  EasyLocalization(
      
      path: 'assets/translations', // <-- change the path of the translation files 
      supportedLocales: [Locale('en'), Locale('ar')],
      fallbackLocale: const Locale('en'),
      child: MyApp()));
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
          BlocProvider(
          create: (context) => AuthBloc()..add(CheckAuthStatus()),
        ),
      ],
      child: MaterialApp(
         localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
        debugShowCheckedModeBanner: false,
          theme: lightTheme,
      darkTheme: darkTheme, 

        initialRoute:ApplicationPage.id,
        
        routes: {
           PaymentPage.id:(context) => PaymentPage(),
          SecondWelcomePage.id:(context) => SecondWelcomePage(),
             FirstWelcomePage.id:(context) => FirstWelcomePage(),
           ProposalPage.id:(context) => ProposalPage(),
            JobDetails.id:(context) => JobDetails(),
           SettingsPage.id:(context) => SettingsPage(),
            ApplicationPage.id:(context) => ApplicationPage(),
             ProfilePage.id:(context) => ProfilePage(),
          CvPage.id:(context) => CvPage(),
          CustomDrawer.id:(context) => CustomDrawer(),
          ApplicationsAuthPage.id:(context) => ApplicationsAuthPage(),
          SeeAll.id:(context) => SeeAll(title: 'lol', result: [],),
          LoginPage.id:(context) => LoginPage(),
          ProfileAuth.id:(context) => ProfileAuth(),
          CommunityAuthPage.id:(context) => CommunityAuthPage(),
          CompanyProfile.id:(context) => CompanyProfile(),
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
          RegisterPage.id: (context) => RegisterPage(),
        },
        // home: const MainScreen(),
      ),
    );
  }
}
