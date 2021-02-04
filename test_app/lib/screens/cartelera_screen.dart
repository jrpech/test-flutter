import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/blocs/authentication/authentication_bloc.dart';

class CarteleraScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CARTELERA"),
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            color: Colors.white,
            onPressed: () async {
              BlocProvider.of<AuthenticationBloc>(context).add(LoggedOut());
              Navigator.of(context).pop();
            },
          )
        ],
      ),
      body: Text("CARTELERA"),
    );
  }
}
