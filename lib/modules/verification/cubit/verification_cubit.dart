import 'dart:developer';

import 'package:admin_panel/server/server.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'verification_state.dart';

class VerificationCubit extends Cubit<VerificationState> {
  VerificationCubit(this.repository) : super(VerificationInitial());

  final VerificationRepository repository;

  Future<void> getVerificationList({
    required VerificationStatus verificationStatus,
    int page = 0,
    int limit = 10,
  }) async {
    try {
      if (state is VerificationLoading) return;
      emit(const VerificationLoading());

      final data = await repository.getVerificationList(
        request: VerificationListRequest(
          verificationStatus: verificationStatus,
        ),
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

class SetVerificationStatusCubit extends Cubit<SetVerificationStatusState> {
  SetVerificationStatusCubit(this.repository)
    : super(SetVerificationStatusInitial());

  final VerificationRepository repository;

  Future<void> setVerificationStatus({
    required String verificationStatus,
    required int id,
    required String rejectReasonDescription,
  }) async {
    try {
      emit(const SetVerificationStatusLoading());
      print('-- ------------------------------ verificationStatus: $verificationStatus');
      print('-- ------------------------------ rejectReasonDescription: $rejectReasonDescription');
      print('-- ------------------------------ id: $id');
      await repository.setVerificationStatus(
        body: VerificationSetVerificationStatusBody(
          status: verificationStatus,
          rejectReasonDescription: rejectReasonDescription,
        ),
        id: id,
      );
      emit(const SetVerificationStatusLoaded());
    } catch (e, s) {
      log('SetVerificationStatusCubit Error: $e\n$s');
      emit(SetVerificationStatusError(e.toString()));
    }
  }
}
