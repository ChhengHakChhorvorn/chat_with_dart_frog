import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../data/model/user/user_model.dart';

class AppPreference {
  static SharedPreferences _preferences = SharedPreferences.getInstance() as SharedPreferences;

  // * Authentication key
  static const keyAccessToken = 'accessToken';
  static const keyLogin = 'login';
  static const keyUserInfo = "userInfo";

  static Future init() async => _preferences = await SharedPreferences.getInstance();

  // * Set persistent
  static Future saveAccessToken(String accessToken) async {
    await _preferences.setString(keyAccessToken, 'Bearer $accessToken');
  }

  static Future saveLogin(bool loginParam) async {
    await _preferences.setBool(keyLogin, loginParam);
  }

  static Future saveUserInfo(String userInfo) async {
    await _preferences.setString(keyUserInfo, userInfo);
  }

  // * Get persistent
  static String? getAccessToken() {
    return _preferences.getString(keyAccessToken);
  }

  static bool? getLogin() {
    return _preferences.getBool(keyLogin);
  }

  static UserModel? getUserInfo() {
    if (_preferences.getString(keyUserInfo) == null) return null;
    return UserModel.fromJson(jsonDecode(_preferences.getString(keyUserInfo)!));
  }

  // * Clear persistent
  static void clearCredential() {
    _preferences.remove(keyAccessToken);
  }

  static void clearLogin() {
    _preferences.remove(keyLogin);
  }

  // * Clear all persistent
  static void clearAll() async {
    final pref = await SharedPreferences.getInstance();
    pref.clear();
  }
}
