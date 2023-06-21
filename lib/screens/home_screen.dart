import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controllers/home_controller.dart';
import 'auth/auth_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        TextButton(
            onPressed: () async {
              final SharedPreferences? prefs = await _prefs;
              prefs?.clear();
              Get.offAll(AuthScreen());
            },
            child: Text(
              'Logout',
              style: TextStyle(color: Colors.white),
            ))
      ]),
      body: Obx(
            () => SafeArea(
          child: Center(
            child: Column(
              children: [
                Text('Welcome home'),
                SizedBox(
                  height: 20,
                ),
                Text(homeController.name),
                TextButton(
                    onPressed: () async {
                      final SharedPreferences prefs = await _prefs;
                      print(prefs.get('name'));
                      print(prefs.get('token'));
                    },
                    child: Text('print token'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
