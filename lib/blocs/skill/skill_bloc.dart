import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_jobs_app/Model/skill.dart';
import 'package:flutter_jobs_app/config.dart';
import 'package:flutter_jobs_app/service/skill.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'skill_event.dart';
part 'skill_state.dart';

class SkillBloc extends Bloc<SkillEvent, SkillState> {
  SkillBloc() : super(SkillInitial()) {
    on<GetSkills>((event, emit) async {
       emit(Loading());
        print("loadingg");
      // String result =await login(event.usermodel);
       SharedPreferences prefs = await SharedPreferences.getInstance();
       String? token= prefs.getString("Token");
        String? userId = prefs.getString("id");

        if (token != null && userId != null) {
  dynamic result =await getSkills(userId,token);
      
      if(result is List<Skill>){
        print("success bloc");
        emit(Success( skills: result));
      }
      else{
           print("Error");
        emit(Error());
      }
        }
         else {
        print("Failed to get Token or userId from SharedPreferences");
        emit(Error());
      }
    
    });
  }
}
