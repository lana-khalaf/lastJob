import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_jobs_app/Model/cv.model.dart';
import 'package:flutter_jobs_app/Model/skill.dart';
import 'package:flutter_jobs_app/Model/userBlog/user_blog.dart';
import 'package:flutter_jobs_app/blocs/bloc/cv_bloc.dart';
import 'package:flutter_jobs_app/blocs/bloc/cv_event.dart';
import 'package:flutter_jobs_app/blocs/bloc/cv_state.dart';
import 'package:flutter_jobs_app/blocs/bloc/education_bloc.dart';
import 'package:flutter_jobs_app/blocs/bloc/experience_bloc.dart';
import 'package:flutter_jobs_app/blocs/bloc/experience_event.dart';
import 'package:flutter_jobs_app/blocs/bloc/experience_state.dart';
import 'package:flutter_jobs_app/blocs/bloc/get_user_bloc.dart';
import 'package:flutter_jobs_app/blocs/bloc/image_pic_bloc.dart';
import 'package:flutter_jobs_app/blocs/skill/skill_bloc.dart';
import 'package:flutter_jobs_app/config.dart';
import 'package:flutter_jobs_app/service/Blog_count.dart';
import 'package:flutter_jobs_app/service/cv_get.dart';
import 'package:flutter_jobs_app/service/education.dart';
import 'package:flutter_jobs_app/service/image_delete.dart';
import 'package:flutter_jobs_app/service/ringer_count.dart';
import 'package:flutter_jobs_app/service/ringer_create.dart';
import 'package:flutter_jobs_app/service/ringer_delete.dart';
import 'package:flutter_jobs_app/service/skill.dart';
import 'package:flutter_jobs_app/views/cv_page.dart';
import 'package:flutter_jobs_app/views/cv_view.dart';
import 'package:flutter_jobs_app/views/see_all.dart';
import 'package:flutter_jobs_app/widgets/custom%20text.dart';
import 'package:flutter_jobs_app/widgets/education_container.dart';
import 'package:flutter_jobs_app/widgets/job_container.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileAuth extends StatefulWidget {
  ProfileAuth({super.key});
  static String id = 'Profile';

  @override
  State<ProfileAuth> createState() => _ProfileAuthState();
}

class _ProfileAuthState extends State<ProfileAuth> {
  String? userName = config.get<SharedPreferences>().getString("userName");

  String? userId = config.get<SharedPreferences>().getString("id");

  String? userTokenn = config.get<SharedPreferences>().getString("Token");

  String? profilePicturePath =
      config.get<SharedPreferences>().getString("profile_picture");
  num ringedId = 2;
  List<String> _cvFiles = [];

  List<Skill> test = [
    Skill(id: 12, userId: 231, title: "klj", startedAt: "kjk")
  ];
  bool isRinged = false;
  @override
  void initState() {
    super.initState();
    _checkIfFollowing();
    _loadCvFiles();
  }
Future<List<String>> getCvFiles() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getStringList('cv_files $userId') ?? [];
}

Future<void> _loadCvFiles() async {
  List<String> files = await getCvFiles();
  setState(() {
    _cvFiles = files;
  });
}
  Future<void> _checkIfFollowing() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      isRinged = prefs.getBool('isRinged_$userId') ?? false;
    });
  }

  Future<void> _saveFollowingStatus(num userId, bool status) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('isRinged_$userId', status);
  }

  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SkillBloc()..add(GetSkills()),
        ),
        BlocProvider(
            create: (context) => ExperienceBloc()..add(GetExperiences())),
        BlocProvider(create: (context) => GetUserBloc()..add(GetUser())),
        BlocProvider(create: (context) => CVBloc()..add(GetCVs())),
        BlocProvider(create: (context) => EducationBloc()..add(GetEducation())),
        BlocProvider(
          create: (context) => ImagePicBloc(),
        ),
      ],
      child: Builder(builder: (context) {
        return Scaffold(
          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: Theme.of(context).brightness == Brightness.light
                    ? AssetImage('assets/images/Mask Group (3).png')
                    : AssetImage('assets/images/Home (3).jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 26, right: 26),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(top: 19),
                          child:   Theme.of(context).brightness == Brightness.light
                   ? InkWell(onTap:(){        Navigator.pop(context);},
                    child :Image.asset('assets/images/back.png'))
                    : InkWell(onTap: (){  Navigator.pop(context);},
                      child: Image.asset('assets/images/Vector (25).png'))
                          ),
                      Padding(
                        padding: const EdgeInsets.only(left: 300, top: 19),
                        child: Text(
                          "Edit".tr(),
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: Theme.of(context).colorScheme.primary,
                            fontFamily: "Cairo",
                          ),
                        ),
                      ),
                    ],
                  ),
