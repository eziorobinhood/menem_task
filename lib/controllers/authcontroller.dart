import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:menem/views/posts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  final emailcontroller = TextEditingController().obs;
  final passwordcontroller = TextEditingController().obs;

  Future<void> sendLoginData() async {
    var map = new Map<String, dynamic>();
    //username:ldv16043@cdfaq.com
    //password: Institute@123
    map['username'] = emailcontroller.value.text;
    map['password'] = passwordcontroller.value.text;

    http.Response response = await http.post(
      Uri.parse("https://dev-menem-api.up.railway.app/api/v1/auth/login"),
      body: map,
    );

    if (response.statusCode == 200) {
      Get.snackbar("Login Successful", "Logging you in");
      Get.to(PostsScreen());
      String token = jsonDecode(response.body())["access_token"];
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('access_token', token);
    } else {
      Get.snackbar("Login Failed", "Enter valid credentials");
    }
  }
}
