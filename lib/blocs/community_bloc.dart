import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_jobs_app/Model/community_page-model.dart';
import 'package:flutter_jobs_app/service/communityPageApi.dart';

part 'community_event.dart';
part 'community_state.dart';

class CommunityBloc extends Bloc<CommunityEvent, CommunityState> {
  CommunityBloc() : super(CommunityInitial()) {
    on<GetCommunity>((event, emit) async{
        emit(Loading());
        print("loadingg");
      // String result =await login(event.usermodel);
      dynamic result =await getCommunities();
      if(result is List<CommunityModel>){
        emit(Success(communaties: result));
      }
      else{
           print("Error");
        emit(Error());
      }
    });
  }
}
