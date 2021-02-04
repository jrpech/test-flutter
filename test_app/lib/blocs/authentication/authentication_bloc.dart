import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:test_app/repositories/user.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository userRepository;

  /*@override
  AuthenticationState get initialState => AuthenticationUninitialized();*/

  AuthenticationBloc({@required this.userRepository})
      : assert(userRepository != null),
        super(null);

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is AppStarted) {
      final bool hasToken = await userRepository.hasToken();
      final String userName = await userRepository.getUser();

      if (hasToken) {
        userRepository.setToken();
        yield AuthenticationAuthenticated(userName: userName);
      } else {
        yield AuthenticationUnauthenticated();
      }
    }

    if (event is LoggedIn) {
      yield AuthenticationLoading();
      await userRepository.persistToken(event.token);
      //await userRepository.setUser(event.username);
      yield AuthenticationAuthenticated(userName: event.username);
    }

    if (event is LoggedOut) {
      yield AuthenticationLoading();
      await userRepository.deleteToken();
      //await userRepository.deleteUser();
      yield AuthenticationUnauthenticated();
    }
  }
}
