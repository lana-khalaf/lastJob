part of 'register_bloc.dart';

@immutable
sealed class RegisterState {}

final class RegisterInitial extends RegisterState {}
class Success extends RegisterState {
// String UserName;
  // Success({
  //   required this.UserName,
  // });

}

class Failed extends RegisterState {}

class Error extends RegisterState{
  String errorMessage;
  Error({
    required this.errorMessage,
  });
  
}
class Loading extends RegisterState {}
