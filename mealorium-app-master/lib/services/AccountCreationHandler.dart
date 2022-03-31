import 'package:flutter/cupertino.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class AccountCreationHandler with ChangeNotifier {
  int currentPageIndex = 0;
  PhoneNumber? phoneNnumber;

  void setPhoneNumber(PhoneNumber number) {
    phoneNnumber = number;
    notifyListeners();
  }

  void setCurrentPage(int page) {
    currentPageIndex = page;
    notifyListeners();
  }

  int getPage() {
    return currentPageIndex;
  }
}
