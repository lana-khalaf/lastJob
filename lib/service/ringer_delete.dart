import 'package:dio/dio.dart';
import 'package:flutter_jobs_app/contents.dart';

Future<dynamic> deleteUserRing(String token, num ringedId,String userId ) async {
  Dio dio = Dio();

  try {
    if (token != "") {
      print(token);
       String url = "$kBaseUrl/api/account/ring/$ringedId/delete";
      print("Request URL: $url");
      Response response = await dio.delete(
        "$kBaseUrl/api/account/ring/$ringedId/delete",
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