//                 
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: 70,
                        child: BlocBuilder<ImagePicBloc, ImagePicState>(
                          builder: (context, state) {
                            if (state is LoadingImagePic) {
                              return CircularProgressIndicator();
                            } else if (state is SuccessImagePic) {
                              print(userId);
                              if (state.imagePath.isNotEmpty) {
                                return Container(
  width: 200, // قطر الدائرة
  height: 200, // قطر الدائرة
  decoration: BoxDecoration(
    shape: BoxShape.circle,
    border: Border.all(
      color: Theme.of(context).colorScheme.onErrorContainer, // لون حد الدائرة
      width: 2, // سمك حدود الدائرة
    ),
    image: DecorationImage(
      image: FileImage(File(state.imagePath!)),
      fit: BoxFit.fill,
    ),
  ),
);

                                // ClipOval(
                                //   child: Image.file(
                                //     File(state.imagePath),
                                //     fit: BoxFit.cover,
                                //     width: 200, // قطر الدائرة
                                //     height: 200, // قطر الدائرة
                                //   ),
                                // );
                              } else {
                                return   Container(
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
                            } else if (state is SuccessImageDeleted) {
                              // Handle success image deletion
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
      image: AssetImage(
                                  "assets/images/Default_pfp.jpg"),
      fit: BoxFit.fill,
    ),
  ),
);
                              
                            } else if (state is FailedImagePic ||
                                state is ErrorImagePic) {
                              return   Container(
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
                            } else {
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
                          },
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Builder(
                          builder: (context) {
                            return Container(
                                padding: EdgeInsets.all(
                                    8), // المسافة بين الأيقونة والدائرة
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white, // لون خلفية الدائرة
                                  border: Border.all(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onErrorContainer, // لون حد الدائرة
                                    width: 1, // سمك حدود الدائرة
                                  ),
                                ),
                                child: InkWell(
                                  onTap: () {
                                    final imagePicBloc =
                                        context.read<ImagePicBloc>();

                                    showModalBottomSheet(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return Wrap(
                                          children: [
                                            ListTile(
                                              leading:
                                                  Icon(Icons.photo_library),
                                              title: Text('Change Picture'.tr()),
                                              onTap: () {
                                                imagePicBloc.add(GitImage());
                                                Navigator.of(context).pop();
                                              },
                                            ),
                                            ListTile(
                                              leading: Icon(Icons.delete),
                                              title: Text('Delete Picture'.tr()),
                                              onTap: () async {
                                                imagePicBloc.add(DeleteImage());
                                                Navigator.of(context).pop();
                                              },
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                  child: Icon(
                                    Icons.edit,
                                    color:
                                        Theme.of(context).colorScheme.onErrorContainer,
                                    size: 24,
                                  ),
                                ));
                          },
                        ),
                      ),
                    ],
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 12, bottom: 4),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 28,
                          ),
                          BlocBuilder<GetUserBloc, GetUserState>(
                            builder: (context, state) {
                              if (state is GetUserLoading) {
                                return CircularProgressIndicator();
                              } else if (state is GetUserSuccess) {
                                String fullName =
                                    '${state.user.firstName} ${state.user.lastName}';
                                return Text(
                                  fullName,
                                  style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.primary,
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
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: InkWell(
                              onTap: () async {
                                dynamic result;
                                if (isRinged) {
                                  result = await deleteUserRing(
                                      userTokenn!, ringedId, userId!);
                                } else {
                                  result = await createUserRing(
                                      userTokenn!, ringedId);
                                }
                                print("API result: $result");
                                if (result != null && result.isNotEmpty) {
                                  setState(() {
                                    isRinged = !isRinged;
                                    _saveFollowingStatus(ringedId, isRinged);
                                  });
                                }
                              },
                              child: Image.asset(
                                "assets/images/Notification.png",
                                width: 22,
                                height: 22,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 6),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          userName ?? "",
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onPrimary,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            fontFamily: "Poppins",
                          ),
                        ),
                        Image.asset("assets/images/Vector (10).png"),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        BlocBuilder<GetUserBloc, GetUserState>(
                          builder: (context, state) {
                            if (state is GetUserLoading) {
                              return CircularProgressIndicator();
                            } else if (state is GetUserSuccess) {
                              String wallet = '${state.user.wallet}';
                              return Text(
                                wallet,
                                style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "Poppins",
                                ),
                              );
                            } else if (state is GetUserError) {
                              return Text(
                                "Error ",
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "Poppins",
                                ),
                              );
                            } else {
                              return Text(
                                "No user",
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
                        FutureBuilder<List<UserBlogs>>(
                          future: getUserBlogs(userTokenn ?? ""),
                          builder: (context, snapshot) {
                            print('Retrieved token: $userTokenn');
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return CircularProgressIndicator();
                            } else if (snapshot.hasError) {
                              return CustomText(
                                family: "Poppins",
                                color: Theme.of(context).colorScheme.primary,
                                size: 16,
                                text: "Error",
                                weight: FontWeight.w700,
                              );
                            } else {
                              int blogsCount = snapshot.data!.length;
                              return CustomText(
                                family: "Poppins",
                                color: Theme.of(context).colorScheme.primary,
                                size: 20,
                                text: blogsCount.toString(),
                                weight: FontWeight.w600,
                              );
                            }
                          },
                        ),
                        BlocBuilder<GetUserBloc, GetUserState>(
                          builder: (context, state) {
                            if (state is GetUserLoading) {
                              return CircularProgressIndicator();
                            } else if (state is GetUserSuccess) {
                              String rings = '${state.user.rings}';
                              return Text(
                                rings,
                                style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "Poppins",
                                ),
                              );
                            } else if (state is GetUserError) {
                              return Text(
                                "Error ",
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "Poppins",
                                ),
                              );
                            } else {
                              return Text(
                                "No user",
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
                        BlocBuilder<GetUserBloc, GetUserState>(
                          builder: (context, state) {
                            if (state is GetUserLoading) {
                              return CircularProgressIndicator();
                            } else if (state is GetUserSuccess) {
                              double rating = state.user.rating.toDouble();
                              int stars = 0;

                              if (rating >= 0.0 && rating <= 1.0) {
                                stars = 1;
                              } else if (rating > 1.0 && rating <= 2.0) {
                                stars = 2;
                              } else if (rating > 2.0 && rating <= 3.0) {
                                stars = 3;
                              } else if (rating > 3.0 && rating <= 4.0) {
                                stars = 4;
                              } else if (rating > 4.0 && rating <= 5.0) {
                                stars = 5;
                              }

                              return RatingStars(
                                value: stars.toDouble(),
                                // onValueChanged: (v) {},
                                starBuilder: (index, color) => Icon(
                                  Icons.star,
                                  color: color,
                                ),
                                starCount: 5,
                                starSize: 20,
                                valueLabelColor: const Color(0xff9b9b9b),
                                valueLabelTextStyle: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 12.0),
                                valueLabelRadius: 10,
                                maxValue: 5,
                                starSpacing: 2,
                                maxValueVisibility: false,
                                valueLabelVisibility: false,
                                animationDuration: Duration(milliseconds: 1000),
                                valueLabelPadding: const EdgeInsets.symmetric(
                                    vertical: 1, horizontal: 8),
                                valueLabelMargin:
                                    const EdgeInsets.only(right: 8),
                                starOffColor: const Color(0xffe7e8ea),
                                starColor: Colors.yellow,
                              );
                            } else if (state is GetUserError) {
                              return CustomText(
                                family: "Poppins",
                                color: Theme.of(context).colorScheme.onTertiary,
                                size: 16,
                                text: "Error",
                                weight: FontWeight.w700,
                              );
                            } else {
                              return CustomText(
                                family: "Poppins",
                                color: Theme.of(context).colorScheme.onTertiary,
                                size: 16,
                                text: "Loading...",
                                weight: FontWeight.w700,
                              );
                            }
                          },
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 6, left: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CustomText(
                            family: "Poppins",
                            color: Theme.of(context).colorScheme.primary,
                            size: 16,
                            text: "Wallet".tr(),
                            weight: FontWeight.w700),
                        CustomText(
                            family: "Poppins",
                            color: Theme.of(context).colorScheme.primary,
                            size: 16,
                            text: "Blogs".tr(),
                            weight: FontWeight.w700),
                        CustomText(
                            family: "Poppins",
                            color: Theme.of(context).colorScheme.primary,
                            size: 16,
                            text: "Ringes".tr(),
                            weight: FontWeight.w700),
                        CustomText(
                            family: "Poppins",
                            color: Theme.of(context).colorScheme.primary,
                            size: 16,
                            text: "Evaluation".tr(),
                            weight: FontWeight.w700)
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16, top: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(
                                  family: "Poppins",
                                  color: Theme.of(context).colorScheme.primary,
                                  size: 16,
                                  text: "Skill".tr(),
                                  weight: FontWeight.w600),
                              BlocBuilder<SkillBloc, SkillState>(
                                builder: (context, state) {
                                  if (state is Failed) {
                                    print("failed");
                                  } else if (state is Error) {
                                    print("failed");
                                  } else if (state is Loading) {
                                    print("loading");
                                    // return CircularProgressIndicator();
                                  } else if (state is Success) {
                                    print("success");
                                    if (state.skills.isEmpty) {
                                      return Center(
                                        child: InkWell(
                                          onTap: () {},
                                          child: Text(
                                            "Add".tr(),
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w400,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onPrimaryFixed,
                                            ),
                                          ),
                                        ),
                                      );
                                    } else {
                                      return InkWell(
                                          onTap: () {
                                            Navigator.pushReplacement(context,
                                                MaterialPageRoute(
                                                    builder: (context) {
                                              return SeeAll(
                                                title: 'Skills'.tr(),
                                                result: state.skills,
                                              );
                                            }));
                                          },
                                          child: CustomText(
                                              family: "Poppins",
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onPrimaryFixed,
                                              size: 13,
                                              text: "See all".tr(),
                                              weight: FontWeight.w400));
                                    }
                                  }
                                  // else{

                                  // }
                                  return Text(" ");
                                },
                              ),
                            ],
                          ),
                        ),
                        BlocBuilder<SkillBloc, SkillState>(
                          builder: (context, state) {
                            if (state is Failed) {
                              print("failed");
                            } else if (state is Error) {
                              print("failed");
                            } else if (state is Loading) {
                              print("loading");
                              return CircularProgressIndicator();
                            } else if (state is Success) {
                              print("success");
                              if (state.skills.isEmpty) {
                                return Center(
                                  child: Text(
                                    "No Skills available".tr(),
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimaryFixedVariant,
                                    ),
                                  ),
                                );
                              } else {
                                return job_container(
                                  tist: state.skills,
                                  index: 0,
                                );
                              }
                            }
                            // else{

                            // }
                            return Text(" ");
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16, top: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(
                                  family: "Poppins",
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onPrimaryFixed,
                                  size: 16,
                                  text: "Experience".tr(),
                                  weight: FontWeight.w600),
                              BlocBuilder<ExperienceBloc, ExperienceState>(
                                builder: (context, state) {
                                  if (state is ExperienceFailed) {
                                    print("failed");
                                  } else if (state is ExperienceError) {
                                    print("failed");
                                  } else if (state is ExperienceLoading) {
                                    print("loading");
                                  } else if (state is ExperienceSuccess) {
                                    print("success");
                                    if (state.experiences.isEmpty) {
                                      return Center(
                                        child: InkWell(
                                          onTap: () {},
                                          child: Text(
                                            "Add".tr(),
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w400,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary,
                                            ),
                                          ),
                                        ),
                                      );
                                    } else {
                                      return InkWell(
                                          onTap: () {
                                            Navigator.pushReplacement(context,
                                                MaterialPageRoute(
                                                    builder: (context) {
                                              return SeeAll(
                                                title: 'Experience'.tr(),
                                                result: state.experiences,
                                              );
                                            }));
                                          },
                                          child: CustomText(
                                              family: "Poppins",
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary,
                                              size: 13,
                                              text: "See all".tr(),
                                              weight: FontWeight.w400));
                                    }
                                  }
                                  // else{

                                  // }
                                  return Text(" ");
                                },
                              ),
                            ],
                          ),
                        ),
                        BlocBuilder<ExperienceBloc, ExperienceState>(
                          builder: (context, state) {
                            if (state is ExperienceFailed) {
                              print("failed");
                            } else if (state is ExperienceError) {
                              print("failed");
                            } else if (state is ExperienceLoading) {
                              print("loading");
                              return CircularProgressIndicator();
                            } else if (state is ExperienceSuccess) {
                              print("success");
                              if (state.experiences.isEmpty) {
                                return Center(
                                  child: Text(
                                    "No Experience available".tr(),
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimaryFixedVariant,
                                    ),
                                  ),
                                );
                              } else {
                                return job_container(
                                  tist: state.experiences,
                                  index: 0,
                                );
                              }
                            }
                            return Text(" ");
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16, top: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(
                                  family: "Poppins",
                                  color: Theme.of(context).colorScheme.primary,
                                  size: 16,
                                  text: "Education".tr(),
                                  weight: FontWeight.w600),
                              BlocBuilder<EducationBloc, EducationState>(
                                builder: (context, state) {
                                  if (state is EducationFailed) {
                                    print("failed");
                                  } else if (state is EducationFailed) {
                                    print("failed");
                                  } else if (state is EducationLoading) {
                                    print("loading");
                                  } else if (state is EducationSuccess) {
                                    print("success");
                                    if (state.educations.isEmpty) {
                                      return Center(
                                        child: InkWell(
                                          onTap: () {},
                                          child: Text(
                                            "Add".tr(),
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w400,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary,
                                            ),
                                          ),
                                        ),
                                      );
                                    } else {
                                      return InkWell(
                                          onTap: () {
                                            Navigator.pushReplacement(context,
                                                MaterialPageRoute(
                                                    builder: (context) {
                                              return SeeAll(
                                                title: 'Education'.tr(),
                                                result: state.educations,
                                              );
                                            }));
                                          },
                                          child: CustomText(
                                              family: "Poppins",
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary,
                                              size: 13,
                                              text: "See all".tr(),
                                              weight: FontWeight.w400));
                                    }
                                  }
                                  // else{

                                  // }
                                  return Text(" ");
                                },
                              ),
                            ],
                          ),
                        ),
                        BlocBuilder<EducationBloc, EducationState>(
                          builder: (context, state) {
                            if (state is EducationFailed) {
                              print("failed");
                            } else if (state is EducationFailed) {
                              print("failed");
                            } else if (state is EducationLoading) {
                              print("loading");
                              return CircularProgressIndicator();
                            } else if (state is EducationSuccess) {
                              print("success");
                              if (state.educations.isEmpty) {
                                return Center(
                                  child: Text(
                                    "No Education available".tr(),
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimaryFixedVariant,
                                    ),
                                  ),
                                );
                              } else {
                                return Education_container(
                                  educationTist: state.educations,
                                  index: 0,
                                );
                              }
                            }
                            // else{

                            // }
                            return Text(" ");
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16, top: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(
                                  family: "Poppins",
                                  color: Theme.of(context).colorScheme.primary,
                                  size: 16,
                                  text: "Resume".tr(),
                                  weight: FontWeight.w600),
                              InkWell(
                                  onTap: () {
                                     Navigator.pushReplacement(context,
                                      MaterialPageRoute(builder: (context) {
                                    return CvPage();
                                  }));
                                  },
                                  child: CustomText(
                                      family: "Poppins",
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      size: 13,
                                      text: "Make a resume".tr(),
                                      weight: FontWeight.w400))
                            ],
                          ),

                            
                        ),
   
                        
                        SizedBox(
                          height: 300,
                          child: 
  _cvFiles.isEmpty
                  ? Center(child: CircularProgressIndicator())
                  : GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 90,
                        crossAxisSpacing: 90,
                      ),
                      itemCount: _cvFiles.length,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PdfViewPage(path: _cvFiles[index]),
                              ),
                            );
                          },
                          child: Container(
                            width: 40,
                            height: 40,
                          
                            decoration: BoxDecoration(
                                 color: Theme.of(context).colorScheme.onPrimaryContainer,
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(
                              child:Image.asset("assets/images/Screenshot (41).png",width: 50,height: 50,)
                            ),
                          ),
                        );
                      },
                    ),
            ),
    
                    ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
