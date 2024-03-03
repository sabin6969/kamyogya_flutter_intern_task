import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kamyogya_flutter_intern_task/data/models/members_model.dart';
import 'package:kamyogya_flutter_intern_task/notifications/local_notifications.dart';

part 'data_display_event.dart';
part 'data_display_state.dart';

class DataDisplayBloc extends Bloc<DataDisplayEvent, DataDisplayState> {
  DataDisplayBloc() : super(DataDisplayInitial()) {
    on<LoadMembersDataEvent>(loadMembersDetails);
  }

  void loadMembersDetails(
      LoadMembersDataEvent event, Emitter<DataDisplayState> emit) async {
    final List<MembersModel> topMembers = event.membersDetails.take(3).toList();
    final List<MembersModel> membersToBeDisplayed = [];
    for (int i = 0; i < topMembers.length; i++) {
      membersToBeDisplayed.add(topMembers[i]);
      emit(
        DataDisplayInProgress(
          members: List.of(membersToBeDisplayed),
        ),
      );
      if (i < topMembers.length - 1) {
        await Future.delayed(const Duration(seconds: 5));
      }
    }
    await Future.delayed(const Duration(seconds: 5));
    sendNotification();
  }

  void sendNotification() {
    LocalNotification().sendNotifications(
      title: "This is the title",
      body: "This is the body",
    );
  }
}
