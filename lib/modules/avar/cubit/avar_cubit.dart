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

  Future<void> createClaim(AvarCreateClaimRequest request) async {
    try {
      if (state is AvarLoading) return;
      emit(const AvarLoading());
      final data = await repository.createClaim(request);
      emit(AvarCreateClaimLoaded(data));
    } catch (e, s) {
      log('AvarCubit Error: $e\n$s');
      emit(AvarCreateClaimError(e.toString()));
    }
  }
}
