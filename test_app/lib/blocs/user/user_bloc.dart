import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_app/providers/errors.dart';
import 'package:test_app/providers/payloads/profile_response.dart';
import 'package:test_app/repositories/user.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;

  UserBloc(this.userRepository)
      : assert(userRepository != null),
        super(UserInitial());

  @override
  Stream<UserState> mapEventToState(
    UserEvent event,
  ) async* {
    if (event is FetchRemoteInfo) {
      yield ProfileLoading();

      try {
        ProfileResponse user = await userRepository.getProfile();
        yield ProfileLoaded(user: user);
      } catch (error) {
        if (error is ServerError)
          //yield ProfileErrorLoad(message: ex.body);
          yield ProfileErrorLoad();
        else
          yield ProfileErrorLoad();
      }
    }
  }
}
