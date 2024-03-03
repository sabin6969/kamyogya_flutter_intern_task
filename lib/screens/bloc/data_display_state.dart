part of 'data_display_bloc.dart';

sealed class DataDisplayState extends Equatable {
  const DataDisplayState();

  @override
  List<Object> get props => [];
}

final class DataDisplayInitial extends DataDisplayState {}

final class DataDisplayInProgress extends DataDisplayState {
  final List<MembersModel> members;
  const DataDisplayInProgress({required this.members});
  @override
  List<Object> get props => [members];
}
