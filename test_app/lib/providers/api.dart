import 'dart:async';
import 'dart:convert';
import 'package:test_app/constants.dart';
import 'package:test_app/providers/payloads/auth_response.dart';
import 'package:test_app/providers/payloads/profile_response.dart';

import 'api_base.dart';

class ApiProvider extends ApiBase {
  /* Endpoints */
  static const String _AUTH = 'v2/oauth/token';
  static const String _PROFILE = 'v1/members/profile?country_code=MX';

  ApiProvider(String endPoint, {timeout = const Duration(seconds: 30)})
      : super(endPoint, timeout: timeout);

  Future<AuthResponse> login(String user, String password) async {
    //I use a map cause the service require a form-data
    print("login");
    var request = new Map<String, dynamic>();
    request['country_code'] = Constants.countryCode;
    request['username'] = user;
    request['password'] = password;
    request['grant_type'] = Constants.grantType;
    request['client_id'] = Constants.clientId;
    request['client_secret'] = Constants.clientSecret;

    //this.headers['api_key'] = 'stage_HNYh3RaK_Test';
    final response = await this.post(_AUTH, request);
    print(response.body);
    Map<String, dynamic> json = jsonDecode(response.body.toString());
    AuthResponse authResponse = AuthResponse.fromJson(json);
    return authResponse;
  }

  Future<ProfileResponse> getProfile() async {
    final response = await this.get(_PROFILE);
    Map<String, dynamic> json = jsonDecode(response.body.toString());
    ProfileResponse profileResponse = ProfileResponse.fromJson(json);
    return profileResponse;
  }
}
