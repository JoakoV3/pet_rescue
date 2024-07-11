part of 'auth_bloc.dart';

sealed class AuthEvent {
  const AuthEvent();
}

final class _AuthenticationStatusChanged extends AuthEvent {
  const _AuthenticationStatusChanged(this.status);

  final AuthStatus status;
}

final class AuthenticationLogoutRequested extends AuthEvent {}