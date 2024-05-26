// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'login_bloc.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}
class Success extends LoginState {
String Token;
  Success({
    required this.Token,
  });

}

class Failed extends LoginState {}

class Error extends LoginState{
  
}
class Loading extends LoginState {}

