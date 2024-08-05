import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_jobs_app/Model/cv.model.dart';
import 'package:flutter_jobs_app/service/cv_get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'cv_event.dart';
import 'cv_state.dart';

class CVBloc extends Bloc<CVEvent, CVState> {


  CVBloc() : super(CVInitial()) {
    on<GetCVs>((event, emit) async {
      emit(CVLoading());
      try {
         SharedPreferences prefs = await SharedPreferences.getInstance();
                String? userId = prefs.getString("id");
         if ( userId != null) {  
           dynamic cvs =await getCVs(userId);
  if(cvs is List<CV>){
        print("success bloc");
        emit(CVSuccess(cvs: cvs));
      }
      else{
           print("Error");
        emit(CVError());
      }
    
      
      } 
      else{
   print("Failed to get userId from SharedPreferences");
        emit(CVError());
      }}
        catch (_) {
        emit(CVError());
      }
  });
  }
}
