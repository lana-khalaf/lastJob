

import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_jobs_app/blocs/bloc/user_job_bloc.dart';
import 'package:flutter_jobs_app/config.dart';
import 'package:flutter_jobs_app/widgets/custom%20text.dart';
import 'package:flutter_jobs_app/widgets/custom_applicatons.dart';
import 'package:flutter_jobs_app/widgets/custom_buttom.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ApplicationsAuthPage extends StatefulWidget {
  ApplicationsAuthPage({super.key});

  static String id = 'ApplicationsPage';

  @override
  State<ApplicationsAuthPage> createState() => _ApplicationsAuthPageState();
}

class _ApplicationsAuthPageState extends State<ApplicationsAuthPage> {
  late Color buttonColor;
  late Color textColor;
  String button = "all";
String? profilePicturePath = config.get<SharedPreferences>().getString("profile_picture");
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserJobBloc()..add(GetUserJob()),
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: Theme.of(context).brightness == Brightness.light
                  ? AssetImage('assets/images/Mask Group (3).png')
                  : AssetImage('assets/images/Home (3).jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: BlocBuilder<UserJobBloc, UserJobState>(
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 24, right: 26),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 19),
                          child: InkWell(onTap: () {
                            Navigator.pop(context);
                          },
                            child:Theme.of(context).brightness == Brightness.light
                                               ? Image.asset('assets/images/back.png')
                                                : Image.asset('assets/images/Vector (25).png'), 
                            ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 19),
                          child: Text(
                            "appliess".tr(),
                            style: TextStyle(
                           fontWeight: FontWeight.w900,
                      fontSize: 21,
                              color: Theme.of(context).colorScheme.primary,
                              fontFamily: "Poppins",
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 19),
                          child: Stack(
                            children: [
                                                        CircleAvatar(
                                  radius: 35,
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
                                // Image.asset(profilePicturePath),
                              
                              Positioned(
                                right: 0,
                                top: 8,
                                child: Container(
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Theme.of(context).colorScheme.onBackground,
                                  ),
                                  child: Image.asset("assets/images/Ellipse 767.png"),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 24, right: 26, top: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CustomText(
                          family: "Poppins",
                          color: Theme.of(context).colorScheme.primary,
                          size: 24,
                          text: "You  have".tr(),
                          weight: FontWeight.w600,
                        ),
                        Row(
                          children: [
                            CustomText(
                              family: "Poppins",
                              color: Theme.of(context).colorScheme.primary,
                              size: 24,
                              text: " ${state is UserJobSuccess ? state.UserJobs.length : 0}  ",
                              weight: FontWeight.w600,
                            ),
                            CustomText(
                              family: "Poppins",
                              color: Theme.of(context).colorScheme.primary,
                              size: 24,
                              text: "appliess".tr(),
                              weight: FontWeight.w600,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40, bottom: 40, left: 24, right: 20),
                    child: SizedBox(
                      height: 37,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          CustomButton(
                            text: "All".tr(),
                            press: () {
                              context.read<UserJobBloc>().add(FilterJobs(JobStatus.all));
                              setState(() {
                                button = "all";
                              });
                            },
                            colorText: button == "all"
                                ? Theme.of(context).colorScheme.onPrimaryContainer
                                : Color(0xff95969D),
                            radius: 97,
                            color: button == "all"
                                ? Theme.of(context).colorScheme.primaryContainer
                                : Color(0xffFFFFFF),
                            width: 77,
                            height: 37,
                          ),
                          SizedBox(width: 11),
                          CustomButton(
                            text: "Cancelled".tr(),
                            press: () {
                              context.read<UserJobBloc>().add(FilterJobs(JobStatus.cancelled));
                              setState(() {
                                button = "cancelled";
                              });
                            },
                            colorText: button == "cancelled"
                                ? Theme.of(context).colorScheme.onPrimaryContainer
                                : Color(0xff95969D),
                            radius: 97,
                            color: button == "cancelled"
                                ? Theme.of(context).colorScheme.primaryContainer
                                : Color(0xffFFFFFF),
                            width: 135,
                            height: 37,
                            colorBorder: Color(0xff95969D),
                          ),
                          SizedBox(width: 11),
                          CustomButton(
                            text: "Accepted".tr(),
                            press: () {
                              context.read<UserJobBloc>().add(FilterJobs(JobStatus.accepted));
                              setState(() {
                                button = "Accepted";
                              });
                            },
                            colorText: button == "Accepted"
                                ? Theme.of(context).colorScheme.onPrimaryContainer
                                : Color(0xff95969D),
                            radius: 97,
                            color: button == "Accepted"
                                ? Theme.of(context).colorScheme.primaryContainer
                                : Color(0xffFFFFFF),
                            width: 140,
                            height: 37,
                            colorBorder: Color.fromARGB(255, 124, 128, 157),
                          ),
                          SizedBox(width: 11),
                          CustomButton(
                            text: "Waiting".tr(),
                            press: () {
                              context.read<UserJobBloc>().add(FilterJobs(JobStatus.waiting));
                              setState(() {
                                button = "Waiting";
                              });
                            },
                            colorText: button == "Waiting"
                                ? Theme.of(context).colorScheme.onPrimaryContainer
                                : Color(0xff95969D),
                            radius: 97,
                            color: button == "Waiting"
                                ? Theme.of(context).colorScheme.primaryContainer
                                : Color(0xffFFFFFF),
                            width: 140,
                            height: 37,
                            colorBorder: Color(0xff95969D),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 26, right: 26, top: 16),
                      child: state is UserJobLoading
                          ? Center(child: CircularProgressIndicator())
                          : state is UserJobError
                              ? Center(child: Text('Error loading jobs'))
                              : state is UserJobSuccess
                                  ? ListView.builder(
                                      itemCount: state.UserJobs.length,
                                      itemBuilder: (context, index) {
                                        if (button == "all" ||
                                            (button == "cancelled" && state.UserJobs[index].status == false) ||
                                            (button == "Accepted" && state.UserJobs[index].status == true) ||
                                            (button == "Waiting" && state.UserJobs[index].status == null)) {
                                              if (state.UserJobs[index].status == false) {
                                                buttonColor = Color(0xffFFEDED);
                                                textColor = const Color(0xffDC312D);
                                              } else if (state.UserJobs[index].status == null) {
                                                buttonColor = const Color(0xffEDF3FC);
                                                textColor = const Color(0xff5386E4);
                                              } else {
                                                buttonColor = Color(0xffE8FDF2);
                                                textColor = const Color(0xff0E9D57);
                                              }
                                              return CustomApplication(
                                                tist: state.UserJobs[index],
                                                buttontext: state.UserJobs[index].status == null
                                                  ? "Waiting".tr()
                                                  : state.UserJobs[index].status == true
                                                      ? "Accepted".tr()
                                                      : "Cancelled".tr(),
                                                textColor: textColor,
                                                buttonColor: buttonColor,
                                              );
                                        } else {
                                          return SizedBox.shrink(); // Return an empty widget if no condition is met
                                        }
                                      },
                                    )
                                  : Center(child: Text('No jobs available')),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
