part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState({
    this.validUser,
    this.validPassword,
  });

  final bool validUser;
  final bool validPassword;

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {
  LoginInitial({bool validUser, bool validPassword})
      : super(validUser: true, validPassword: true);

  @override
  List<Object> get props => [validUser, validPassword];
}

class LoginLoading extends LoginState {
  LoginLoading({bool validUser, bool validPassword})
      : super(validUser: validUser, validPassword: validPassword);

  LoginLoading.fromLoginState(LoginState state)
      : super(validPassword: state.validPassword, validUser: state.validUser);
}

class LoginFailure extends LoginState {
  final String error;

  const LoginFailure({this.error, bool validUser, bool validPassword});

  LoginFailure.fromLoginState(this.error, LoginState state)
      : super(validPassword: state.validPassword, validUser: state.validUser);

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'LoginFailure { error: $error }';
}
