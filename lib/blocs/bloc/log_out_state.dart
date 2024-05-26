part of 'log_out_bloc.dart';

@immutable
sealed class LogOutState {}

final class LogOutInitial extends LogOutState {}
class Success extends LogOutState{}
class Failed extends LogOutState {}
class Error extends LogOutState{
}
class Loading extends LogOutState {}
