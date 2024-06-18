import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_jobs_app/Model/skill.dart';
import 'package:flutter_jobs_app/blocs/bloc/education_bloc.dart';
import 'package:flutter_jobs_app/blocs/bloc/experience_bloc.dart';
import 'package:flutter_jobs_app/blocs/bloc/experience_event.dart';
import 'package:flutter_jobs_app/blocs/bloc/experience_state.dart';
import 'package:flutter_jobs_app/blocs/skill/skill_bloc.dart';
import 'package:flutter_jobs_app/config.dart';
import 'package:flutter_jobs_app/service/education.dart';
import 'package:flutter_jobs_app/service/skill.dart';
import 'package:flutter_jobs_app/views/see_all.dart';
import 'package:flutter_jobs_app/widgets/custom%20text.dart';
import 'package:flutter_jobs_app/widgets/education_container.dart';
import 'package:flutter_jobs_app/widgets/job_container.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatelessWidget {
  Profile({super.key});
  static String id = 'Profile';
  String? userName = config.get<SharedPreferences>().getString("userName");

  List<Skill> test = [
    Skill(id: 12, userId: 231, title: "klj", startedAt: "kjk")
  ];
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SkillBloc()..add(GetSkills()),
        ),
       BlocProvider(create: (context) => ExperienceBloc()..add(GetExperiences())),
        BlocProvider(create: (context) => EducationBloc()..add(GetEducation())),
      ],
      child: Builder(builder: (context) {
        return Scaffold(
          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: Theme.of(context).brightness == Brightness.light
                    ? AssetImage('assets/images/light.bg.png')
                    : AssetImage('assets/images/dark_bg.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 26, right: 26),
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(top: 19),
                          child: Image.asset("assets/images/back.png")),
                      Padding(
                        padding: const EdgeInsets.only(left: 300, top: 19),
                        child: Text(
                          " Edit",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color:
                                Theme.of(context).colorScheme.primaryContainer,
                            fontFamily: "Cairo",
                          ),
                        ),
                      ),
                    ],
                  ),
                  CircleAvatar(
                      radius: 52,
                      child: Image.asset(
                          "assets/images/photo_٢٠٢٢-٠٥-٢٠_١١-٢٤-٠٩ 1.png")),
                  Padding(
                    padding: const EdgeInsets.only(top: 12, bottom: 4),
                    child: Center(
                      child: Text(
                        userName ?? "No username",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onTertiary,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          fontFamily: "Poppins",
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 6),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "UX Designer ",
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
                        CustomText(
                            family: "Poppins",
                            color: Theme.of(context).colorScheme.onTertiary,
                            size: 16,
                            text: "27",
                            weight: FontWeight.w700),
                        CustomText(
                            family: "Poppins",
                            color: Theme.of(context).colorScheme.onTertiary,
                            size: 16,
                            text: "19",
                            weight: FontWeight.w700),
                        CustomText(
                            family: "Poppins",
                            color: Theme.of(context).colorScheme.onTertiary,
                            size: 16,
                            text: "14",
                            weight: FontWeight.w700)
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
                            color: Theme.of(context).colorScheme.onTertiary,
                            size: 16,
                            text: "Applied",
                            weight: FontWeight.w700),
                        CustomText(
                            family: "Poppins",
                            color: Theme.of(context).colorScheme.onTertiary,
                            size: 16,
                            text: "Reviewed",
                            weight: FontWeight.w700),
                        CustomText(
                            family: "Poppins",
                            color: Theme.of(context).colorScheme.onTertiary,
                            size: 16,
                            text: "Interview",
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
                                  color:
                                      Theme.of(context).colorScheme.onTertiary,
                                  size: 16,
                                  text: "Skill",
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
                                    onTap: (){},
                                    child: Text(
                                      "Add",
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400,
                                        color: Theme.of(context)
                                            .colorScheme
                                          .primaryContainer,
                                      ),
                                    ),
                                  ),
                                );
                              } else {
                                return          InkWell(
                                  onTap: () {
                                       Navigator.pushReplacement(context,
                                      MaterialPageRoute(builder: (context) {
                                    return SeeAll(title: 'Skills', result: state.skills,);
                                  }
                                      )
                                  );
                                  
  
  },
                                  
                                  child: CustomText(
                                      family: "Poppins",
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primaryContainer,
                                      size: 13,
                                      text: "See all",
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
                                    "No skills available",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onTertiary,
                                    ),
                                  ),
                                );
                              } else {
                                return job_container(tist: state.skills, index: 0,);
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
                                  color:
                                      Theme.of(context).colorScheme.onTertiary,
                                  size: 16,
                                  text: "Experience",
                                  weight: FontWeight.w600),
