part of 'skill_bloc.dart';

sealed class SkillState extends Equatable {
  const  SkillState();
  
  @override
  List<Object> get props => [];
}

final class SkillInitial extends SkillState {}

class Success extends SkillState {
List<Skill> skills;
  Success({
   required this.skills
  });

}
class Failed extends SkillState {}

class Error extends SkillState{
  
}
class Loading extends SkillState {}

