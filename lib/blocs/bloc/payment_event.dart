// part of 'payment_bloc.dart';

// sealed class PaymentEvent extends Equatable {
//   const PaymentEvent();

//   @override
//   List<Object> get props => [];
// }
part of 'payment_bloc.dart';


abstract class PaymentEvent extends Equatable {
  const PaymentEvent();

  @override
  List<Object> get props => [];
}

class CreatePayment extends PaymentEvent {
  final String username;
  final double amount;
  final String purpose;

  const CreatePayment({
    required this.username,
    required this.amount,
    required this.purpose,
  });

  @override
  List<Object> get props => [username, amount, purpose];
}
