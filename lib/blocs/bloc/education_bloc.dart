import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_jobs_app/Model/education.dart';
import 'package:flutter_jobs_app/service/education.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'education_event.dart';
part 'education_state.dart';

class EducationBloc extends Bloc<EducationEvent, EducationState> {
  EducationBloc() : super(EducationInitial()) {
    on<GetEducation>((event, emit) async{
        emit(EducationLoading());
        print("loadingg");
      // String result =await login(event.usermodel);
       SharedPreferences prefs = await SharedPreferences.getInstance();
       String? token= prefs.getString("Token");
        String? userId = prefs.getString("id");

        if (token != null && userId != null) {
  dynamic result =await getEducation(userId,token);
      
      if(result is List<Education>){
        print("success bloc");
        emit(EducationSuccess( educations: result));
      }
      else{
           print("Error");
        emit(EducationError());
      }
        }
         else {
        print("Failed to get Token or userId from SharedPreferences");
        emit(EducationError());
      }
    
   
    });
  }
}
