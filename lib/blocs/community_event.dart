// part of 'community_bloc.dart';

// sealed class CommunityEvent extends Equatable {
//   const CommunityEvent();

//   @override
//   List<Object> get props => [];
// }
// class GetCommunity extends CommunityEvent {}
import 'package:equatable/equatable.dart';

abstract class CommunityEvent extends Equatable {
  const CommunityEvent();

  @override
  List<Object?> get props => [];
}

class GetCommunity extends CommunityEvent {}

class SearchCommunity extends CommunityEvent {
  final String searchQuery;

  SearchCommunity(this.searchQuery);

  @override
  List<Object?> get props => [searchQuery];
}
