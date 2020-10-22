import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class SharedPrefrence {
  Future<bool> setToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString("token", token);
  }

  Future<String> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("token") ?? '';
  }

  Future<bool> setUserId(String userId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString("user_id", userId);
  }

  Future<String> getUserId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("user_id") ?? '';
  }

  Future<bool> setName(String name) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString("user_name", name);
  }

  Future<String> getName() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("user_name") ?? '';
  }

  Future<bool> setLoggedIn(bool status) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setBool("logged_in", status);
  }

  Future<bool> getLogedIn() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool("logged_in") ?? false;
  }
}