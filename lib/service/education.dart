
// // import 'package:dio/dio.dart';
// // import 'package:mashrou3/Model/major_model.dart';

// // Future<List<Major>> getMajors() async {
// //   Dio dio = Dio();
// //   Response response = await dio.get("https://localhost:7192/api/user/major/index");
// //   List<Major> Majors = List.generate(response.data.length,
// //       (index) => Major.fromMap(response.data[index]));
// //   return Majors;
// // }
import 'package:dio/dio.dart';
import 'package:flutter_jobs_app/Model/community_page-model.dart';
import 'package:flutter_jobs_app/Model/education.dart';
import 'package:flutter_jobs_app/Model/experience.dart';
import 'package:flutter_jobs_app/Model/major_model.dart';
import 'package:flutter_jobs_app/Model/skill.dart';
import 'package:flutter_jobs_app/contents.dart';

// Future<List<Education>> getEducation(String userId,String token) async {
//   Dio dio = Dio();
   

//   try {
//     // إرسال الطلب
//     Response response = await dio.get("$kBaseUrl/api/user/education/$userId" ,
//     options: Options(
//         headers: {
//           'Authorization': 'Bearer $token',
//         },
//       ),);
    
//     // تحقق من حالة الاستجابة
//     if (response.statusCode == 200) {
//       // تحويل البيانات إلى قائمة من الكائنات Major
//         print('t Response data: ${response.data}');
//         print('Response data type: ${response.data.runtimeType}');
        
//     //       List<Education> educations = (response.data as List)
//     //       .map((json) => Education.fromJson(json))
//     //       .toList();
//     //   return educations;
     
//     // } else {
//     //   // إذا كانت حالة الاستجابة غير 200، يمكنك التعامل مع الخطأ هنا
//     //        print('Error Response: ${response.statusCode} - ${response.data}');
//     //   return [];
//     // }
//           if (response.data is List) {
//         List<Education> educations = (response.data as List)
//             .map((json) {
//               print('Education item: $json');
//               print('Education item type: ${json.runtimeType}');
//               return Education.fromJson(json);
//             })
//             .toList();
//         return educations;
//       } else {
//         print("Unexpected response format: ${response.data}");
//         return [];
//       }
//     } else {
//       print('Error Response: ${response.statusCode} - ${response.data}');
//       return [];
//     }

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
//   }
// }
Future<List<Education>> getEducation(String userId, String token) async {
  Dio dio = Dio();

  try {
    // إرسال الطلب
    Response response = await dio.get(
      "$kBaseUrl/api/education/$userId",
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
      ),
    );

    // تحقق من حالة الاستجابة
    if (response.statusCode == 200) {
      // تحويل البيانات إلى قائمة من الكائنات Education
      print('t Response data: ${response.data}');
      print('Response data type: ${response.data.runtimeType}');

      List<Education> educations = (response.data as List)
          .map((item) {
            print('Education item: $item');
            print('Education item type: ${item.runtimeType}');
            return Education.fromMap(item as Map<String, dynamic>);
          })
          .toList();
      return educations;
    } else {
      // إذا كانت حالة الاستجابة غير 200، يمكنك التعامل مع الخطأ هنا
      print('Error Response: ${response.statusCode} - ${response.data}');
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
