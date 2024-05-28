import 'package:dio/dio.dart';
import 'package:flutter_jobs_app/Model/login_model.dart';
import 'package:flutter_jobs_app/Model/rigester_model.dart';
import 'package:flutter_jobs_app/Model/user_model.dart';
import 'package:flutter_jobs_app/config.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<dynamic> register(RegisterModel user) async {
  Dio dio = Dio();
  FormData formData = FormData.fromMap(user.toMap());
  try {
    Response response = await dio.post(
      "https://localhost:7192/api/account/register",
      data: formData,
      options: Options(
        headers: {
          "Content-Type": "multipart/form-data",
        },
      ),
    );
    if (response.statusCode == 200) {
      print('t Response data: ${response.data}');
      // التعبيرات النمطية لاستخراج المعلومات
      RegExp idRegExp = RegExp(r'Id: (\d+)');
      RegExp usernameRegExp = RegExp(r'Username: ([\w\.]+)');
      RegExp emailRegExp =
          RegExp(r'Email: ([\w\.\+]+@[a-zA-Z_]+?\.[a-zA-Z]{2,6})');
      RegExp verificationCodeRegExp =
          RegExp(r'Your verification code is: (\d+)');

      // استخراج المعلومات باستخدام التعبيرات النمطية
      String id = idRegExp.firstMatch(response.data)?.group(1) ?? '';
      String userName =
          usernameRegExp.firstMatch(response.data)?.group(1) ?? '';
      String email = emailRegExp.firstMatch(response.data)?.group(1) ?? '';
      String verificationCode =
          verificationCodeRegExp.firstMatch(response.data)?.group(1) ?? '';

      config.get<SharedPreferences>().setString("userName", userName);
      config.get<SharedPreferences>().setString("email", email);
      config.get<SharedPreferences>().setString("id", id);
      config
          .get<SharedPreferences>()
          .setString("verificationCode", verificationCode);

      // عرض المعلومات المستخرجة
      print('Id: $id');
      print('Username: $userName');
      print('Email: $email');
      print('Verification Code: $verificationCode');

      return UserModel(
          Id: id,
          Username: userName,
          Email: email,
          verificationCode: verificationCode);
    } else if (response.statusCode == 400) {
      String emailErrorMessage = response.data!['errors']['Email'][0];
      print(emailErrorMessage);
      return emailErrorMessage;
    } else if (response.statusCode == 422) {
      String errorMessage = response.data![""]['errors'][0]['errorMessage'];
      print("sho: $errorMessage");
      return errorMessage;
    } else {
      print("ma baref");
    }
  } catch (e) {
    if (e is DioError) {
      print("DioError: ${e.message}");
      if (e.response != null) {
        print("DioError response data: ${e.response?.data}");
        if (e.response?.statusCode == 400) {
          // الوصول إلى رسالة الخطأ المتعلقة بالبريد الإلكتروني في حالة DioError
          var errorData = e.response?.data;
          if (errorData is Map &&
              errorData['errors'] != null &&
              errorData['errors']['Email'] != null) {
            String emailErrorMessage = errorData['errors']['Email'][0];
            print(emailErrorMessage);
            return emailErrorMessage;
          }
        }
      }
    } else {
      print("Error: $e");
    }

    return "";
  }
}
