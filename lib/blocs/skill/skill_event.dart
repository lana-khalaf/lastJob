part of 'skill_bloc.dart';

sealed class SkillEvent extends Equatable {
  const SkillEvent();

  @override
  List<Object> get props => [];
}
class GetSkills extends SkillEvent {}