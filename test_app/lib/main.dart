import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/blocs/authentication/authentication_bloc.dart';
import 'package:test_app/constants.dart';
import 'package:test_app/providers/api.dart';
import 'package:test_app/providers/local.dart';
import 'package:test_app/repositories/user.dart';
import 'package:test_app/routes.dart';

void main() async {
  ApiProvider api = ApiProvider(Constants.backendServer);
  LocalProvider local = LocalProvider();

  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  final userRepository = UserRepository(local);

  runApp(MultiRepositoryProvider(
    providers: [
      RepositoryProvider<UserRepository>(
        create: (context) => UserRepository(local),
      ),
    ],
    child: MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticationBloc>(
          create: (context) {
            return AuthenticationBloc(
                userRepository: RepositoryProvider.of<UserRepository>(context))
              ..add(AppStarted());
          },
        ),
      ],
      child: App(
        userRepository: userRepository,
      ),
    ),
  ));
}

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

class App extends StatelessWidget {
  final UserRepository userRepository;

  App({
    Key key,
    @required this.userRepository,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: Routes.getRoute,
      navigatorObservers: [routeObserver],
      debugShowCheckedModeBanner: false,
    );
  }
}
