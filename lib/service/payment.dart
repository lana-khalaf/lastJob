import 'package:dio/dio.dart';
import 'package:flutter_jobs_app/contents.dart';

Future<String> createPayment(String BeneficiaryUsername, double Amount , String Purpose , String token) async {
  Dio dio = Dio();
  
  FormData formData = FormData.fromMap({
    'BeneficiaryUsername': BeneficiaryUsername,
    'Amount': Amount,
    'Purpose': Purpose ,
  });

  try {
    Response response = await dio.post(
      "$kBaseUrl/api/payment/create",
      data: formData,
      options: Options(
        headers: {
          "Content-Type": "multipart/form-data",     
          'Authorization': 'Bearer $token',
        },
      ),
    );
    
    if (response.statusCode == 200) {
      print('Response data: ${response.data}');
      return response.data;
    } else {
      print('Error Response: ${response.statusCode} - ${response.data}');
      return "";
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
    return "";
  }
}
