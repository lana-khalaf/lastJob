// // import 'package:flutter/material.dart';
// // import 'package:flutter_jobs_app/contents.dart';

// // ThemeData lightTheme=ThemeData(
// //   brightness: Brightness.light,
// //   colorScheme :ColorScheme.light(
//     primary:Color(0xff242B55),
// secondary: Color(0xff3B4758),//للنص اللي باول الصفحة متل تسجيل الدخول
// onPrimary: Color(0xff969AA0), //للنص اللي تحت اول نص بتسجيل الدخول
// onSecondary: Color(0xffFFFFFF//للنص اللي جوا الزر
// ),
// primaryContainer: Color(0xff356899) ,//  textfield بال  search
// secondaryContainer: Color(0xffAFB0B6),// بال search icon  جنب ال textfield
//   tertiary: Color(0xffE4E5E7),// النص بال  textfield searchscreen
// onTertiary: Color(0xff0D0D26),// للعنوان بال  searchscreen
//   onPrimaryContainer: Color(0xffffffff), // المنتج بال  search
//  onSecondaryContainer: Color(0xff000000),
//  onSurface: Color(0xff555555) ,
//  onTertiaryContainer: Color(0xf58585B),
//  onBackground: Color(0xffE4E8FC),
//  inversePrimary: Color(0xff151E48),
 
//  ),
//   textSelectionTheme: TextSelectionThemeData(
//     cursorColor: kMainColor,
//     selectionHandleColor: kMainColor,
//   ),
//   useMaterial3: true,

// );
import 'package:flutter/material.dart';
import 'package:flutter_jobs_app/contents.dart';
ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.fromSeed(
    seedColor: kMainColor,
    brightness: Brightness.light,
  ).copyWith(
 
secondary: Color(0xff3B4758),//للنص اللي باول الصفحة متل تسجيل الدخول
onPrimary: Color(0xff969AA0), //للنص اللي تحت اول نص بتسجيل الدخول
onSecondary: Color(0xffFFFFFF//للنص اللي جوا الزر
),
primaryContainer: Color(0xff356899) ,//  textfield بال  search
secondaryContainer: Color(0xffAFB0B6),// بال search icon  جنب ال textfield
  tertiary: Color(0xffE4E5E7),// النص بال  textfield searchscreen
onTertiary: Color(0xff0D0D26),// للعنوان بال  searchscreen
 
 onSecondaryContainer: Color(0xff000000),
 onSurface: Color(0xff555555) ,
 onTertiaryContainer: Color(0xf58585B),
 
 onBackground: Color(0xffFFFFFF),
 inversePrimary: Color(0xff242B55),// ستخدمتا بال  job


onInverseSurface: Color.fromARGB(255, 253, 254, 255),
 onPrimaryContainer: Color(0xffFFFFFF) ,// المنتج بال  search
    onErrorContainer:Color(0xff242B55) ,
     primary:Color(0xff242B55),
  onPrimaryFixed: Color(0xff2C2E32),
  onPrimaryFixedVariant: Color(0xff969AA0),
 
  ),
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: kMainColor,
    selectionHandleColor: kMainColor,
  ),
  useMaterial3: true,
);