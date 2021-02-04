import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_app/blocs/authentication/authentication_bloc.dart';
import 'package:test_app/constants.dart';
import 'package:test_app/providers/api.dart';
import 'package:test_app/providers/errors.dart';
import 'package:test_app/providers/local.dart';
import 'package:test_app/repositories/user.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepository userRepository;
  final AuthenticationBloc authenticationBloc;

  final RegExp _emailRegExp = RegExp(
    r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  );

  LoginBloc({
    this.userRepository,
    this.authenticationBloc,
  })  : assert(userRepository != null),
        assert(authenticationBloc != null),
        super(LoginInitial(
          validPassword: true,
          validUser: true,
        ));

  LoginState get initialState => LoginInitial(
        validPassword: true,
        validUser: true,
      );

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginButtonPressed) {
      bool validUser = this._isUserValid(event.username);
      bool validPassword = this._isPasswordValid(event.password);

      if (validPassword && validUser) {
        yield LoginLoading.fromLoginState(state);

        try {
          UserRepository userRepository = UserRepository(LocalProvider());
          final response = await userRepository.authenticate(
              username: event.username, password: event.password);

          authenticationBloc.add(LoggedIn(data: response));

          yield LoginInitial(
              validPassword: this._isPasswordValid(event.password),
              validUser: this._isPasswordValid(event.username));
        } catch (error) {
          if (error is ServerError) {
            yield LoginFailure.fromLoginState(error.body, state);
            return;
          }

          yield LoginFailure.fromLoginState(
              "Ocurrio un error al obtener la respuesta del servidor.", state);
        }
      } else {
        yield LoginFailure.fromLoginState(
            "Usuario y/o Contraseña invalido.", state);
      }
    }
  }

  bool _isUserValid(String email) {
    return _emailRegExp.hasMatch(email);
  }

  bool _isPasswordValid(String password) {
    return password.length > 0;
  }
}
