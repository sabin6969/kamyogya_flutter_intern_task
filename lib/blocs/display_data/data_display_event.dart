part of 'data_display_bloc.dart';

sealed class DataDisplayEvent extends Equatable {
  const DataDisplayEvent();

  @override
  List<Object> get props => [];
}

class LoadMembersDataEvent extends DataDisplayEvent {
  final List<MembersModel> membersDetails;
  const LoadMembersDataEvent({required this.membersDetails});
}
