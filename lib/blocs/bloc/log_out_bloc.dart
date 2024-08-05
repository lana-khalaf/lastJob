import 'package:bloc/bloc.dart';
import 'package:flutter_jobs_app/config.dart';
import 'package:flutter_jobs_app/service/logout.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'log_out_event.dart';
part 'log_out_state.dart';

class LogOutBloc extends Bloc<LogOutEvent, LogOutState> {
  LogOutBloc() : super(LogOutInitial()) {
    on<LogOutEvent>((event, emit)async {
    emit(Loading());
        print("loadingg");
      // String result =await login(event.usermodel);
       SharedPreferences prefs = await SharedPreferences.getInstance();
      dynamic token=config.get<SharedPreferences>().get("Token")!;
      print(" shooo $token");
      //  dynamic profilePic=config.get<SharedPreferences>().get("profile_picture")!;
      dynamic result =await logOut(token);
        if (result is String && result.isNotEmpty) {
          await prefs.remove('profile_picture');
           await prefs.remove("Token");
        emit(Success());
        print("successs");
      } else if (result == "") {
        emit(Failed());
        print("Failedd");
      } else {
        emit(Error());
        print("Error occurred");
      }
    });
  }
}
