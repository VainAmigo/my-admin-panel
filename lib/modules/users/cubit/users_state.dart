part of 'users_cubit.dart';

@immutable
sealed class UsersState {
  const UsersState();
}

@immutable
class UsersInitial extends UsersState {
  const UsersInitial();
}

@immutable
class UsersLoading extends UsersState {
  const UsersLoading();
}

@immutable
class UsersLoaded extends UsersState {
  const UsersLoaded(this.data);
  final UsersSearchResponse data;
}

@immutable
class UsersError extends UsersState {
  const UsersError(this.error);
  final String error;
}