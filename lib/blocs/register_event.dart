part of 'register_bloc.dart';

@immutable
sealed class RegisterEvent {}
class Register extends RegisterEvent {
  
   RegisterModel usermodel;
  Register({
    
    required this.usermodel
  });
 

}