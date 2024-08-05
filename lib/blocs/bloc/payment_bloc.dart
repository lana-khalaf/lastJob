import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_jobs_app/config.dart';
import 'package:flutter_jobs_app/service/payment.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';


part 'payment_event.dart';
part 'payment_state.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  PaymentBloc() : super(PaymentInitial()) {
    on<CreatePayment>((event, emit) async {
      emit(PaymentLoading());
      print("loading");
     String userTokenn = config.get<SharedPreferences>().getString("Token") ?? "";
      
      try {
        String result = await createPayment(event.username, event.amount, event.purpose, userTokenn);
        if (result.isEmpty) {
          emit(PaymentFailure(error: 'Failed to create payment.'));
          print("Failed");
        } else {
          emit(PaymentSuccess(result: result));
          print("Success");
        }
      } catch (e) {
        emit(PaymentFailure(error: e.toString()));
        print("Error: ${e.toString()}");
      }
    });
  }
}
