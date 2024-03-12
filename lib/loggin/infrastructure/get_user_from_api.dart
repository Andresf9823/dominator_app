import 'dart:async';
import 'dart:convert';
import 'package:dominator_app/loggin/domain/user.dart';
import 'package:http/http.dart' as http;

Future<User> getUserFromApi() async {
  try {
    final response =
        await http.get(Uri.parse("https://api.chucknorris.io/jokes/random"));
    // print(
    //     " STATUS: ${response.statusCode} \n CONTENT LENGTH: ${response.contentLength} \n HEADERS: ${response.headers} \nBODY: ${response.body}");
    if (response.statusCode == 200) return User.fromJson(jsonDecode(response.body));
    throw(Exception());
  } catch (e) {
    return User();
  }
}
