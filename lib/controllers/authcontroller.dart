import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  final emailcontroller = TextEditingController().obs;
  final passwordcontroller = TextEditingController().obs;

  void loginAPI() async {
    try {
      final response =
          await http.post(Uri.parse("https://reqres.in/api/login"), body: {
        {
          "email": emailcontroller.value.text,
          "password": passwordcontroller.value.text,
        }
      });

      var data = jsonDecode(response.body());
      print(response.statusCode);
      print(data);
      if (response.statusCode == 200) {
        Get.snackbar("Login Successful", "Logged in");
      } else {
        Get.snackbar("Login Failed", "Check the credentials");
      }
    } catch (e) {
      Get.snackbar("Exception", e.toString());
    }
  }
}
