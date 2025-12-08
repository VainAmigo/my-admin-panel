import 'dart:developer';

import 'package:admin_panel/server/server.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'avar_filter_state.dart';

class AvarFilterCubit extends Cubit<AvarFilterState> {
  AvarFilterCubit(this.repository) : super(AvarFilterInitial());

  final AvarRepository repository;

  Future<void> getAvarFilteredSearch({
    int? page,
    int? limit,
    String? caseNumber,
    String? policyNumber,
    DateTime? dateOfAccident,
    DateTime? dateOfPayout,
    String? status,
    String? keyword,
  }) async {
    try {
      if (state is AvarFilterLoading) return;
      emit(const AvarFilterLoading());
      
      final request = AvarFilteredSearchRequest(
        caseNumber: caseNumber,
        policyNumber: policyNumber,
        dateOfAccident: dateOfAccident,
        dateOfPayout: dateOfPayout,
        status: status,
        keyword: keyword,
      );
      
      final data = await repository.getAvarFilteredSearch(
        page: page ?? 0,
        limit: limit ?? 10,
        request: request,
      );
      
      emit(AvarFilterLoaded(data));
    } catch (e, s) {
      log('AvarFilterCubit Error: $e\n$s');
      emit(AvarFilterError(e.toString()));
    }
  }
}
