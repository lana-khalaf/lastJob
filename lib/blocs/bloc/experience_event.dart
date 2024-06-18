


import 'package:equatable/equatable.dart';

sealed class ExperienceEvent extends Equatable {
  const ExperienceEvent();

  @override
  List<Object> get props => [];
}
class GetExperiences extends ExperienceEvent {}