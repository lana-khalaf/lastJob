part of 'forget_password_bloc.dart';

@immutable
sealed class ForgetPasswordEvent {}

class RestorePasswordEvent extends ForgetPasswordEvent {
  
  RestorePasswordEvent({required this.email});
  String email;
  
}
class CheckVCodeEvent extends ForgetPasswordEvent {
 CheckVCodeEvent({required this.vCode});
  String vCode;
}
