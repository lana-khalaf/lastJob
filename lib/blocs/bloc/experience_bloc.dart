import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_jobs_app/Model/experience.dart';

import 'package:flutter_jobs_app/blocs/bloc/experience_event.dart';
import 'package:flutter_jobs_app/blocs/bloc/experience_event.dart';
import 'package:flutter_jobs_app/blocs/bloc/experience_event.dart';
import 'package:flutter_jobs_app/blocs/bloc/experience_state.dart';
import 'package:flutter_jobs_app/config.dart';
import 'package:flutter_jobs_app/service/experience.dart';
import 'package:shared_preferences/shared_preferences.dart';



class ExperienceBloc extends Bloc<ExperienceEvent, ExperienceState> {
  ExperienceBloc() : super(ExperienceInitial()) {
    on<GetExperiences>((event, emit) async {
       emit(ExperienceLoading());
        print("loadingg");
      // String result =await login(event.usermodel);
       SharedPreferences prefs = await SharedPreferences.getInstance();
       String? token= prefs.getString("Token");
        String? userId = prefs.getString("id");

        if (token != null && userId != null) {
  dynamic result =await getExperience(userId,token);
      
      if(result is List<Experience>){
        emit(ExperienceSuccess( experiences: result));
      }
      else{
           print("Error");
        emit(ExperienceError());
      }
        }
         else {
        print("Failed to get Token or userId from SharedPreferences");
        emit(ExperienceError());
      }
    
    });
  }
}
