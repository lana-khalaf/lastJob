// part of 'payment_bloc.dart';

// sealed class PaymentState extends Equatable {
//   const PaymentState();
  
//   @override
//   List<Object> get props => [];
// }

// final class PaymentInitial extends PaymentState {}
part of 'payment_bloc.dart';


abstract class PaymentState extends Equatable {
  const PaymentState();

  @override
  List<Object> get props => [];
}

class PaymentInitial extends PaymentState {}

class PaymentLoading extends PaymentState {}

class PaymentSuccess extends PaymentState {
  final String result;

  const PaymentSuccess({required this.result});

  @override
  List<Object> get props => [result];
}

class PaymentFailure extends PaymentState {
  final String error;

  const PaymentFailure({required this.error});

  @override
  List<Object> get props => [error];
}
