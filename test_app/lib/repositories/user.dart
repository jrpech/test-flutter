import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_app/constants.dart';
import 'package:test_app/providers/api.dart';
import 'package:test_app/providers/errors.dart';
import 'package:test_app/providers/local.dart';
import 'package:test_app/providers/payloads/auth_response.dart';
import 'package:test_app/providers/payloads/profile_response.dart';

class UserRepository {
  final ApiProvider provider = new ApiProvider(Constants.backendServer);
  final LocalProvider localProvider;

  UserRepository(this.localProvider);

  static const String _persistKey = "user_token";
  static const String _persistTypeAuth = "type_token";
  static const String _persistUserKey = "user_username";

  Future<AuthResponse> authenticate({
    String username,
    String password,
  }) async {
    AuthResponse response = await provider.login(username, password);
    print(response);
    return response;
  }

  Future<ProfileResponse> getProfile() async {
    ProfileResponse response;
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult != ConnectivityResult.none) {
      try {
        provider.token = await getPersistedToken();
        provider.typeAuth = await getPersistedTypeToken();
        print(provider.token);
        response = await provider.getProfile();
        print(response);

        try {
          localProvider.deleteUser();
          await localProvider.saveUser(response);
        } catch (ex) {
          print("ERROR: " + ex.toString());
        }
      } on TimeoutException catch (_) {
        response = await localProvider.existUser();
        print("TimeoutException");
      } on ServerError catch (_) {
        response = await localProvider.existUser();
        print("ServerError");
      } catch (error) {
        print(error);
        throw error;
      }
    } else {
      print("Connectivity none");
      response = await localProvider.existUser();
      print(response);
    }

    return response;
  }

  Future<void> deleteToken() async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    await storage.remove(_persistKey);
    return;
  }

  Future<void> persistToken(String token) async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    await storage.setString(_persistKey, token);
    return;
  }

  Future<void> persistType(String typeToken) async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    await storage.setString(_persistTypeAuth, typeToken);
    return;
  }

  Future<bool> hasToken() async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    String value = storage.getString(_persistKey);
    return value != null;
  }

  Future<String> getPersistedToken() async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    return storage.getString(_persistKey);
  }

  Future<String> getPersistedTypeToken() async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    return storage.getString(_persistTypeAuth);
  }

  void setToken() async {
    provider.token = await this.getPersistedToken();
  }

  void setUser(String username) async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    await storage.setString(_persistUserKey, username);
  }

  Future<String> getUser() async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    return storage.getString(_persistUserKey);
  }

  Future<void> deleteUser() async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    await storage.remove(_persistUserKey);
  }
}
