// part of 'auth_bloc.dart';

// @immutable
// sealed class AuthEvent {}
// class LogIn extends AuthEvent {}
// class LogOut extends AuthEvent {}

import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class CheckAuthStatus extends AuthEvent {}

class LoginAuth extends AuthEvent {}

class LogoutAuth extends AuthEvent {}
