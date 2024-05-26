import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) {
     if (event is LogIn) {
      emit(Authenticated()) ;
    } else if (event is LogOut) {
      emit(Unauthenticated()) ;
    }
    });
  }
}
