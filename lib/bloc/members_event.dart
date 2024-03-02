part of 'members_bloc.dart';

sealed class MembersEvent extends Equatable {
  const MembersEvent();

  @override
  List<Object> get props => [];
}

class MembersLoadEvent extends MembersEvent {
  final String endPoint;
  const MembersLoadEvent({required this.endPoint});
}
