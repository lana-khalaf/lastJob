// // import 'package:bloc/bloc.dart';
// // import 'package:equatable/equatable.dart';
// // import 'package:flutter_jobs_app/Model/community_page-model.dart';
// // import 'package:flutter_jobs_app/service/communityPageApi.dart';

// // part 'community_event.dart';
// // part 'community_state.dart';

// // class CommunityBloc extends Bloc<CommunityEvent, CommunityState> {
// //   CommunityBloc() : super(CommunityInitial()) {
// //     on<GetCommunity>((event, emit) async{
// //         emit(Loading());
// //         print("loadingg");
// //       // String result =await login(event.usermodel);
// //       dynamic result =await getCommunities();
// //       if(result is List<CommunityModel>){
// //         emit(Success(communaties: result));
// //       }
// //       else{
// //            print("Error");
// //         emit(Error());
// //       }
// //     });
// //   }
// // }
// import 'package:bloc/bloc.dart';
// import 'package:flutter_jobs_app/service/comm_search.dart';
// import 'package:flutter_jobs_app/service/communityPageApi.dart';
// import 'package:flutter_jobs_app/Model/community_page-model.dart';

// import 'community_event.dart';
// import 'community_state.dart';

// class CommunityBloc extends Bloc<CommunityEvent, CommunityState> {
//   CommunityBloc() : super(CommunityLoading());

//   @override
//   Stream<CommunityState> mapEventToState(CommunityEvent event) async* {
//     if (event is GetCommunity) {
//       yield CommunityLoading();
//       try {
//         final communities = await getCommunities();
//         yield CommunitySuccess.CommunitySuccess(communities);
//       } catch (e) {
//         yield CommunityError();
//       }
//     } else if (event is SearchCommunity) {
//       yield CommunityLoading();
//       try {
//         if (event.searchQuery.isEmpty) {
//           final communities = await getCommunities();
//           yield CommunitySuccess.CommunitySuccess(communities);
//         } else {
//           final searchResult = await SearchCommunities(event.searchQuery);
//           yield CommunitySuccess.CommunitySuccess(searchResult);
//         }
//       } catch (e) {
//         yield CommunityError();
//       }
//     }
//   }
// }
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_jobs_app/Model/community_page-model.dart';
import 'package:flutter_jobs_app/blocs/community_event.dart';
import 'package:flutter_jobs_app/blocs/community_state.dart';
import 'package:flutter_jobs_app/service/comm_search.dart';
import 'package:flutter_jobs_app/service/communityPageApi.dart';

class CommunityBloc extends Bloc<CommunityEvent, CommunityState> {
  CommunityBloc() : super(CommunityInitial()) {
    on<GetCommunity>((event, emit) async {
      emit(CommunityLoading());
      try {
        dynamic result = await getCommunities();
        if (result is List<CommunityModel>) {
          emit(CommunitySuccess(communities: result));
        } else {
          emit(CommunityError());
        }
      } catch (e) {
        print("Error: $e");
        emit(CommunityError());
      }
    });

    on<SearchCommunity>((event, emit) async {
      emit(CommunityLoading());
      try {
        dynamic result = await SearchCommunities(event.searchQuery);
        if (result is List<CommunityModel>) {
          emit(CommunitySuccess(communities: result));
        } else {
          emit(CommunityError());
        }
      } catch (e) {
        print("Error: $e");
        emit(CommunityError());
      }
    });
  }
}
