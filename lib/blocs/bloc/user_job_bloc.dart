import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_jobs_app/Model/Job.dart';
import 'package:flutter_jobs_app/service/userJob.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'user_job_event.dart';
part 'user_job_state.dart';

// class UserJobBloc extends Bloc<UserJobEvent, UserJobState> {
//    JobStatus jobStatus = JobStatus.all;
//   List<Job> allJobs = [];


//   UserJobBloc() : super(UserJobInitial()) {
//     on<GetUserJob>((event, emit) async{
//      emit(UserJobLoading());
//         print("loadingg");
//       // String result =await login(event.usermodel);
//        SharedPreferences prefs = await SharedPreferences.getInstance();
//        String? token= prefs.getString("Token");
      

//         if (token != null) {
//   dynamic result =await getUserJobs(token);
      
//       if(result is List<Job>){
//         emit(UserJobSuccess( UserJobs: result));
//       }
//       else{
//            print("Error");
//         emit(UserJobError());
//       }
//         }
//          else {
//         print("Failed to get Token or userId from SharedPreferences");
//         emit(UserJobError());
//       }

//       // هون
//     on<FilterJobs>((event, emit) {
//       jobStatus = event.status;
//       List<Job> filteredJobs = allJobs.where((job) {
//         if (jobStatus == JobStatus.all) {
//           return true;
//         } else if (jobStatus == JobStatus.cancelled) {
//           return job.status == "Cancelled";
//         } else if (jobStatus == JobStatus.waiting) {
//           return job.status == "Waiting";
//         } else if (jobStatus == JobStatus.accepted) {
//           return job.status == "Accepted";
//         }
//         return false;
//       }).toList();
//       emit(UserJobSuccess(UserJobs: filteredJobs));
//     });
   
//   }
//     );
// }
// }
class UserJobBloc extends Bloc<UserJobEvent, UserJobState> {
  JobStatus jobStatus = JobStatus.all;
  List<Job> allJobs = [];

  UserJobBloc() : super(UserJobInitial()) {
    on<GetUserJob>((event, emit) async {
      emit(UserJobLoading());
      print("loadingg");

      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString("Token");

      if (token != null) {
        dynamic result = await getUserJobs(token);

        if (result is List<Job>) {
          allJobs = result;
          emit(UserJobSuccess(UserJobs: allJobs));
        } else {
          print("Error");
          emit(UserJobError());
        }
      } else {
        print("Failed to get Token or userId from SharedPreferences");
        emit(UserJobError());
      }
    });

    on<FilterJobs>((event, emit) {
      jobStatus = event.status;
      List<Job> filteredJobs = allJobs.where((job) {
        if (jobStatus == JobStatus.all) {
          return true;
        } else if (jobStatus == JobStatus.cancelled) {
          return job.status == false;
        } else if (jobStatus == JobStatus.waiting) {
          return job.status == null;
        } else if (jobStatus == JobStatus.accepted) {
          return job.status == true;
        }
        return false;
      }).toList();
      emit(UserJobSuccess(UserJobs: filteredJobs));
    });
  }
}
