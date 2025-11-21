import 'package:chickens/features/auth/presentation/views/login_view.dart';
import 'package:chickens/features/auth/presentation/views/signup_view.dart';
import 'package:chickens/features/on_boarding/presentation/views/on_bording.dart';
import 'package:chickens/features/splash/presentation/views/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:chickens/features/home/presentaion/views/home_view.dart';
Route<dynamic> onGenerateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (context) => const SplashView());
    case SignupView.routeName:
      return MaterialPageRoute(builder: (context) => const SignupView());
      case HomeView.routName:
      return MaterialPageRoute(builder: (context) => const HomeView());
      case LoginView.routName:
      return MaterialPageRoute(builder: (context) => const LoginView());
    case OnBording.routeName:
      return MaterialPageRoute(builder: (context) => const OnBording());
    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
