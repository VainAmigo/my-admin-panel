import 'dart:developer';

import 'package:admin_panel/server/server.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'verification_state.dart';

class VerificationCubit extends Cubit<VerificationState> {
  VerificationCubit(this.repository) : super(VerificationInitial());

  final VerificationRepository repository;

  Future<void> getVerificationList({
    required bool isVerified,
    int page = 1,
    int limit = 10,
  }) async {
    try {
      if (state is VerificationLoading) return;
      emit(const VerificationLoading());
      
      final data = await repository.getVerificationList(
        isVerified: isVerified,
        page: page,
        limit: limit,
      );
      
      emit(VerificationLoaded(data));
    } catch (e, s) {
      log('VerificationCubit Error: $e\n$s');
      emit(VerificationError(e.toString()));
    }
  }
}

