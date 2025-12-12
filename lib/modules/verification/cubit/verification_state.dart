part of 'verification_cubit.dart';

@immutable
sealed class VerificationState {
  const VerificationState();
}

@immutable
class VerificationInitial extends VerificationState {
  const VerificationInitial();
}

@immutable
class VerificationLoading extends VerificationState {
  const VerificationLoading();
}

@immutable
class VerificationLoaded extends VerificationState {
  const VerificationLoaded(this.data);
  final VerificationListResponse data;
}

@immutable
class VerificationError extends VerificationState {
  const VerificationError(this.error);
  final String error;
}


// Set Verification Status

@immutable
sealed class SetVerificationStatusState {
  const SetVerificationStatusState();
}

@immutable
class SetVerificationStatusInitial extends SetVerificationStatusState {
  const SetVerificationStatusInitial();
}

@immutable
class SetVerificationStatusLoaded extends SetVerificationStatusState {
  const SetVerificationStatusLoaded();
}

@immutable
class SetVerificationStatusLoading extends SetVerificationStatusState {
  const SetVerificationStatusLoading();
}

@immutable
class SetVerificationStatusError extends SetVerificationStatusState {
  const SetVerificationStatusError(this.error);
  final String error;
}