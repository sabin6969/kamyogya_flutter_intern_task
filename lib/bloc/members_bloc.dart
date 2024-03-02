import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kamyogya_flutter_intern_task/data/models/members_model.dart';
import 'package:kamyogya_flutter_intern_task/data/repository/api_repository.dart';
import 'package:kamyogya_flutter_intern_task/exceptions/app_exceptions.dart';
import 'package:kamyogya_flutter_intern_task/utils/validate_url.dart';

part 'members_event.dart';
part 'members_state.dart';

class MembersBloc extends Bloc<MembersEvent, MembersState> with ValidateURL {
  final ApiRepository apiRepository;
  MembersBloc({required this.apiRepository}) : super(MembersInitial()) {
    on<MembersLoadEvent>(
      (event, emit) async {
        emit(MembersInitial());
        if (isValidURL(url: event.endPoint)) {
          emit(MembersLoadingState());
          try {
            final List<MembersModel> members =
                await apiRepository.getMembersData(endPoint: event.endPoint);
            emit(MembersLoadedState(members: members));
          } on DioException catch (e) {
            emit(
              MembersErrorState(
                message: e.error.toString(),
              ),
            );
          } on ResourceNotFoundException catch (e) {
            emit(MembersErrorState(message: e.message));
          } catch (e) {
            emit(
              MembersErrorState(
                message: e.toString(),
              ),
            );
            return;
          }
        } else {
          emit(
            const MembersErrorState(message: "Please enter a valid url"),
          );
        }
      },
    );
  }
}
