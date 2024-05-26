

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_jobs_app/Model/login_model.dart';


Future<dynamic> login(LoginModel user) async {
  Dio dio = Dio();
  
  // إعداد بيانات النموذج
  FormData formData = FormData.fromMap(user.toMap());
  
  try {
    Response response = await dio.post(
      "https://localhost:7192/api/account/login",
      data: formData,
      options: Options(
        headers: {
          "Content-Type": "multipart/form-data",
        },
      ),
    );
        if (response.statusCode == 200)
         {
      print('t Response data: ${response.data}');

      RegExp tokenRegExp = RegExp(r'Token: (.+)');
  String token = tokenRegExp.firstMatch(response.data)?.group(1) ?? '';
       
        return token;
        }
         else {
           print('Error Response: ${response.statusCode} - ${response.data}');
      return 1;
      
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
    return "";
  }
}
