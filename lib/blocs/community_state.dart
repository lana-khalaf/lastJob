part of 'community_bloc.dart';

sealed class CommunityState extends Equatable {
  const CommunityState();
  
  @override
  List<Object> get props => [];
}

final class CommunityInitial extends CommunityState {}
class Success extends CommunityState {
List<CommunityModel> communaties;
  Success({
   required this.communaties
  });

}
class Failed extends CommunityState {}

class Error extends CommunityState{
  
}
class Loading extends CommunityState {}

