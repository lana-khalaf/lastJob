import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'resrt_password_event.dart';
part 'resrt_password_state.dart';

class ResrtPasswordBloc extends Bloc<ResrtPasswordEvent, ResrtPasswordState> {
  ResrtPasswordBloc() : super(ResrtPasswordInitial()) {
    on<ResrtPasswordEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
