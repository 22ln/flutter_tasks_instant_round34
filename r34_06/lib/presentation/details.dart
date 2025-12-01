import 'package:flutter/material.dart';
import 'package:product_shop/config/routes/app_routes.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // استقبال بيانات المنتج من الصفحة السابقة
    final product =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      appBar: AppBar(
        title: Text(product['name'], style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.green,
        iconTheme: IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart, color: Colors.white),
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.cart);
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(product['image'], height: 180),
            ),
            SizedBox(height: 20),
            Text(
              product['name'],
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.green[700]),
            ),
            SizedBox(height: 10),
            Text(
              "${product['price']} EGP",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.green[800],
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 20),
            Text(
              product['description'],
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.grey[700]),
            ),
            Spacer(),
            ElevatedButton.icon(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("${product['name']} added to cart!")),
                );
                Navigator.pushNamed(context, AppRoutes.cart);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: EdgeInsets.symmetric(horizontal: 80, vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              icon: Icon(Icons.add_shopping_cart, color: Colors.white),
              label: Text(
                "Add to Cart",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
