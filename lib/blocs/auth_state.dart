// part of 'auth_bloc.dart';

// @immutable
// sealed class AuthState {}

// final class AuthInitial extends AuthState {}
// class Authenticated extends AuthState {}
// class Unauthenticated extends AuthState {}
import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class Authenticated extends AuthState {
  
  final String token;

  Authenticated({ required this.token});

  @override
  List<Object> get props => [ token];
}

class Unauthenticated extends AuthState {}
