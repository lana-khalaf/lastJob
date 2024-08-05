part of 'user_job_bloc.dart';

sealed class UserJobEvent extends Equatable {
  const UserJobEvent();

  @override
  List<Object> get props => [];
}
class GetUserJob extends UserJobEvent {}
//هنا
class FilterJobs extends UserJobEvent {
  final JobStatus status;

  FilterJobs(this.status);

  @override
  List<Object> get props => [status];
}

enum JobStatus { all, cancelled, waiting, accepted }