// part of 'community_bloc.dart';

// import 'package:flutter_jobs_app/Model/community_page-model.dart';

// sealed class CommunityState extends Equatable {
//   const CommunityState();
  
//   @override
//   List<Object> get props => [];
// }

// final class CommunityInitial extends CommunityState {}
// class Success extends CommunityState {
// List<CommunityModel> communaties;
//   Success({
//    required this.communaties
//   });

// }
// class Failed extends CommunityState {}

// class Error extends CommunityState{
  
// }
// class Loading extends CommunityState {}
import 'package:equatable/equatable.dart';
import 'package:flutter_jobs_app/Model/community_page-model.dart';

abstract class CommunityState extends Equatable {
  const CommunityState();

  @override
  List<Object?> get props => [];
}

class CommunityInitial extends CommunityState {}

class CommunitySuccess extends CommunityState {
  final List<CommunityModel> communities;

  CommunitySuccess({required this.communities});



  @override
  List<Object?> get props => [communities];
}

class CommunityError extends CommunityState {}

class CommunityLoading extends CommunityState {}

