part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserInitial extends UserState {}

class ProfileLoading extends UserState {}

class ProfileLoaded extends UserState {
  final ProfileResponse user;
  ProfileLoaded({this.user});
}

class ProfileErrorLoad extends UserState {}
