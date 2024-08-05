
// // // import 'package:flutter/material.dart';
// // // import 'package:flutter_jobs_app/service/com_unfollow.dart';
// // // import 'package:shared_preferences/shared_preferences.dart';
// // // import 'package:flutter_jobs_app/service/com_follow.dart';
// // // import 'package:flutter_jobs_app/widgets/custom%20text.dart';

// // // class Customcommunity extends StatefulWidget {
// // //   Customcommunity({
// // //     super.key,
// // //     required this.imageCommunity,
// // //     required this.nameCommunity,
// // //     required this.idCommunity,
// // //     required this.token,
// // //   });

// // //   final String imageCommunity;
// // //   final String nameCommunity;
// // //   final String token;
// // //   final num idCommunity;

// // //   @override
// // //   State<Customcommunity> createState() => _CustomcommunityState();
// // // }

// // // class _CustomcommunityState extends State<Customcommunity> {
// // //   bool isFollowing = false;

// // //   @override
// // //   void initState() {
// // //     super.initState();
// // //     _loadFollowingStatus();
// // //   }

// // //   // Load the following status from SharedPreferences
// // //   Future<void> _loadFollowingStatus() async {
// // //     final prefs = await SharedPreferences.getInstance();
// // //     setState(() {
// // //       isFollowing = prefs.getBool('isFollowing_${widget.idCommunity}') ?? false;
// // //     });
// // //   }

// // //   // Save the following status to SharedPreferences
// // //   Future<void> _saveFollowingStatus(bool status) async {
// // //     final prefs = await SharedPreferences.getInstance();
// // //     prefs.setBool('isFollowing_${widget.idCommunity}', status);
// // //   }

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Padding(
// // //       padding: EdgeInsets.only(bottom: 17),
// // //       child: InkWell(
// // //         onTap: () {},
// // //         child: Container(
// // //           width: 327,
// // //           height: 76,
// // //           decoration: BoxDecoration(
// // //             borderRadius: BorderRadius.circular(13),
// // //             color: Theme.of(context).colorScheme.onPrimaryContainer,
// // //           ),
// // //           child: Row(
// // //             crossAxisAlignment: CrossAxisAlignment.center,
// // //             children: [
// // //               SizedBox(width: 20),
// // //               Image.asset(
// // //                 widget.imageCommunity,
// // //                 width: 52,
// // //                 height: 52,
// // //               ),
// // //               SizedBox(width: 20),
// // //               Text(
// // //                 widget.nameCommunity,
// // //                 style: TextStyle(
// // //                   fontWeight: FontWeight.w600,
// // //                   fontSize: 14,
// // //                   color: Theme.of(context).colorScheme.onTertiary,
// // //                   fontFamily: "Poppins",
// // //                 ),
// // //               ),
// // //               SizedBox(width: 75),
// // //               InkWell(
// // //                 child: Material(
// // //                   elevation: 4.0,
// // //                   borderRadius: BorderRadius.circular(7),
// // //                   shadowColor: Colors.black.withOpacity(0.25),
// // //                   child: InkWell(
// // //                     onTap: () async {
// // //                       dynamic result;
                      
// // //                       if (isFollowing) {
// // //                         result = await UnFollowComm(widget.token, widget.idCommunity);
// // //                       } else {
// // //                         result = await FollowComm(widget.token, widget.idCommunity);
// // //                       }
// // //                       print("FollowComm result: $result");
// // //                       if (result.isNotEmpty) {
// // //                         setState(() {
// // //                           isFollowing = !isFollowing;
// // //                         });
// // //                         _saveFollowingStatus(isFollowing);
// // //                       }
// // //                     },
// // //                     child: Container(
// // //                       height: 37,
// // //                       width: 79,
// // //                       decoration: BoxDecoration(
// // //                         borderRadius: BorderRadius.circular(7),
// // //                         color: Color(0x154AD2E4),
// // //                       ),
// // //                       child: Center(
// // //                         child: CustomText(
// // //                           family: "Tajawal",
// // //                           color: Color(0xff5669FF),
// // //                           size: 12,
// // //                           text: isFollowing ? "Following" : "Follow",
// // //                           weight: FontWeight.w400,
// // //                         ),
// // //                       ),
// // //                     ),
// // //                   ),
// // //                 ),
// // //               ),
// // //             ],
// // //           ),
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }


// // import 'package:flutter/material.dart';
// // import 'package:flutter_bloc/flutter_bloc.dart';
// // import 'package:shared_preferences/shared_preferences.dart';
// // import 'package:flutter_jobs_app/service/com_unfollow.dart';
// // import 'package:flutter_jobs_app/service/com_follow.dart';
// // import 'package:flutter_jobs_app/widgets/custom%20text.dart';
// // import 'package:flutter_jobs_app/blocs/auth_bloc.dart';
// // import 'package:flutter_jobs_app/blocs/auth_event.dart';
// // import 'package:flutter_jobs_app/blocs/auth_state.dart';

