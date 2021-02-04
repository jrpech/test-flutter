import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/blocs/authentication/authentication_bloc.dart';
import 'package:test_app/blocs/login/login_bloc.dart';
import 'package:test_app/repositories/user.dart';
import 'package:test_app/screens/login_form.dart';

class LoginScreen extends StatelessWidget {
  final UserRepository userRepository;

  LoginScreen({Key key, @required this.userRepository})
      : assert(userRepository != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) {
          return LoginBloc(
            authenticationBloc: BlocProvider.of<AuthenticationBloc>(context),
            userRepository: userRepository,
          );
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(child: LoginForm()),
        ),
      ),
    );
  }

  /*@override
  State<LoginScreen> createState() => _LoginScreenState();*/
}

/*class _LoginScreenState extends State<LoginScreen> {
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
    return BlocProvider(
      create: (context) {
        return LoginBloc(BlocProvider.of<AuthenticationBloc>(context));
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: ,
        ),
      ),
    );
  }
}
*/
