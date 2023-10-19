import 'package:flutter/cupertino.dart';


class ProFunc extends ChangeNotifier{
  String? errorMessage = "";


  String? emailIn(value) {
    if (value != null && !RegExp(r".{6,}@gmail.com").hasMatch(value)) {
      return "enter your email correctly";
    }
    return null;
  }
  String? passwordIn(value) {
    if (value != null && !RegExp(r".{8,}").hasMatch(value)) {
      return 'at least 8 characters';
    }
    return null;
  }


  String? nameUp(value) {
    if (value != null && !RegExp(r".{3,}").hasMatch(value)) {
      return 'at least 3 characters';
    }
    return null;
  }
  String? emailUp(value) {
    if (value != null && !RegExp(r".{6,}@gmail.com").hasMatch(value)) {
      return "enter your email correctly";
    }
    return null;
  }
  String? passwordUp(value) {
    if (value != null && !RegExp(r".{8,}").hasMatch(value)) {
      return 'at least 8 characters';
    }
    return null;
  }
}