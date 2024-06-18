

import 'package:equatable/equatable.dart';
import 'package:flutter_jobs_app/Model/experience.dart';

sealed class ExperienceState extends Equatable {
  const  ExperienceState();
  
  @override
  List<Object> get props => [];
}

final class ExperienceInitial extends ExperienceState {}

class ExperienceSuccess extends ExperienceState {
List<Experience> experiences;
  ExperienceSuccess({
   required this.experiences
  });

}
class ExperienceFailed extends ExperienceState {}

class ExperienceError extends ExperienceState{
  
}
class ExperienceLoading extends ExperienceState {}

