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
  final VarificationListResponse data;
}

@immutable
class VerificationError extends VerificationState {
  const VerificationError(this.error);
  final String error;
}

