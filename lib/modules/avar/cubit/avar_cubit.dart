import 'dart:developer';

import 'package:admin_panel/server/server.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'avar_state.dart';

class AvarCubit extends Cubit<AvarState> {
  AvarCubit(this.repository) : super(AvarInitial());

  final AvarRepository repository;

  Future<void> getAvarSearch(String policyNumber) async {
    try {
      if (state is AvarLoading) return;
      emit(const AvarLoading());
      final data = await repository.getAvarSearch(policyNumber);
      emit(AvarLoaded(data));
    } catch (e, s) {
      log('AvarCubit Error: $e\n$s');
      emit(AvarError(e.toString()));
    }
  }

  // Future<void> getDraftedAvar({required AvarSearchParam param}) async {
  //   try {
  //     if (state is EmergancyCommLoading) return;
  //     emit(const EmergancyCommLoading());
  //     final data = await repository.getDraftedAvar(param);
  //     emit(EmergancyCommLoaded(data));
  //   } catch (e, s) {
  //     log('EmergancyCommCubit Error: $e\n$s');
  //     emit(EmergancyCommError(e.toString()));
  //   }
  // }

  // Future<void> getApprovedAvar({required AvarSearchParam param}) async {
  //   try {
  //     if (state is EmergancyCommLoading) return;
  //     emit(const EmergancyCommLoading());
  //     final data = await repository.getApprovedAvar(param);
  //     emit(EmergancyCommLoaded(data));
  //   } catch (e, s) {
  //     log('EmergancyCommCubit Error: $e\n$s');
  //     emit(EmergancyCommError(e.toString()));
  //   }
  // }
}
