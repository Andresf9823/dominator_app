import 'package:dominator_app/loggin/domain/user.dart';
import 'package:dominator_app/loggin/infrastructure/get_user_sign_in.dart';

bool signIn(User user) {
  getSignInUser(user).then((value) => {user = value});
  return user.signed;
}