BlocBuilder<ExperienceBloc, ExperienceState>(
                          builder: (context, state) {
                            
                            if (state is  ExperienceFailed) {
                                print("failed");
                              } else if (state is ExperienceError) {
                                print("failed");
                              } else if (state is ExperienceLoading) {
                                print("loading");
                           
                              } else if (state is ExperienceSuccess) {
                                print("success");
                                if (state.experiences.isEmpty)
                             {
                                return Center(
                                  child: InkWell(
                                    onTap: (){},
                                    child: Text(
                                      "Add",
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400,
                                        color: Theme.of(context)
                                            .colorScheme
                                           .primaryContainer,
                                      ),
                                    ),
                                  ),
                                );
                              } else {
                                return          InkWell(
                                  onTap: () {
                                       Navigator.pushReplacement(context,
                                      MaterialPageRoute(builder: (context) {
                                    return SeeAll(title: 'Experience', result: state.experiences,);
                                  }
                                      )
                                  );
                                  
  
  },
                                  
                                  child: CustomText(
                                      family: "Poppins",
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primaryContainer,
                                      size: 13,
                                      text: "See all",
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
                              if (state is  ExperienceFailed) {
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
                                      "No experiences available",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onTertiary,
                                      ),
                                    ),
                                  );
                                } else {
                                  return job_container(tist: state.experiences,index: 0,);
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
                                  color:
                                      Theme.of(context).colorScheme.onTertiary,
                                  size: 16,
                                  text: "Education",
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
                              if (state.educations.isEmpty) 
                             {
                                return Center(
                                  child: InkWell(
                                    onTap: (){},
                                    child: Text(
                                      "Add",
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400,
                                        color: Theme.of(context)
                                            .colorScheme
                                           .primaryContainer,
                                      ),
                                    ),
                                  ),
                                );
                              } else {
                                return          InkWell(
                                  onTap: () {
                                       Navigator.pushReplacement(context,
                                      MaterialPageRoute(builder: (context) {
                                    return SeeAll(title: 'Education', result: state.educations,);
                                  }
                                      )
                                  );
                                  
  
  },
                                  
                                  child: CustomText(
                                      family: "Poppins",
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primaryContainer,
                                      size: 13,
                                      text: "See all",
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
                                    "No educations available",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onTertiary,
                                    ),
                                  ),
                                );
                              } else {
                                return Education_container(educationTist: state.educations, index: 0,);
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
                                  color:
                                      Theme.of(context).colorScheme.onTertiary,
                                  size: 16,
                                  text: "Resume",
                                  weight: FontWeight.w600),
                              InkWell(
                                  onTap: () {},
                                  child: CustomText(
                                      family: "Poppins",
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primaryContainer,
                                      size: 13,
                                      text: "Make a resume",
                                      weight: FontWeight.w400))
                            ],
                          ),
                        ),
                        job_container(tist: test, index: 0,),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16, top: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(
                                  family: "Poppins",
                                  color:
                                      Theme.of(context).colorScheme.onTertiary,
                                  size: 16,
                                  text: "Portfolio",
                                  weight: FontWeight.w600),
                              InkWell(
                                  onTap: () {},
                                  child: CustomText(
                                      family: "Poppins",
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primaryContainer,
                                      size: 13,
                                      text: "See all",
                                      weight: FontWeight.w400))
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 300,
                          child: GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              mainAxisSpacing: 12,
                              crossAxisSpacing: 12,
                            ),
                            itemCount: 6,
                            itemBuilder: (BuildContext context, int index) {
                              return Image.asset(
                                  "assets/images/protofolio (1).png");
                            },
                          ),
                        )
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
