import 'package:flutter/material.dart';
import 'package:flutterrestapi2/screens/auth/auth_screen.dart';
import 'package:get/get.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: AuthScreen(),));
}
