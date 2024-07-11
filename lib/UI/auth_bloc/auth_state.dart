part of 'auth_bloc.dart';

class AuthState extends Equatable {
  const AuthState._({this.status = AuthStatus.unknown});

  const AuthState.unknown() : this._();

  final AuthStatus status;
  // final User user;

  @override
  List<Object> get props => [];
}
