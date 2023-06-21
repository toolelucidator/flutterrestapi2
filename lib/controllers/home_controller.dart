import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';


class HomeController extends GetxController {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Rxn<String> locationData = Rxn();
  String get name =>
      "${locationData.value}";

  @override
  void onInit(){
    super.onInit();
    accesSharedPrefsData();
  }
  accesSharedPrefsData() async {
    final SharedPreferences prefs = await _prefs;
    var token = prefs.getString('token');
    var userName =prefs.getString('name');
    locationData.value  = userName;
    print("User Name");
    print(locationData.value!+"User Name");
  }

}

