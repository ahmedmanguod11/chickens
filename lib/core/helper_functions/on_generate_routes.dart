
import 'package:chickens/features/auth/presentation/views/auth_view.dart';
import 'package:chickens/features/home/presentaion/views/home_view.dart';
import 'package:chickens/features/on_boarding/presentation/views/on_bording.dart';
import 'package:chickens/features/splash/presentation/views/splash_view.dart';
import 'package:flutter/material.dart';


Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (context) => const SplashView());
    // case CheckoutView.routeName:
    //   return MaterialPageRoute(
    //       builder: (context) => CheckoutView(
    //             cartEntity: settings.arguments as CartEntity,
    //           ));
    case AuthView.routName:
      return MaterialPageRoute(builder: (context) => const AuthView());
    case HomeView.routName:         
      return MaterialPageRoute(builder: (context) => const HomeView());
    case OnBording.routeName:
      return MaterialPageRoute(builder: (context) => const OnBording());
    case SplashView.routeName:
      return MaterialPageRoute(builder: (context) => const SplashView());
    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
