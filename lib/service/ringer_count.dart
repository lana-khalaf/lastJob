import 'package:dio/dio.dart';

Future<int> getRingerCount(String userId, String token) async {
  Dio dio = Dio();
  try {
    // إرسال الطلب
    Response response = await dio.get(
      "https://localhost:7192/api/user/ring/count/$userId",
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
      ),
    );

    // تحقق من حالة الاستجابة
    if (response.statusCode == 200) {
      // تحويل البيانات إلى عدد
      int ringerCount = response.data;
      return ringerCount;
    } else {
      // إذا كانت حالة الاستجابة غير 200، يمكنك التعامل مع الخطأ هنا
      print('Error Response: ${response.statusCode} - ${response.data}');
      return -1; // أو يمكنك إعادة قيمة تعبر عن خطأ مثل -1
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
    return -1; // أو يمكنك إعادة قيمة تعبر عن خطأ مثل -1
  }
}
