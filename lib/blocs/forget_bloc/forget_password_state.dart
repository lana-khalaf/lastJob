part of 'forget_password_bloc.dart';

@immutable
sealed class ForgetPasswordState {}

final class ForgetPasswordInitial extends ForgetPasswordState {}

final class CorrectEmail extends ForgetPasswordState {
  final String email;
  final String vCode;
  CorrectEmail(this.email, this.vCode);
}

final class WrongEmail extends ForgetPasswordState {}

final class LoaderState extends ForgetPasswordState {}

final class CorrectVCode extends ForgetPasswordState {}

final class WrongVCode extends ForgetPasswordState {}

final class PasswordChanged extends ForgetPasswordState {}

final class PasswordNotChanged extends ForgetPasswordState {}
final class EmailVerify extends ForgetPasswordState {}