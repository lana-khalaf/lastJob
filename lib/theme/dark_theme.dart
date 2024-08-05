// import 'package:flutter/material.dart';
// import 'package:flutter_jobs_app/contents.dart';

// ThemeData darkTheme =ThemeData(
//   brightness:  Brightness.dark,
  
//   colorScheme: ColorScheme.dark(
//    primary: Color(0xffFFFFFF),
//   secondary: Color(0xffFFFFFF),
//  onPrimary: Color(0xff969AA0),
//    onSecondary: Color(0xff1D2247),
//    primaryContainer: Color(0xff356899), //  تعديل textfield
//    secondaryContainer: Color(0xffAFB0B6),//  تعديلicon  جنب ال textfield
//  tertiary: Color(0xffE4E5E7),//تعديل النص بال  textfield searchscreen
// onTertiary: Color(0xff0D0D26),//  تعديل للعنوان بال  searchscreen
//     onPrimaryContainer: Color(0xffffffff),
//      //تعديل المنتج بال  search
//      onSecondaryContainer: Color(0xff000000),
//       onSurface: Color(0xff555555) ,
//        onTertiaryContainer: Color(0xf58585B),
//         onBackground: Color(0xff1E244A),
//          inversePrimary: Color(0xff151E48),
     
//       ),
//        textSelectionTheme: TextSelectionThemeData(
//     cursorColor: kMainColor,
//     selectionHandleColor: kMainColor,
//   ),
//   useMaterial3: true,
//   );
import 'package:flutter/material.dart';
import 'package:flutter_jobs_app/contents.dart';

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.fromSeed(
    seedColor: kMainColor,
    brightness: Brightness.dark,
  ).copyWith(

  secondary: Color(0xffFFFFFF),
 onPrimary: Color(0xff969AA0),
   onSecondary: Color(0xff1D2247),
   primaryContainer: Color(0xff356899), //  تعديل textfield
   secondaryContainer: Color(0xffAFB0B6),//  تعديلicon  جنب ال textfield
 tertiary: Color(0xffE4E5E7),//تعديل النص بال  textfield searchscreen
onTertiary: Color.fromARGB(255, 164, 164, 164),//  تعديل للعنوان بال  searchscreen
  
     //تعديل المنتج بال  search
     onSecondaryContainer: Color(0xff000000),
      onSurface: Color(0xff555555) ,
       onTertiaryContainer: Color(0xf58585B),

      
onInverseSurface:  Color(0xffFFFFFF),
surfaceContainer:Color(0xff000000) ,
         onPrimaryFixed: Color(0xffFFFFFF),

        onBackground: Color(0xff1E244A),
          onPrimaryFixedVariant: Color(0xff969AA0),
              onErrorContainer:Color(0xff242B55) ,
      primary: Color(0xffFFFFFF),
         inversePrimary: Color(0xffFFFFFF),
           onPrimaryContainer: Color(0xffffffff),
     
  ),
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: kMainColor,
    selectionHandleColor: kMainColor,
  ),
  useMaterial3: true,
);
