import 'package:bloc/bloc.dart';
import 'package:flutter_jobs_app/service/register.dart';
import 'package:flutter_jobs_app/Model/rigester_model.dart';
import 'package:flutter_jobs_app/Model/user_model.dart';
import 'package:flutter_jobs_app/service/register.dart';
import 'package:meta/meta.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterInitial()) {
    on<Register>((event, emit) async{
           emit(Loading());
        print("loadingg");
      // String result =await login(event.usermodel);
      dynamic result =await register(event.usermodel);
       
      if(result is UserModel){
        emit(Success()); ////////
          // config.get<SharedPreferences>().se("Token", result);
         print("success bloc");
      }
      else{
        if(result is String){
           emit(Error(errorMessage: result));
       
          print("Error bloc");
        }
       else{
        emit (Failed());
       }
      }
    });
  }
}
