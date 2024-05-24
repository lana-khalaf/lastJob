import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_jobs_app/contents.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
part 'forget_password_event.dart';
part 'forget_password_state.dart';

class ForgetPasswordBloc
    extends Bloc<ForgetPasswordEvent, ForgetPasswordState> {
  ForgetPasswordBloc() : super(ForgetPasswordInitial()) {
    final String vcode;
    on<RestorePasswordEvent>(onRestorePassword);
    on<CheckVCodeEvent>(onCheckVCode);
  }
  onRestorePassword(
    RestorePasswordEvent event,
    Emitter<ForgetPasswordState> emit,
  ) async {
    print('============================hello bloc');
    print('============================$state');
    try {
      emit(LoaderState());
      String respons = await post(
        url: '$kBaseUrl/api/account/resetpassword?email=${event.email}',
      );

      print('============================$respons');
      if (respons.length == 6) {
        emit(CorrectEmail(event.email, respons));
      } else {
        emit(WrongEmail());
      }
    } catch (_) {
      emit(WrongEmail());
    }
  }

  onCheckVCode(CheckVCodeEvent event, Emitter<ForgetPasswordState> emit) async {
    print('============================hello check bloc');
    print('============================$state');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print('============================shared${prefs.getString('vcode')}');
    print('============================event${event.vCode}');
    String code= prefs.getString('vcode')!;
    if (code == event.vCode) {
      print('============================Correct');
      emit(CorrectVCode());
    }else{
      emit(WrongVCode());
    }

    
  }

  Future<String> post(
      {required String url,
      @required dynamic body,
      @required String? token}) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll(
        {'Authorization': 'Bearer $token'},
      );
    }
    http.Response response = await http.post(
      Uri.parse(url),
      body: body,
      headers: headers,
    );
    if (response.statusCode == 200) {
      // String data = 'success';

      String text = response.body;
      String currentNumber = "";
      List<int> numbers = [];
      for (int i = 0; i < text.length; i++) {
        if (text[i].contains(RegExp(r'[0-9]'))) {
          currentNumber += text[i];
        } else {
          if (currentNumber.isNotEmpty) {
            numbers.add(int.parse(currentNumber));
            currentNumber = "";
          }
        }
      }
      if (currentNumber.isNotEmpty) {
        numbers.add(int.parse(currentNumber));
      }

      print(numbers[0]);
      String vCode = numbers[0].toString();
      // Map<String, dynamic> data = jsonDecode(response.body);
      return vCode;
    } else {
      throw Exception(
          'there is a problem with status code ${response.statusCode} with body ${response.body}');
    }
  }
}
