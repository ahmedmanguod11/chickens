
import 'package:chickens/features/auth/presentation/views/auth_view.dart';

import 'package:chickens/features/best_selling_chickens/presentation/views/best_selling_view.dart';
import 'package:chickens/features/checkout/presentation/views/checkout_view.dart';
import 'package:chickens/features/home/domain/entites/cart_entity.dart';
import 'package:chickens/features/home/presentaion/views/main_view.dart';
import 'package:chickens/features/on_boarding/presentation/views/on_bording.dart';
import 'package:chickens/features/splash/presentation/views/splash_view.dart';
import 'package:flutter/material.dart';


Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (context) => const SplashView());
    case CheckoutView.routeName:
      return MaterialPageRoute(
          builder: (context) => CheckoutView(
                cartEntity: settings.arguments as CartEntity,
              ));
    case AuthView.routName:
      return MaterialPageRoute(builder: (context) => const AuthView());
         
    case MainView.routeName:         
      return MaterialPageRoute(builder: (context) => const MainView());
    case OnBording.routeName:
      return MaterialPageRoute(builder: (context) => const OnBording());
    // ignore: unreachable_switch_case
    case SplashView.routeName:
      return MaterialPageRoute(builder: (context) => const SplashView());

   case BestSellingView.routeName:
      return MaterialPageRoute(builder: (context) => const BestSellingView());

      // ignore: unreachable_switch_case
      case CheckoutView.routeName:         
      return MaterialPageRoute(builder: (context) =>  CheckoutView(cartEntity: settings.arguments as CartEntity,));

    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
