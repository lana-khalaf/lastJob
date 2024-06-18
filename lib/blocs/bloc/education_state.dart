part of 'education_bloc.dart';

sealed class EducationState extends Equatable {
  const EducationState();
  
  @override
  List<Object> get props => [];
}

final class EducationInitial extends EducationState {}

class EducationSuccess extends EducationState {
List<Education> educations;
  EducationSuccess({
   required this.educations
  });

}
class EducationFailed extends EducationState {}

class EducationError extends EducationState{
  
}
class EducationLoading extends EducationState {}

