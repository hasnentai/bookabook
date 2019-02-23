import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginController {
  static const String _URL = 'http://bookabook.co.za/wp-json/jwt-auth/v1/token';
  SharedPreferences prefs;
  Future<http.Response> login(data) async {
    final http.Response response = await http.post(_URL, body: data);

    return response;
  }

  Future<void> saveUserData(Map<String, dynamic> userInfo) async {
    prefs = await SharedPreferences.getInstance();
    print(userInfo["user_display_name"]);
    prefs.setString("email", userInfo["user_email"]);
    prefs.setString("token", userInfo["token"]);
    prefs.setString("displayName", userInfo["user_display_name"]);

  }
}
