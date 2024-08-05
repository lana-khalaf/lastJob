import 'package:dio/dio.dart';
import 'package:flutter_jobs_app/contents.dart';

Future<dynamic> createUserRing(String token, num ringedId) async {
  Dio dio = Dio();

  try {
    if (token != "") {
      print(token);
        String url = "$kBaseUrl/api/account/ring/$ringedId/create";
      print("Request URL: $url");
      Response response = await dio.post(
        "$kBaseUrl/api/account/ring/$ringedId/create",
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      if (response.statusCode == 200) {
        print("User Ringed Successfully");
        print('Response data: ${response.data}');
        return response.data;
      } else {
        print('Error Response: ${response.statusCode} - ${response.data}');
        return [];
      }
    } else {
        print("Token is empty");
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
