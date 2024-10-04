import 'dart:convert';
import 'package:blott/src/core/utils/app_const/app_strings.dart';
import 'package:blott/src/features/auth/domain/dtos/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthLocalSource {
  User? getUser();
  Future<void> saveUser(User? user);
}

class AuthLocalSourceImpl extends AuthLocalSource {
  AuthLocalSourceImpl(this.prefs);
  final SharedPreferences prefs;

  @override
  User? getUser() {
    final userJson = prefs.getString(AppStrings.USER);
    if (userJson == null) {
      return null;
    }
    return User.fromJson(json.decode(userJson));
  }

  @override
  Future<void> saveUser(User? user) async {
    try {
      await prefs.setString(
          AppStrings.USER, const JsonEncoder().convert(user?.toJson()));
    } catch (e) {
      print("Failed to save user");
      print(e.toString());
    }
  }

  // set to false if the person has not set pin the app already
  // @override
  // Future<void> isTransactionPinSet(bool isPinSet) async {
  //   await prefs.setBool(AppStrings.FIRST_VISIT, isPinSet);
  // }

  // @override
  // bool? checkFirstVisit() {
  //   return prefs.getBool(
  //     AppStrings.FIRST_VISIT,
  //   );
  // }
}