// // class Customcommunity extends StatefulWidget {
// //   Customcommunity({
// //     super.key,
// //     required this.imageCommunity,
// //     required this.nameCommunity,
// //     required this.idCommunity,
// //     required this.token,
// //   });

// //   final String imageCommunity;
// //   final String nameCommunity;
// //   final String token;
// //   final num idCommunity;

// //   @override
// //   State<Customcommunity> createState() => _CustomcommunityState();
// // }

// // class _CustomcommunityState extends State<Customcommunity> {
// //   bool isFollowing = false;

// //   @override
// //   void initState() {
// //     super.initState();
// //     _loadFollowingStatus();
// //   }

// //   // Load the following status from SharedPreferences
// //   Future<void> _loadFollowingStatus() async {
// //     final prefs = await SharedPreferences.getInstance();
// //     setState(() {
// //       isFollowing = prefs.getBool('isFollowing_${widget.idCommunity}') ?? false;
// //     });
// //   }

// //   // Save the following status to SharedPreferences
// //   Future<void> _saveFollowingStatus(bool status) async {
// //     final prefs = await SharedPreferences.getInstance();
// //     prefs.setBool('isFollowing_${widget.idCommunity}', status);
// //   }
// //   //  Future<void> _deleteFollowingStatus() async {
// //   //   final prefs = await SharedPreferences.getInstance();
// //   //   setState(() {
// //   //     prefs.remove('isFollowing_${widget.idCommunity}');
// //   //   });
// //   // }

// //   @override
// //   Widget build(BuildContext context) {
// //     return BlocProvider.value(
// //       value: BlocProvider.of<AuthBloc>(context),
// //       child: BlocBuilder<AuthBloc, AuthState>(
// //         builder: (context, state) {
// //           return Padding(
// //             padding: EdgeInsets.only(bottom: 17),
// //             child: InkWell(
// //               onTap: () {},
// //               child: Container(
// //                 width: 327,
// //                 height: 76,
// //                 decoration: BoxDecoration(
// //                   borderRadius: BorderRadius.circular(13),
// //                   color: Theme.of(context).colorScheme.onPrimaryContainer,
// //                 ),
// //                 child: Row(
// //                   crossAxisAlignment: CrossAxisAlignment.center,
// //                   children: [
// //                     SizedBox(width: 20),
// //                     Image.asset(
// //                       widget.imageCommunity,
// //                       width: 52,
// //                       height: 52,
// //                     ),
// //                     SizedBox(width: 20),
// //                     Text(
// //                       widget.nameCommunity,
// //                       style: TextStyle(
// //                         fontWeight: FontWeight.w600,
// //                         fontSize: 14,
// //                         color: Theme.of(context).colorScheme.onTertiary,
// //                         fontFamily: "Poppins",
// //                       ),
// //                     ),
// //                     SizedBox(width: 75),
// //                     InkWell(
// //                       onTap: () async {
// //                         if (state is Authenticated) {
// //                           dynamic result;
// //                           if (isFollowing) {
// //                             result = await UnFollowComm(widget.token, widget.idCommunity);
// //                           } else {
// //                             result = await FollowComm(widget.token, widget.idCommunity);
// //                           }
// //                           print("FollowComm result: $result");
// //                           if (result.isNotEmpty) {
// //                             setState(() {
// //                               isFollowing = !isFollowing;
// //                             });
// //                             _saveFollowingStatus(isFollowing);
// //                           }
// //                         } else {
// //                             // _deleteFollowingStatus();
                        
// //                           // setState(() async{
                         
                         
// //                           // });
// //                           // إظهار رسالة تطلب من الزائر تسجيل الدخول
// //                           showDialog(
// //                             context: context,
// //                             builder: (context) {
// //                               return AlertDialog(
// //                                 title: Text('تسجيل الدخول مطلوب'),
// //                                 content: Text('يرجى تسجيل الدخول للقيام بهذه العملية.'),
// //                                 actions: [
// //                                   TextButton(
// //                                     onPressed: () {
// //                                       Navigator.of(context).pop();
// //                                     },
// //                                     child: Text('موافق'),
// //                                   ),
// //                                 ],
// //                               );
// //                             },
// //                           );
// //                         }
// //                       },
// //                       child: Material(
// //                         elevation: 4.0,
// //                         borderRadius: BorderRadius.circular(7),
// //                         shadowColor: Colors.black.withOpacity(0.25),
// //                         child: Container(
// //                           height: 37,
// //                           width: 79,
// //                           decoration: BoxDecoration(
// //                             borderRadius: BorderRadius.circular(7),
// //                             color: Color(0x154AD2E4),
// //                           ),
// //                           child: Center(
// //                             child: CustomText(
// //                               family: "Tajawal",
// //                               color: Color(0xff5669FF),
// //                               size: 12,
// //                               text: isFollowing ? "Following" : "Follow",
// //                               weight: FontWeight.w400,
// //                             ),
// //                           ),
// //                         ),
// //                       ),
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //             ),
// //           );
// //         },
// //       ),
// //     );
// //   }
// // }
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:flutter_jobs_app/service/com_unfollow.dart';
// import 'package:flutter_jobs_app/service/com_follow.dart';
// import 'package:flutter_jobs_app/widgets/custom%20text.dart';
// import 'package:flutter_jobs_app/blocs/auth_bloc.dart';
// import 'package:flutter_jobs_app/blocs/auth_event.dart';
// import 'package:flutter_jobs_app/blocs/auth_state.dart';

