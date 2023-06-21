import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutterrestapi2/models/user_model.dart';
import 'package:flutterrestapi2/utils/api_urls.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../screens/home_screen.dart';

class RegisterController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  void onInit() {
    super.onInit();
    isUserLoggedIn().then((value) {
      if (value) {
        Get.off(HomeScreen());
      }
    });
  }

  Future<void> registerWithEmail() async {
    try {
      var headers = {'Content-Type': 'application/json'};
      var url =
          Uri.parse(ApiUrls.baseUrl + ApiUrls.authEndpoints.registerEmail);
      Map body = {
        'name': nameController.text,
        'email': emailController.text.trim(),
        'password': passwordController.text
      };

      http.Response response =
          await http.post(url, body: jsonEncode(body), headers: headers);

      if (response.statusCode == 200) {
        final res = jsonDecode(response.body) as Map<String, dynamic>;

        UserModel model = UserModel.fromJson(res);
        print(model.data?.token);

        if (model.code == 0) {
          var token = model.data?.token;
          var userName = model.data?.name;
          //TODO Add name to shared preferences

          print(userName);
          print(token);
          final SharedPreferences? prefs = await _prefs;

          await prefs?.setString('token', token!);
          await prefs?.setString('name', userName!);
          await prefs?.setBool('logged', true!);

          nameController.clear();
          emailController.clear();
          passwordController.clear();
          Get.off(HomeScreen());
        } else {
          throw model.message ?? "Unknown Error Occured";
        }
      } else {
        throw "Unknown Error Occured";
      }
    } catch (e) {
      Get.back();
      print("Error Occured");
      print(e);
    }
  }

  Future<bool> isUserLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool("logged") ?? false;
  }
}
