part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class FetchRemoteInfo extends UserEvent {}

class FetchLocalInfo extends UserEvent {}

class FetchInfoCard extends UserEvent {}
