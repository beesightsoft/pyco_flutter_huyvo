

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:fluttertest/user.dart';

class ProfileService {

  Future<User> getProfle() async {
    // final response = await http.get("https://randomuser.me/api/0.4/?randomapi");
    final response = await http.get("http://192.168.1.110:3000/api/");

    Map<String,dynamic> parsedJson = json.decode(response.body);

    if(response.statusCode >= 200 || response.statusCode <499) {
      // var apiResponse = User.fromJson(parsedJson["results"][0]["user"]);
      var apiResponse = User.fromJson(parsedJson["results"][0]);
      return apiResponse;
    } else {
      print("GET PROFILE FAIL");
      return null;
    }
  }


}