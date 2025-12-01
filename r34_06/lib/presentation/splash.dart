import 'package:flutter/material.dart';
import 'dart:async';
import 'package:product_shop/config/routes/app_routes.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // بعد 3 ثواني ينتقل تلقائيًا لصفحة تسجيل الدخول
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, AppRoutes.login);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // اللوجو أو صورة التطبيق
            Image.asset(
              'assets/images/logo.png',
              height: 120,
            ),
            SizedBox(height: 30),
            Text(
              'Welcome to our',
              style: TextStyle(fontSize: 22, color: Colors.black87),
            ),
            Text(
              'E-Grocery',
              style: TextStyle(
                fontSize: 26,
                color: Colors.green[700],
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 40),
            CircularProgressIndicator(
              color: Colors.green,
            ),
          ],
        ),
      ),
    );
  }
}
