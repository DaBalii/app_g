import 'package:flutter/material.dart';
import 'package:zon_gneapp/model/user.dart';

class UserProvider extends ChangeNotifier {
  User? user;

  UserProvider({
    this.user = null,
  });

  void setUser(User newUser) {
    user = newUser;
    notifyListeners();
  }
}