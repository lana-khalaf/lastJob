part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}
class LogIn extends AuthEvent {}
class LogOut extends AuthEvent {}

