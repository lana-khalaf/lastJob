
// import 'package:dio/dio.dart';
// import 'package:flutter_jobs_app/Model/community_page-model.dart';
// import 'package:flutter_jobs_app/Model/education.dart';
// import 'package:flutter_jobs_app/Model/experience.dart';
// import 'package:flutter_jobs_app/Model/major_model.dart';
// import 'package:flutter_jobs_app/Model/skill.dart';
// import 'package:flutter_jobs_app/Model/userBlog/user_blog.dart';
// import 'package:flutter_jobs_app/contents.dart';


// Future<dynamic> FollowComm(String token,num commId) async {
//   Dio dio = Dio();

//   try {
//     // إرسال الطلب
//     if(token != ""){
//       print(token);
//       Response response = await dio.post(
//       "$kBaseUrl/api/community/user/join/$commId",
//       options: Options(
//         headers: {
//           'Authorization': 'Bearer $token',
          
          
//         },
//       ),
//     );

//     // تحقق من حالة الاستجابة
//      if (response.statusCode == 200) {
//       // تحويل البيانات إلى قائمة من الكائنات Major
//       print("follow successful");
//         print('t Response data: ${response.data}');
   
//       return response.data;
//     } else {
//       // إذا كانت حالة الاستجابة غير 200، يمكنك التعامل مع الخطأ هنا
//            print('Error Response: ${response.statusCode} - ${response.data}');
           
//   return [];
//     }
   
//   }
//   else{
//     return [];
//   }
//   } catch (e) {
//     if (e is DioError) {
//       print("DioError: ${e.message}");
//       if (e.response != null) {
//         print("DioError response data: ${e.response?.data}");
//       }
//     } else {
//       print("Error: $e");
//     }
//     return [];
//     }
// }

  import 'package:dio/dio.dart';
  import 'package:flutter_jobs_app/Model/community_page-model.dart';
  import 'package:flutter_jobs_app/Model/education.dart';
  import 'package:flutter_jobs_app/Model/experience.dart';
  import 'package:flutter_jobs_app/Model/major_model.dart';
  import 'package:flutter_jobs_app/Model/skill.dart';
  import 'package:flutter_jobs_app/Model/userBlog/user_blog.dart';
  import 'package:flutter_jobs_app/contents.dart';


  Future<dynamic> FollowComm(String token,num commId) async {
    Dio dio = Dio();

    try {
      // إرسال الطلب
      if(token != ""){
        print(token);
        Response response = await dio.post(
       "$kBaseUrl/api/community/user/join/$commId",
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            
            
          },
        ),
      );

      // تحقق من حالة الاستجابة
      if (response.statusCode == 200) {
        // تحويل البيانات إلى قائمة من الكائنات Major
        print("follow successful");
          print('t Response data: ${response.data}');
    
        return response.data;
      } else {
        // إذا كانت حالة الاستجابة غير 200، يمكنك التعامل مع الخطأ هنا
            print('Error Response: ${response.statusCode} - ${response.data}');
            
    return [];
      }
    
    }
    else{
      return [];
    }
    } catch (e) {
      if (e is DioError) {
        print("DioError: ${e.message}");
        if (e.response != null) {
          print("DioError response data: ${e.response?.data}");
        }
      } else {
        print("Error: $e");
      }
      return [];
      }
  }
