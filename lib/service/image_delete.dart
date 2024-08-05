import 'package:dio/dio.dart';
import 'package:flutter_jobs_app/contents.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<String?> deleteProfilePicture(String token) async {
  Dio dio = Dio();

  try {
    // إرسال الطلب
    Response response = await dio.delete(
      "$kBaseUrl/api/account/picture/delete",
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      ),
    );

    // تحقق من حالة الاستجابة
    if (response.statusCode == 200) {
      print('Profile picture deleted successfully');
         SharedPreferences prefs = await SharedPreferences.getInstance();
    
          await prefs.remove('profile_picture');
      return 'Picture deleted successfully';
    } else {
      print('Failed to delete profile picture: ${response.statusCode} - ${response.data}');
      return 'Failed to delete profile picture';
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
    return 'Error occurred while deleting profile picture';
  }
}
