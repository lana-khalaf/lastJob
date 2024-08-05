part of 'user_job_bloc.dart';

sealed class UserJobState extends Equatable {
  const UserJobState();
  
  @override
  List<Object> get props => [];
}

final class UserJobInitial extends UserJobState {}

class UserJobSuccess extends UserJobState {
List<Job> UserJobs;
  UserJobSuccess({
   required this.UserJobs
  });

}
class UserJobFailed extends UserJobState {}

class UserJobError extends UserJobState{
  
}
class UserJobLoading extends UserJobState {}