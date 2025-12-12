import 'package:admin_panel/server/server.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'users_state.dart';

class UsersCubit extends Cubit<UsersState> {
  UsersCubit(this.repository) : super(UsersInitial());

  final UsersRepository repository;

  Future<void> getUsersSearch({
    required UsersSearchRequest request, 
    int page = 0, 
    int limit = 10,
  }) async {
    if (state is UsersLoading) return;
    emit(UsersLoading());
    try {
      final data = await repository.getUsersSearch(
        request: request,
        page: page,
        limit: limit,
      );
      emit(UsersLoaded(data));
    } catch (e) {
      emit(UsersError(e.toString()));
    }
  }

  void resetFilter() {
    emit(UsersInitial());
  }
}