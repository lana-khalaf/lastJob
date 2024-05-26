import 'package:bloc/bloc.dart';
import 'package:flutter_jobs_app/Model/login_model.dart';
import 'package:flutter_jobs_app/config.dart';
import 'package:flutter_jobs_app/service/login.dart';

import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';


part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<Login>((event, emit) async{
        emit(Loading());
        print("loadingg");
      // String result =await login(event.usermodel);
      dynamic result =await login(event.usermodel);
       
      if(result.isEmpty){
        emit(Failed());
         print("Failedd");
      }
      else{
        if(result is String){
           emit(Success(Token: result));
        config.get<SharedPreferences>().setString("Token", result);
          print("successs");
        }
       else{
        emit (Error());
       }
      }
    });
  }
}
