part of 'get_user_bloc.dart';

sealed class GetUserState extends Equatable {
  const GetUserState();
  
  @override
  List<Object> get props => [];
}

final class GetUserInitial extends GetUserState {}


class GetUserLoading extends GetUserState {}

class GetUserSuccess extends GetUserState {
  final User user;

  const GetUserSuccess({required this.user});

  @override
  List<Object> get props => [user];
}

class GetUserError extends GetUserState {}