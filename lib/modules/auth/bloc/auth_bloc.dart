import 'package:admin_panel/server/server.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

// Events
abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class LoginRequested extends AuthEvent {
  final String username;
  final String password;

  const LoginRequested({required this.username, required this.password});

  @override
  List<Object> get props => [username, password];
}

class LogoutRequested extends AuthEvent {
  const LogoutRequested();
}

class CheckAuthStatus extends AuthEvent {
  const CheckAuthStatus();
}

// States
abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthAuthenticated extends AuthState {
  final AuthResponse authResponse;

  const AuthAuthenticated(this.authResponse);

  @override
  List<Object> get props => [authResponse];
}

class AuthError extends AuthState {
  final String message;

  const AuthError(this.message);

  @override
  List<Object> get props => [message];
}

class AuthUnauthenticated extends AuthState {}

// Bloc
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;
  final AuthStorage _authStorage;

  AuthBloc(this._authRepository, this._authStorage) : super(AuthInitial()) {
    on<LoginRequested>(_onLoginRequested);
    on<LogoutRequested>(_onLogoutRequested);
    on<CheckAuthStatus>(_onCheckAuthStatus);
  }

  Future<void> _onCheckAuthStatus(
    CheckAuthStatus event,
    Emitter<AuthState> emit,
  ) async {
    final token = _authStorage.getToken();
    final roles = _authStorage.getUserRoles();
    final accessiblePages = _authStorage.getAccessiblePages();
    final user = _authStorage.getUserData();
    
    if (token != null && token.isNotEmpty && roles.isNotEmpty && user != null) {
      // User has saved session, restore it
      final authResponse = AuthResponse(
        token: token,
        roles: roles,
        accessiblePages: accessiblePages,
        user: user,
      );
      emit(AuthAuthenticated(authResponse));
    } else {
      // No saved session
      emit(AuthUnauthenticated());
    }
  }

  Future<void> _onLoginRequested(
    LoginRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
      final response = await _authRepository.login(
        event.username,
        event.password,
      );

      // Save auth data to storage
      await _authStorage.saveToken(response.token);
      await _authStorage.saveUserRoles(response.roles);
      await _authStorage.saveAccessiblePages(response.accessiblePages);
      await _authStorage.saveUserData(response.user);

      emit(AuthAuthenticated(response));
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> _onLogoutRequested(
    LogoutRequested event,
    Emitter<AuthState> emit,
  ) async {
    try {
      await _authRepository.logout();
      await _authStorage.clearAuthData();
      emit(AuthUnauthenticated());
    } catch (e) {
      // Даже если запрос на сервер не удался, выходим из приложения
      await _authStorage.clearAuthData();
      emit(AuthUnauthenticated());
    }
  }
}
