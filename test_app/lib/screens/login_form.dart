import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/blocs/login/login_bloc.dart';

class LoginForm extends StatefulWidget {
  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _onLoginButtonPressed() {
      BlocProvider.of<LoginBloc>(context).add(
        LoginButtonPressed(
          username: _usernameController.text,
          password: _passwordController.text,
        ),
      );
    }

    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginLoading) {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text('Validando credenciales...'),
              backgroundColor: Colors.blue,
            ),
          );
        }

        if (state is LoginFailure) {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text('${state.error}'),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
        _onLoginButtonPressed() {
          BlocProvider.of<LoginBloc>(context).add(
            LoginButtonPressed(
              username: _usernameController.text,
              password: _passwordController.text,
            ),
          );
        }

        return Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Image.asset("imgs/logo-test.png"),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Text("Ingresa sus credenciales para acceder"),
              new Container(
                width: MediaQuery.of(context).size.width * 0.85,
                child: TextFormField(
                  decoration: InputDecoration(labelText: 'Usuario'),
                  keyboardType: TextInputType.emailAddress,
                  controller: _usernameController,
                ),
              ),
              new Container(
                width: MediaQuery.of(context).size.width * 0.85,
                child: TextFormField(
                  decoration: InputDecoration(labelText: 'password'),
                  controller: _passwordController,
                  obscureText: true,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              RaisedButton(
                color: Colors.blue,
                onPressed:
                    state is! LoginLoading ? _onLoginButtonPressed : null,
                child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.75,
                    child: Text('Ingresar',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white))),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
            ]));
      }),
    );
  }
}
