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

class ChangePassword extends ForgetPasswordEvent {
  ChangePassword({
    required this.newPass,
    required this.confirmPass,
  });
  String newPass;
  String confirmPass;
}
