import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/app_bar.dart';
import 'package:test_app/blocs/tab/tab_bloc.dart';
import 'package:test_app/repositories/user.dart';
import 'package:test_app/screens/cartelera_screen.dart';
import 'package:test_app/screens/profile_screen.dart';
import 'package:test_app/widgets/tab_selector.dart';

class AppScreen extends StatelessWidget {
  final UserRepository userRepository;
  AppScreen(this.userRepository);

  Widget getBodyWidget(AppTab tab) {
    switch (tab) {
      case AppTab.profile:
        return ProfileScreen(userRepository);
      case AppTab.cartelera:
        return CarteleraScreen();
    }
    return ProfileScreen(userRepository);
  }

  @override
  Widget build(BuildContext context) {
    final tabBloc = BlocProvider.of<TabBloc>(context);
    return BlocBuilder<TabBloc, AppTab>(
      builder: (context, activeTab) {
        return Scaffold(
          body: getBodyWidget(activeTab),
          bottomNavigationBar: TabSelector(
            activeTab: activeTab,
            onTabSelected: (tab) => tabBloc.add(UpdateTab(tab)),
          ),
        );
      },
    );
  }
}
