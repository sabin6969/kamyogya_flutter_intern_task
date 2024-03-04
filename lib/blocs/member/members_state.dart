part of 'members_bloc.dart';

sealed class MembersState extends Equatable {
  const MembersState();

  @override
  List<Object> get props => [];
}

final class MembersInitial extends MembersState {}

final class MembersLoadedState extends MembersState {
  final List<MembersModel> members;
  const MembersLoadedState({required this.members});
}

final class MembersLoadingState extends MembersState {}

final class MembersErrorState extends MembersState {
  final String message;
  const MembersErrorState({required this.message});
}
