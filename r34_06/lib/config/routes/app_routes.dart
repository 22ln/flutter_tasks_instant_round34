import 'package:flutter/material.dart';
import 'package:product_shop/presentation/login.dart';
import 'package:product_shop/presentation/home.dart';
import 'package:product_shop/presentation/details.dart';
import 'package:product_shop/presentation/cart.dart';
import 'package:product_shop/presentation/profile_page.dart';
import 'package:product_shop/presentation/search.dart';
import 'package:product_shop/presentation/splash.dart';

class AppRoutes {
  static const String splash = '/'; // ✅ المسار الأساسي
  static const String login = '/login';
  static const String home = '/home';
  static const String details = '/details';
  static const String cart = '/cart';
  static const String profile = '/profile';
  static const String search = '/search';

  static Map<String, WidgetBuilder> routes = {
    splash: (context) => SplashScreen(), // ✅ أول صفحة تظهر هي SplashScreen
    login: (context) => LoginPage(),
    home: (context) => HomePage(),
    details: (context) => DetailsPage(),
    cart: (context) => CartPage(),
    profile: (context) => ProfilePage(),
    search: (context) => SearchPage(),
  };
}
