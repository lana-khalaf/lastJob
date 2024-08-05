import 'package:dio/dio.dart';
import 'package:flutter_jobs_app/Model/cv.model.dart';
import 'package:flutter_jobs_app/contents.dart';



  

  Future<List<CV>> getCVs(String userId) async {
    final Dio _dio = Dio();
    final url = '$kBaseUrl/api/cv/$userId/index';

    try {
      Response response = await _dio.get(url);

      if (response.statusCode == 200) {
        // List<CV> cvList = (response.data as List)
        //     .map((json) => CV.fromJson(json))
        //     .toList();
        // return cvList;
         List<CV> cvList = (response.data as List)
          .map((item) {
            print('cv item: $item');
            print('cv item type: ${item.runtimeType}');
            return CV.fromMap(item as Map<String, dynamic>);
          })
          .toList();
          print("success service cv");
          return cvList;
      } else {
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

