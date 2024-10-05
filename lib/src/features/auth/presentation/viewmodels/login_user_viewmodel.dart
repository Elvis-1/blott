import 'package:flutter/material.dart';
import 'package:blott/src/config/service_locators.dart';
import 'package:blott/src/config/utils/local/auth_local_source.dart';
import 'package:blott/src/features/auth/domain/dtos/model/user.dart';

class LoginUserViewModel extends ChangeNotifier {
  LoginUserViewModel();

  bool activateBtn = false;

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();

    super.dispose();
  }

  checkTextfield() {
    activateBtn = false;
    notifyListeners();
    if (firstNameController.text.isNotEmpty &&
        lastNameController.text.isNotEmpty) {
      activateBtn = true;
      notifyListeners();
    }
  }

  Future<void> loginUser() async {
    final firstName = firstNameController.text.trim();

    final lastName = lastNameController.text.trim();

    User user = User(firstName: firstName, lastName: lastName);

    ///  save
    await sl<AuthLocalSource>().saveUser(user);
    firstNameController.clear();
    lastNameController.clear();

    ///
  }
}
