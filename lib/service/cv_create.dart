
import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter_jobs_app/contents.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

Future<bool> sendResumeToApi(Uint8List resumeData, String token) async {
  try {
    final uri = Uri.parse('$kBaseUrl/api/cv/create');
    
    // Create a multipart request
    final request = http.MultipartRequest('POST', uri);
    
    // Add the PDF file to the request
    request.files.add(http.MultipartFile.fromBytes(
      'file', 
      resumeData, 
      filename: 'resume.pdf',
      contentType: MediaType('application', 'pdf'),
    ));

    // Add authentication header
    request.headers['Authorization'] = 'Bearer $token';
    
    // Send the request
    final response = await request.send();

    if (response.statusCode == 200) {
      // final responseBody = await http.Response.fromStream(response);
      // final decodedResponse = jsonDecode(responseBody.body);
      // print(decodedResponse);
      // if (decodedResponse['message'] == 'CV created Sucessfully..') {
        return true;
      } 
      else  {
        print('Error: ${response}');
          print('Failed to send resume: ${response.statusCode}');
        return false;
      }
   
  } catch (e) {
    print('Error sending resume to API: $e');
    return false;
  }
}
