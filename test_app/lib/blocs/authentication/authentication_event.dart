part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class AppStarted extends AuthenticationEvent {}

class LoggedIn extends AuthenticationEvent {
  final AuthResponse data;

  const LoggedIn({@required this.data});

  @override
  List<Object> get props => [data];

  @override
  String toString() => 'LoggedIn { token: $data }';
}

class LoggedOut extends AuthenticationEvent {}
