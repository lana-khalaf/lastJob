
import 'package:dio/dio.dart';
import 'package:flutter_jobs_app/Model/community_page-model.dart';
import 'package:flutter_jobs_app/Model/education.dart';
import 'package:flutter_jobs_app/Model/experience.dart';
import 'package:flutter_jobs_app/Model/major_model.dart';
import 'package:flutter_jobs_app/Model/skill.dart';
import 'package:flutter_jobs_app/Model/userBlog/user_blog.dart';
import 'package:flutter_jobs_app/contents.dart';


Future<List<UserBlogs>> getUserBlogs(String token) async {
  Dio dio = Dio();

  try {
    // إرسال الطلب
    if(token != ""){
      print(token);
      Response response = await dio.get(
      "$kBaseUrl/api/blog/user/blogs",
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

      List<UserBlogs> userBlogs = (response.data as List)
          .map((item) {
            // print('Education item: $item');
            // print('Education item type: ${item.runtimeType}');
            return UserBlogs.fromMap(item as Map<String, dynamic>);
          })
          .toList();
      return userBlogs;
    } else {
      // إذا كانت حالة الاستجابة غير 200، يمكنك التعامل مع الخطأ هنا
      print('Error Response: ${response.statusCode} - ${response.data}');
      return [];
    }
  }
    else{
      print("aaaaa");
      return [];
    }
  }
   catch (e) {
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
