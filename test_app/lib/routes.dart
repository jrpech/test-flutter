import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/app_bar.dart';
import 'package:test_app/blocs/authentication/authentication_bloc.dart';
import 'package:test_app/blocs/tab/tab_bloc.dart';
import 'package:test_app/repositories/user.dart';
import 'package:test_app/screens/app_screen.dart';
import 'package:test_app/screens/card_transactions.dart';
import 'package:test_app/screens/login_screen.dart';
import 'package:test_app/screens/splash_page.dart';

class Routes {
  static const root = "/";
  static const home = "/home";
  static const seachTransactions = "/search";

  static MaterialPageRoute getRoute(RouteSettings settings) {
    //Routes defined to show screens and session valitation.
    switch (settings.name) {
      case Routes.seachTransactions:
        return MaterialPageRoute(
            builder: (_) => CardTransactions(), settings: settings);
      case Routes.home:
        return MaterialPageRoute(
            builder: (_) =>
                BlocBuilder<AuthenticationBloc, AuthenticationState>(
                    builder: (context, state) {
                  if (state is AuthenticationUninitialized) {
                    return SplashPage();
                  }

                  final userRepository =
                      RepositoryProvider.of<UserRepository>(context);

                  return MultiBlocProvider(
                    providers: [
                      BlocProvider<TabBloc>(
                        create: (context) => TabBloc(AppTab.profile),
                      ),
                    ],
                    child: AppScreen(userRepository),
                  );
                }));

      case Routes.root:
        return MaterialPageRoute(
            builder: (_) =>
                BlocBuilder<AuthenticationBloc, AuthenticationState>(
                    builder: (context, state) {
                  if (state is AuthenticationUninitialized) {
                    return SplashPage();
                  }

                  if (state is AuthenticationAuthenticated) {
                    final userRepository =
                        RepositoryProvider.of<UserRepository>(context);
                    return MultiBlocProvider(
                      providers: [
                        BlocProvider<TabBloc>(
                          create: (context) => TabBloc(AppTab.profile),
                        ),
                      ],
                      child: AppScreen(userRepository),
                    );
                  }

                  if (state is AuthenticationUnauthenticated) {
                    final userRepository =
                        RepositoryProvider.of<UserRepository>(context);
                    return LoginScreen(userRepository: userRepository);
                  }
                  return CircularProgressIndicator();
                }));
    }
  }
}
