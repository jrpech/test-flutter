import 'package:flutter/material.dart';
import 'package:test_app/keys.dart';
import 'package:test_app/models/TabItem.dart';

class Constants {
/* GENERAL CONSTANTS */
  static final String logoURL = 'logo-test.png';

/*  TABS SHOWING ON THE APP MAIN SCREEN.
    IN CASE IF YOU WANT ADD MORE, 
    YOU NEED ADD THE NEW ITEM HERE ADD THE ENUM ON AppTab */

  static final List<TabItem> tabs = [
    TabItem(title: "Perfil", icon: Icons.home, key: AppKeys.perfilTab),
    TabItem(title: "Cartelera", icon: Icons.list, key: AppKeys.carteleraTab),
  ];

  /* API PROVIDER CONSTANTS */
  static final String backendServer = 'https://stage-api.cinepolis.com/';

  //The next constants are used on the login request
  static final String countryCode = "MX";
  static final String grantType = "password";
  static final String clientId = "IATestCandidate";
  static final String clientSecret = "c840457e777b4fee9b510fbcd4985b68";
}