// class Customcommunity extends StatefulWidget {
//   Customcommunity({
//     super.key,
//     required this.imageCommunity,
//     required this.nameCommunity,
//     required this.idCommunity,
//     required this.token,
//     required this.iduser,
//   });

//   final String imageCommunity;
//   final String nameCommunity;
//   final String token;
//   final num idCommunity;
//   final String iduser;

//   @override
//   State<Customcommunity> createState() => _CustomcommunityState();
// }

// class _CustomcommunityState extends State<Customcommunity> {
//   bool isFollowing = false;

//   @override
//   void initState() {
//     super.initState();
//     _loadFollowingStatus();
//   }

//   // تحميل حالة المتابعة من SharedPreferences
//   Future<void> _loadFollowingStatus() async {
//     final prefs = await SharedPreferences.getInstance();
//     setState(() {
//       // تعيين القيمة الافتراضية لـ isFollowing بناءً على الـ SharedPreferences
//       isFollowing = prefs.getBool('isFollowing_${widget.iduser}') ?? false;
//     });
//   }

//   // حفظ حالة المتابعة في SharedPreferences
//   Future<void> _saveFollowingStatus(bool status) async {
//     final prefs = await SharedPreferences.getInstance();
//     prefs.setBool('isFollowing_${widget.iduser}', status);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider.value(
//       value: BlocProvider.of<AuthBloc>(context),
//       child: BlocBuilder<AuthBloc, AuthState>(
//         builder: (context, state) {
//           return Padding(
//             padding: EdgeInsets.only(bottom: 17),
//             child: InkWell(
//               onTap: () {},
//               child: Container(
//                 width: 327,
//                 height: 76,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(13),
//                   color: Theme.of(context).colorScheme.onPrimaryContainer,
//                 ),
//                 child: Row(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                    Spacer(),
//                     Image.asset(
//                       widget.imageCommunity,
//                       width: 52,
//                       height: 52,
//                     ),
//                   Spacer(),
//                     Text(
//                       widget.nameCommunity,
//                       style: TextStyle(
//                         fontWeight: FontWeight.w600,
//                         fontSize: 14,
//                         color: Theme.of(context).colorScheme.onTertiary,
//                         fontFamily: "Poppins",
//                       ),
//                     ),
//                    Spacer(flex: 5,),
//                     InkWell(
//                       onTap: () async {
//                         if (state is Authenticated) {
//                           // إذا كان المستخدم معتمدًا، قم بتبديل حالة isFollowing بناءً على الـ API
//                           dynamic result;
//                           if (isFollowing) {
//                             result = await UnFollowComm(widget.token, widget.idCommunity);
//                           } else {
//                             result = await FollowComm(widget.token, widget.idCommunity);
//                           }
//                           print("FollowComm result: $result");
//                           if (result.isNotEmpty) {
//                             setState(() {
//                               isFollowing = !isFollowing;
//                             });
//                             _saveFollowingStatus(isFollowing);
//                           }
//                         } else {
//                           // إذا كان الزائر، قم بتعيين isFollowing إلى false
//                           // setState(() {
//                           //   isFollowing = false;
//                           // });
//                           // إظهار رسالة تطلب من الزائر تسجيل الدخول
//                             // _saveFollowingStatus(isFollowing);
//                           showDialog(
//                             context: context,
//                             builder: (context) {
//                               return AlertDialog(
//                                 title: Text('تسجيل الدخول مطلوب'),
//                                 content: Text('يرجى تسجيل الدخول للقيام بهذه العملية.'),
//                                 actions: [
//                                   TextButton(
//                                     onPressed: () {
//                                       Navigator.of(context).pop();
//                                     },
//                                     child: Text('موافق'),
//                                   ),
//                                 ],
//                               );
//                             },
//                           );
//                         }
//                       },
//                       child: Container(
//                         height: 37,
//                         width: 79,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(7),
//                           color: Color(0x154AD2E4),
//                         ),
//                         child: Center(
//                           child: Builder(
//                             builder: (context) {
//                                 if (state is Authenticated) { return CustomText(
//                                 family: "Tajawal",
//                                 color: Color(0xff5669FF),
//                                 size: 12,
//                                 text: isFollowing ? "Following".tr() : "Follow".tr(),
//                                 weight: FontWeight.w400,
//                               );}
//                              else{
//                                return CustomText(
//                                 family: "Tajawal",
//                                 color: Color(0xff5669FF),
//                                 size: 12,
//                                 text:"Follow",
//                                 weight: FontWeight.w400,
//                               );
//                              }
//                             }
//                           ),
//                         ),
//                       ),
//                     ),
//                     Spacer()
//                   ],
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_jobs_app/service/com_unfollow.dart';
import 'package:flutter_jobs_app/service/com_follow.dart';
import 'package:flutter_jobs_app/widgets/custom%20text.dart';
import 'package:flutter_jobs_app/blocs/auth_bloc.dart';
import 'package:flutter_jobs_app/blocs/auth_event.dart';
import 'package:flutter_jobs_app/blocs/auth_state.dart';

