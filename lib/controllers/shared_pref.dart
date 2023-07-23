import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static late SharedPreferences pref;

  static storeLocation(String city) async {
    pref = await SharedPreferences.getInstance();
    pref.setString("location", city);
  }

  static Future<String> getLocation() async {
    pref = await SharedPreferences.getInstance();
    return pref.getString("location")!;
  }
}
