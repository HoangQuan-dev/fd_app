import 'dart:convert';

import 'package:FoodDeli/data/model/user.model.dart';
import 'package:shared_preferences/shared_preferences.dart';


Future<bool> saveUser(User objUser, String token) async {
  try {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String strUser = jsonEncode(objUser);
    prefs.setString('user', strUser);
    prefs.setString('token', token);
    print("Luu thanh cong: $strUser");
    print('Luu thanh cong token: $token');
    return true;
  } catch (e) {
    print(e);
    return false;
  }
}