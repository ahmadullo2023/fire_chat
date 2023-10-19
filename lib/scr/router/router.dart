import 'package:flutter/material.dart';
import '../pages/home.dart';
import '../pages/sign_in.dart';
import '../pages/sign_up.dart';
import '../pages/splash.dart';



class AppRouter {
  static final AppRouter _generators = AppRouter._init();

  static AppRouter get router => _generators;

  AppRouter._init();

  Route? onGenerator(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return navigator(const SplashPage());
      case "signIn":
        return navigator(const SignIn());
      case "home":
        return navigator(const HomePage());
      case "signUp":
        return navigator(const SignUp());
    }
    return null;
  }

  navigator(Widget widget) {
    return MaterialPageRoute(
      builder: (context) => widget,
    );
  }
}