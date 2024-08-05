import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_jobs_app/blocs/auth_bloc.dart';
import 'package:flutter_jobs_app/blocs/auth_event.dart';
import 'package:flutter_jobs_app/blocs/auth_state.dart';
import 'package:flutter_jobs_app/blocs/bloc/get_user_bloc.dart';
import 'package:flutter_jobs_app/blocs/bloc/log_out_bloc.dart';
import 'package:flutter_jobs_app/config.dart';
import 'package:flutter_jobs_app/service/logout.dart';
import 'package:flutter_jobs_app/views/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomDrawer extends StatefulWidget {
   CustomDrawer({Key? key}) : super(key: key);
  static String id = 'drawer';

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  String? userName = config.get<SharedPreferences>().getString("userName");

 String? profilePicturePath = config.get<SharedPreferences>().getString("profile_picture");

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider( providers: [  
       
      //  BlocProvider(
      //           create: (context) => AuthBloc(),
      //       ),
               BlocProvider(
                create: (context) => LogOutBloc(),
            ),
                BlocProvider(create: (context) => GetUserBloc()..add(GetUser())),
                
                ],
      
      
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(),
          drawer: BlocProvider.value(
      value: BlocProvider.of<AuthBloc>(context),
      child: BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        
          return Drawer(
            backgroundColor: Theme.of(context).colorScheme.primary,
            child: SizedBox(
              width: 400, // تحديد عرض القائمة الجانبية
              child: Container(
                      decoration: BoxDecoration(
          image: DecorationImage(
            image:Theme.of(context).brightness == Brightness.light
                  ? AssetImage('assets/images/Mask Group (3).png')
                  : AssetImage('assets/images/Home (3).jpg'),
            fit: BoxFit.cover,

          ),
        ),
      
                child: Column(
                  children: [
                    Container(
                      height: 250,
                      padding: const EdgeInsets.only(top: 25),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                                radius: 52,
                                child: Builder(
                                  builder: (context) {
                                    if (profilePicturePath != null &&
                                  profilePicturePath!.isNotEmpty) {
                                return Container(
  width: 150, // قطر الدائرة
  height: 150, // قطر الدائرة
  decoration: BoxDecoration(
    shape: BoxShape.circle,
    border: Border.all(
      color: Theme.of(context).colorScheme.onErrorContainer, // لون حد الدائرة
      width: 1, // سمك حدود الدائرة
    ),
    image: DecorationImage(
      image: FileImage(File(profilePicturePath!)),
      fit: BoxFit.fill,
    ),
  ),
);

                                //  ClipOval(
                                //   child: Image.file(
                                //     File(profilePicturePath!),
                                    
                                //     fit: BoxFit.cover,
                                //     width: 150, // قطر الدائرة
                                //     height: 150, // قطر الدائرة
                                //   ),
                                // );
                              } else {
                                return  Container(
  width: 150, // قطر الدائرة
  height: 150, // قطر الدائرة
  decoration: BoxDecoration(
    shape: BoxShape.circle,
    border: Border.all(
      color: Theme.of(context).colorScheme.onErrorContainer, // لون حد الدائرة
      width: 1, // سمك حدود الدائرة
    ),
    image: DecorationImage(
      image: AssetImage(
                                  "assets/images/Default_pfp.jpg"),
      fit: BoxFit.fill,
    ),
  ),
);
                              }
                                  }
                                )),
                             Padding(
                               padding: const EdgeInsets.only(top: 12, bottom: 4),
                               child: BlocBuilder<GetUserBloc, GetUserState>(
                                      builder: (context, state) {
                                        if (state is GetUserLoading) {
                                          return CircularProgressIndicator();
                                        } else if (state is GetUserSuccess) {
                                          String fullName = '${state.user.firstName} ${state.user.lastName}';
                                          return Text(
                                            fullName,
                                            style: TextStyle(
                                              color: Theme.of(context).colorScheme.primary,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600,
                                              fontFamily: "Poppins",
                                            ),
                                          );
                                        } else if (state is GetUserError) {
                                          return Text(
                                            "Error fetching user".tr(),
                                            style: TextStyle(
                                              color: Colors.red,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600,
                                              fontFamily: "Poppins",
                                            ),
                                          );
                                        } else {
                                          return Text(
                                            "No user data available",
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600,
                                              fontFamily: "Poppins",
                                            ),
                                          );
                                        }
                                      },
                                    ),
                             ),
                            // Padding(
                            //   padding: const EdgeInsets.only(top: 12, bottom: 4),
                            //   child: Text(
                            //     "Hussam Zina",
                            //     style: TextStyle(
                            //       color: Theme.of(context).colorScheme.onTertiary,
                            //       fontSize: 20,
                            //       fontWeight: FontWeight.w600,
                            //       fontFamily: "Poppins",
                            //     ),
                            //   ),
                            // ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 6),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                                              userName ?? "",
                                    style: TextStyle(
                                      color:
                                          Theme.of(context).colorScheme.onPrimary,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "Poppins",
                                    ),
                                  ),
                                  SizedBox(width: 5,),
                                  Image.asset("assets/images/Vector (10).png"),
                                ],
                              ),
                            ),
     ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15, right: 17),
                            child: Image.asset("assets/images/Group 187.png", color: Theme.of(context).colorScheme.primary,),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Personal Info".tr(),
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              fontFamily: "Poppins",
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15, right: 17),
                            child: Image.asset("assets/images/Vector (11).png", color: Theme.of(context).colorScheme.primary,),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Applies".tr(),
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              fontFamily: "Poppins",
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15, right: 17),
                            child: Image.asset("assets/images/Group (1).png", color: Theme.of(context).colorScheme.primary,),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Guidelines".tr(),
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              fontFamily: "Poppins",
                            ),
                          ),
                        ],
                      ),
                    ),
                          
                            
                    SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15, right: 17),
                            child: Image.asset("assets/images/Vector (13).png", color: Theme.of(context).colorScheme.primary,),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Settings".tr(),
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              fontFamily: "Poppins",
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    BlocListener<LogOutBloc, LogOutState>(
                      listener: (context, state) {
                        if (state is LogOutInitial) {
                          print("initiall");
                        } else if (state is Success) {
                          print("successl");
                            context.read<AuthBloc>().add(LogoutAuth());
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) {
                            return LoginPage();
                          }));
                        } else if (state is Loading) {
                          print("loading");
                        } else if (state is Error) {
                          print("Error");
                        } else {
                          print("else");
                        }
                      },
                      child: InkWell(
                        onTap: () {
                          context.read<LogOutBloc>().add(LogoutEvent());
                        },
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 15, right: 17),
                              child: Image.asset("assets/images/Group 191.png"),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Logout".tr(),
                              style: TextStyle(
                                color: Color(0xffE30000),
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                fontFamily: "Poppins",
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 56),
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          width: 193,
                          height: 56,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color:  Theme.of(context).colorScheme.primary,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset("assets/images/Vector (15).png",color: Theme.of(context).colorScheme.onSecondary,),
                              SizedBox(width: 5,),
                              Text(

                                "Go Premium".tr(),
                                style: TextStyle(
                                  color:  Theme.of(context).colorScheme.onSecondary,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Poppins",
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
      }
          ),
          )
        );
      }),
    );
  }
}

