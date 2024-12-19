import 'package:shared_preferences/shared_preferences.dart';

import '../models/responses/auth_response_model.dart';

class AuthLocalDatasource {
  // save data to local (application)
  Future<void> saveAuthData(AuthResponseModel model) async {
    final pref = await SharedPreferences.getInstance();
    await pref.setString('auth', model.toString());
  }

  // remove data local
  Future<void> removeAuthData() async {
    final pref = await SharedPreferences.getInstance();
    pref.remove('auth');
  }

  // save auth token
  Future<String> getToken() async {
    final pref = await SharedPreferences.getInstance();
    final authJson = pref.getString('auth') ?? '';
    final authData = AuthResponseModel.fromJson(authJson);
    return authData.jwt ?? '';
  }

  // get user
  Future<User> getUser() async {
    final pref = await SharedPreferences.getInstance();
    final authJson = pref.getString('auth') ?? '';
    final authData = AuthResponseModel.fromJson(authJson);
    return authData.user!;
  }
}
