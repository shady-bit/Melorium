import 'package:flutter/cupertino.dart';
import 'package:mealorium/validations/ValidationItem.dart';

class ProfileDetailsValidation with ChangeNotifier {
  ValidationItem _fullName = ValidationItem(null, null);
  ValidationItem _email = ValidationItem(null, null);

  ValidationItem get fullName => _fullName;
  ValidationItem get email => _email;

  bool get isvalid {
    if (_fullName.value != null) {
      if (_email.value != null) {
        return true;
      } else {
        return true;
      }
    } else {
      return false;
    }
  }

  void changeName(String name) {
    if (name.length < 1) {
      _fullName = ValidationItem(null, "Enter your full Name");
    } else {
      _fullName = ValidationItem(name, null);
    }
    notifyListeners();
  }

  void changeEmail(String email) {
    if (email.length > 0) {
      if (RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(email)) {
        _email = ValidationItem(email, null);
      } else {
        _email = ValidationItem(null, "Invalid Email");
      }
    }
    notifyListeners();
  }
}
