
// import 'package:bloc/bloc.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'auth_event.dart';
// import 'auth_state.dart';

// class AuthBloc extends Bloc<AuthEvent, AuthState> {
//   AuthBloc() : super(AuthInitial());

//     on<CheckAuthStatus>((event, emit) async {
//         SharedPreferences prefs = await SharedPreferences.getInstance();
//       String? token = prefs.getString("Token");

//       if (token != null) {
//         emit(Authenticated(token: token));
//       } else {
//         emit(Unauthenticated());
//       }
//     });

//     on<LoginAuth>((event, emit) async {
//     // يجب تعيين الـ Token في SharedPreferences بعد نجاح عملية تسجيل الدخول
//       SharedPreferences prefs = await SharedPreferences.getInstance();
//       await prefs.setString("Token", "your_token_here");

//       String? token = prefs.getString("Token");

//       if (token != null) {
//         emit(Authenticated(token: token));
//       } else {
//         emit(Unauthenticated());
//       }
//     });
//        on<LogoutAuth>((event, emit) async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//       await prefs.remove("Token");
//       emit(Unauthenticated());
//     });

//   // @override
//   // void onEvent(AuthEvent event) async {
//   //   if (event is CheckAuthStatus) {
//   //     SharedPreferences prefs = await SharedPreferences.getInstance();
//   //     String? token = prefs.getString("Token");

//   //     if (token != null) {
//   //       emit(Authenticated(token: token));
//   //     } else {
//   //       emit(Unauthenticated());
//   //     }
//   //   } else if (event is LoginAuth) {
//   //     // يجب تعيين الـ Token في SharedPreferences بعد نجاح عملية تسجيل الدخول
//   //     SharedPreferences prefs = await SharedPreferences.getInstance();
//   //     await prefs.setString("Token", "your_token_here");

//   //     String? token = prefs.getString("Token");

//   //     if (token != null) {
//   //       emit(Authenticated(token: token));
//   //     } else {
//   //       emit(Unauthenticated());
//   //     }
//   //   } else if (event is LogoutAuth) {
//   //     SharedPreferences prefs = await SharedPreferences.getInstance();
//   //     await prefs.remove("Token");
//   //     emit(Unauthenticated());
//   //   }
//   // }
// }
import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<CheckAuthStatus>((event, emit) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString("Token");

      if (token != null) {
        emit(Authenticated(token: token));
      } else {
        emit(Unauthenticated());
      }
    });

    on<LoginAuth>((event, emit) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
     

      String? token = prefs.getString("Token");

      if (token != null) {
        emit(Authenticated(token: token));
      } else {
        emit(Unauthenticated());
      }
    });

    on<LogoutAuth>((event, emit) async {
      // SharedPreferences prefs = await SharedPreferences.getInstance();
      // await prefs.remove("Token");
      emit(Unauthenticated());
    });
  }
}
