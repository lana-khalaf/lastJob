import 'package:dio/dio.dart';
import 'package:flutter_jobs_app/contents.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:shared_preferences/shared_preferences.dart';

Future<String?> updateProfilePicture(String token) async {
  Dio dio = Dio();
  final picker = ImagePicker();

  try {
    // اختر صورة من معرض الصور
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      File imageFile = File(pickedFile.path);

      // إعداد البيانات للإرسال
      String fileName = imageFile.path.split('/').last;
    
      FormData formData = FormData.fromMap({
  "picture": await MultipartFile.fromFile(imageFile.path, filename: fileName),
});


      // إرسال الطلب
Response response = await dio.put(
  "$kBaseUrl/api/account/picture/change",
  data: formData,
  options: Options(
    headers: {
      'Authorization': 'Bearer $token',
      'Content-Type': 'multipart/form-data',
    },
  ),
);


      // تحقق من حالة الاستجابة
      if (response.statusCode == 200) {
        print('Profile picture updated successfully');
            // Save image path in SharedPreferences
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('profile_picture', pickedFile.path);
        return pickedFile.path;  // إعادة المسار هنا
      } else {
        print('Failed to update profile picture: ${response.statusCode} - ${response.data}');
        return null;
      }
    } else {
      print('No image selected.');
      return null;
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
    return null;
  }
}
