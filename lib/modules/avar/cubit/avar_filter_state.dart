part of 'avar_filter_cubit.dart';

@immutable
sealed class AvarFilterState{
  const AvarFilterState();
}

@immutable
  class AvarFilterInitial extends AvarFilterState {
  const AvarFilterInitial();
}

@immutable
class AvarFilterLoading extends AvarFilterState {
  const AvarFilterLoading();
}

@immutable
class AvarFilterLoaded extends AvarFilterState {
  const AvarFilterLoaded(this.data);
  final AvarFilteredSearchResponse data;
}

@immutable
class AvarFilterError extends AvarFilterState {
  const AvarFilterError(this.error);
  final String error;
}