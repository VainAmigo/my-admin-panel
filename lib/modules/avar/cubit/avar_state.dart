part of 'avar_cubit.dart';

@immutable
sealed class AvarState{
  const AvarState();
}

@immutable
  class AvarInitial extends AvarState {
  const AvarInitial();
}

@immutable
class AvarLoading extends AvarState {
  const AvarLoading();
}

@immutable
class AvarLoaded extends AvarState {
  const AvarLoaded(this.data);
  final AvarPolicySearchResponse data;
}

@immutable
class AvarError extends AvarState {
  const AvarError(this.error);
  final String error;
}