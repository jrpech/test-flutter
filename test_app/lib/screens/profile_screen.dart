import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/blocs/user/user_bloc.dart';
import 'package:test_app/providers/payloads/profile_response.dart';
import 'package:test_app/repositories/user.dart';
import 'package:test_app/screens/profile_info.dart';

class ProfileScreen extends StatelessWidget {
  final UserRepository userRepository;
  ProfileScreen(this.userRepository);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Perfil")),
        body: BlocProvider<UserBloc>(
            create: (context) =>
                UserBloc(userRepository)..add(FetchRemoteInfo()),
            child: BlocBuilder<UserBloc, UserState>(builder: (context, state) {
              if (state is ProfileLoaded) {
                return ProfileInfo(ProfileResponse(firstName: "JORGE"));
              }

              if (state is ProfileLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (state is ProfileErrorLoad) {
                return Text("Ocurrio un error al obtener la información.");
              }

              return Text("");
            })));
  }
}
