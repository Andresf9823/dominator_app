import 'dart:async';
import 'dart:convert';
import 'package:dominator_app/loggin/domain/user.dart';
import 'package:http/http.dart' as http;

Future<User> getSignInUser(User user) async {
  try {
    final response =
        await http.get(Uri.parse("https://api.chucknorris.io/jokes/random"));
    if (response.statusCode == 200) {
      // print(
      //     " STATUS: ${response.statusCode} \n CONTENT LENGTH: ${response.contentLength} \n HEADERS: ${response.headers}");
      // print("\n BODY: ${response.body}");
      return User.fromJson(jsonDecode(response.body));
    }
    throw (Exception());
  } catch (e) {
    return User();
  }
}
