import 'package:chickens/features/auth/presentation/views/auth_view.dart';
import 'package:chickens/features/home/presentaion/views/home_view.dart';
import 'package:chickens/features/on_boarding/presentation/views/on_bording.dart';
import 'package:chickens/features/products/presentation/views/products_view.dart';
import 'package:chickens/features/profile/presentation/views/profile_view.dart';
import 'package:chickens/features/shopping/presentation/views/shopping_view.dart';
import 'package:chickens/features/splash/presentation/views/splash_view.dart';
import 'package:flutter/material.dart';
Route<dynamic> onGenerateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (context) => const SplashView());

    case OnBording.routeName:
      return MaterialPageRoute(builder: (context) => const OnBording());

      case AuthView.routName:
      return MaterialPageRoute(builder: (context) => const AuthView());

      case HomeView.routName:
      return MaterialPageRoute(builder: (context) => const HomeView());

      case ProductsView.routName:
      return MaterialPageRoute(builder: (context) => const ProductsView());

       case ShoppingView.routName:
      return MaterialPageRoute(builder: (context) => const ShoppingView());

      case ProfileView.routName:
      return MaterialPageRoute(builder: (context) => const ProfileView());
      
    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
