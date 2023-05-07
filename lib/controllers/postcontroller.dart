import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PostController extends GetxController {
  Future<void> getPosts() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('access_token');

    http.Response response = await http.get(
        Uri.parse(
            "https://dev-menem-api.up.railway.app/api/v1/post/get_all_posts"),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        });

    if (response.statusCode == 200) {
      Get.snackbar("Statuus code", "${response.statusCode}");
    } else {
      Get.snackbar("Login Failed", "Enter valid credentials");
    }
  }
}
