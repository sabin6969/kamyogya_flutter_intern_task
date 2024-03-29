import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kamyogya_flutter_intern_task/data/models/members_model.dart';
import 'package:kamyogya_flutter_intern_task/data/repository/api_repository.dart';
import 'package:kamyogya_flutter_intern_task/utils/validate_url.dart';

part 'members_event.dart';
part 'members_state.dart';

class MembersBloc extends Bloc<MembersEvent, MembersState> with ValidateURL {
  final ApiRepository apiRepository;
  MembersBloc({required this.apiRepository}) : super(MembersInitial()) {
    on<MembersLoadEvent>(handelLoadMemberEvent);
  }

  Future<void> handelLoadMemberEvent(
      MembersLoadEvent event, Emitter<MembersState> emit) async {
    emit(MembersInitial());
    if (isValidURL(url: event.endPoint)) {
      emit(MembersLoadingState());
      try {
        final List<MembersModel> members =
            await apiRepository.getMembersData(endPoint: event.endPoint);
        emit(MembersLoadedState(members: members));
      } on DioException catch (e) {
        switch (e.type) {
          case DioExceptionType.badResponse:
            emit(const MembersErrorState(message: "Bad Request"));
          case DioExceptionType.connectionTimeout:
            emit(const MembersErrorState(message: "Server request timeout"));
          case DioExceptionType.cancel:
            emit(
                const MembersErrorState(message: "Request canceled try again"));
          case DioExceptionType.connectionError:
            emit(const MembersErrorState(
                message: "Connection error check your internet connection"));
          default:
            emit(MembersErrorState(message: e.toString()));
        }
      } catch (e) {
        emit(MembersErrorState(message: e.toString()));
      }
    } else {
      emit(
        const MembersErrorState(message: "Please enter a valid url"),
      );
    }
  }
}
