import 'dart:convert';

import 'package:fluttertest/main.dart';
import 'package:fluttertest/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefService {

  User user;
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<User> read(String key) async {
    final prefs = await _prefs;
    print(prefs.getString(key));
    return User.fromJson(json.decode(prefs.getString(key)));
  }

  save(String key, value) async {
    final prefs = await _prefs;
    prefs.setString(key, json.encode(value));
  }

  Future<List<User>> getAllUsers() async {
    final SharedPreferences prefs = await _prefs;
    var jsonEncoded = prefs.getString("user");
    if (jsonEncoded == null) {
      print("JSON ENCODE NULL");
      return [];
    }

    // List items = jsonDecode(jsonEncoded);
    
    var list = UserDataList.fromJson(json.decode(jsonEncoded));
    return list.items;
  }

   Future<bool> saveAllUser(User user) async {
    final SharedPreferences prefs = await _prefs;
    List<User> listUser;
    listUser = await sharedPrefService.getAllUsers() ?? [];
    listUser.add(user);
    var json = jsonEncode(listUser.map((e) => e.toJson()).toList());
    return prefs.setString("user", json);

  }


}

class UserDataList{
  UserDataList();

  List<User> _items;

  List<User> get items => _items;

  set items(List<User> items) => _items = items;

  UserDataList.fromJson(json) {
    if (json != null) {
      _items = new List<User>();
      
      json.forEach((v) {
        var a = User.fromJson(v);
        _items.add(a);
      });
    }
  }

  // List toJson() {
  //   if (this._items != null) {
  //     return this._items.map((v) => v.toJson()).toList();
  //   }
  //   return [];
  // }
}