class Customcommunity extends StatefulWidget {
  Customcommunity({
    super.key,
    required this.imageCommunity,
    required this.nameCommunity,
    required this.idCommunity,
    required this.token,
    required this.iduser,
  });

  final String imageCommunity;
  final String nameCommunity;
  final String token;
  final num idCommunity;
  final String iduser;

  @override
  State<Customcommunity> createState() => _CustomcommunityState();
}

class _CustomcommunityState extends State<Customcommunity> {
  bool isFollowing = false;

  @override
  void initState() {
    super.initState();
    _loadFollowingStatus();
  }

  // تحميل حالة المتابعة من SharedPreferences
  Future<void> _loadFollowingStatus() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      // تعيين القيمة الافتراضية لـ isFollowing بناءً على الـ SharedPreferences
      isFollowing = prefs.getBool('isFollowing_${widget.iduser}') ?? false;
    });
  }

  // حفظ حالة المتابعة في SharedPreferences
  Future<void> _saveFollowingStatus(bool status) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('isFollowing_${widget.iduser}', status);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: BlocProvider.of<AuthBloc>(context),
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.only(bottom: 17),
            child: InkWell(
              onTap: () {},
              child: Container(
                width: 327,
                height: 100,  // تعديل ارتفاع الـ Container هنا
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13),
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.25),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3), // يضيف الظل تحريك خفيف للأسفل
                    ),
                  ],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Spacer(),
                    Image.asset(
                      widget.imageCommunity,
                      width: 52,
                      height: 52,
                    ),
                    Spacer(),
                    Text(
                      widget.nameCommunity,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: Theme.of(context).colorScheme.onTertiary,
                        fontFamily: "Poppins",
                      ),
                    ),
                    Spacer(flex: 5,),
                    InkWell(
                      onTap: () async {
                        if (state is Authenticated) {
                          // إذا كان المستخدم معتمدًا، قم بتبديل حالة isFollowing بناءً على الـ API
                          dynamic result;
                          if (isFollowing) {
                            result = await UnFollowComm(widget.token, widget.idCommunity);
                          } else {
                            result = await FollowComm(widget.token, widget.idCommunity);
                          }
                          print("FollowComm result: $result");
                          if (result.isNotEmpty) {
                            setState(() {
                              isFollowing = !isFollowing;
                            });
                            _saveFollowingStatus(isFollowing);
                          }
                        } else {
                          // إذا كان الزائر، قم بتعيين isFollowing إلى false
                          // setState(() {
                          //   isFollowing = false;
                          // });
                          // إظهار رسالة تطلب من الزائر تسجيل الدخول
                          // _saveFollowingStatus(isFollowing);
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text('تسجيل الدخول مطلوب'),
                                content: Text('يرجى تسجيل الدخول للقيام بهذه العملية.'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('موافق'),
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      },
                      child: Container(
                        height: 37,
                        width: 79,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: Color(0x154AD2E4),
                        ),
                        child: Center(
                          child: Builder(
                            builder: (context) {
                                if (state is Authenticated) { 
                                  return CustomText(
                                    family: "Tajawal",
                                    color: Color(0xff5669FF),
                                    size: 12,
                                    text: isFollowing ? "Following".tr() : "Follow".tr(),
                                    weight: FontWeight.w400,
                                  );
                                } else {
                                  return CustomText(
                                    family: "Tajawal",
                                    color: Color(0xff5669FF),
                                    size: 12,
                                    text:"Follow",
                                    weight: FontWeight.w400,
                                  );
                                }
                            }
                          ),
                        ),
                      ),
                    ),
                    Spacer()
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
