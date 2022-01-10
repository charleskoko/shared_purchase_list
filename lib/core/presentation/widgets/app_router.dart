import 'package:flutter/material.dart';
import 'package:shared_purchase_list/authentication/login/presentation/authentication_page.dart';
import 'package:shared_purchase_list/authentication/registration/presentation/registration_page.dart';
import 'package:shared_purchase_list/core/shared/routes.dart';
import 'package:shared_purchase_list/home/home_page.dart';
import 'package:shared_purchase_list/on_boarding/on_boarding_page.dart';
import 'package:shared_purchase_list/splash/presentation/splash_page.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splash:
        return MaterialPageRoute(builder: (_) => const Splashpage());
      case Routes.onBoarding:
        return MaterialPageRoute(builder: (_) => const OnBoardingPage());
      case Routes.authentication:
        return MaterialPageRoute(builder: (_) => const AuthenticationPage());
      case Routes.registration:
        return MaterialPageRoute(builder: (_) => const RegistrationPage());
      case Routes.home:
        return MaterialPageRoute(builder: (_) => const HomePage());
      default:
        return MaterialPageRoute(builder: (_) => const Splashpage());
    }
  }
}
