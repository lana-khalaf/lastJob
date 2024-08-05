
// import 'package:dio/dio.dart';
// import 'package:mashrou3/Model/major_model.dart';

// Future<List<Major>> getMajors() async {
//   Dio dio = Dio();
//   Response response = await dio.get("https://localhost:7192/api/user/major/index");
//   List<Major> Majors = List.generate(response.data.length,
//       (index) => Major.fromMap(response.data[index]));
//   return Majors;
// }
import 'package:dio/dio.dart';
import 'package:flutter_jobs_app/Model/community_page-model.dart';
import 'package:flutter_jobs_app/Model/major_model.dart';
import 'package:flutter_jobs_app/contents.dart';

Future<List<CommunityModel>> SearchCommunities(String search) async {
  Dio dio = Dio();

  try {
    // إرسال الطلب
    Response response = await dio.get("$kBaseUrl/api/community/search/$search");
    
    // تحقق من حالة الاستجابة
    if (response.statusCode == 200) {
      // تحويل البيانات إلى قائمة من الكائنات Major
        print('t Response data: ${response.data}');
      List<CommunityModel> communities = (response.data as List)
          .map((json) => CommunityModel.fromJson(json))
          .toList();
      return communities;
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
