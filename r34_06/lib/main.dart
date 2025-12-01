import 'package:flutter/material.dart';
import 'package:product_shop/routes/app_routes.dart';

void main() {
  runApp(EGroceryApp());
}

class EGroceryApp extends StatelessWidget {
  const EGroceryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'eGrocery',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.green,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      initialRoute: AppRoutes.splash,
      routes: AppRoutes.routes,
    );
  }
}
