import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_jobs_app/Model/user_taq_model.dart';
import 'package:flutter_jobs_app/service/user.dart';

import 'package:shared_preferences/shared_preferences.dart';

part 'get_user_event.dart';
part 'get_user_state.dart';

class GetUserBloc extends Bloc<GetUserEvent, GetUserState> {
  GetUserBloc() : super(GetUserInitial()) {
    on<GetUser>((event, emit) async{
       emit(GetUserLoading());
       SharedPreferences prefs = await SharedPreferences.getInstance();
      
        String? userId = prefs.getString("id");
        
        if ( userId != null) {
           dynamic result = await getUser(userId);

      if (result is User) {
        emit(GetUserSuccess(user: result));
      } else {
        print("Error");
        emit(GetUserError());
      }
        }
      else {
        print("Failed to get userId from SharedPreferences");
        emit(GetUserError());
      }
    });
  }
}
