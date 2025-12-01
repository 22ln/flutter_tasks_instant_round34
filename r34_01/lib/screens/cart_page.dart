import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:r34_01/screens/accept_order_screen.dart';
import 'package:r34_01/widgets/cart_page/cart_provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Cart",
          style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Divider(height: 1, thickness: 1, color: Colors.grey),
        ),
      ),

      body: Stack(
        children: [
          ListView.builder(
            itemCount: cart.items.length,
            itemBuilder: (context, index) {
              final product = cart.items[index];

              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Image.network(
                          product.image,
                          height: 80,
                          width: 80,
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            product.title,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Row(
                            children: [
                              IconButton(
                                icon: Icon(Icons.remove, color: Colors.green),
                                onPressed: () => cart.decreaseQty(product),
                              ),
                              Text(
                                cart.getQuantity(product).toString(),
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              IconButton(
                                icon: Icon(Icons.add, color: Colors.green),
                                onPressed: () => cart.increaseQty(product),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              icon: Icon(Icons.close),
                              onPressed: () {
                                cart.remove(product);
                              },
                            ),
                            Text(
                              "\$${product.price.toStringAsFixed(2)}",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),

                  Divider(height: 1, thickness: 0.3, color: Colors.grey),
                  SizedBox(height: 5),
                ],
              );
            },
          ),

          Positioned(
            top: 560,
            right: 30,
            left: 30,
            child: Container(
              height: 70,
              padding: EdgeInsets.all(9),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AcceptOrderScreen(),
                    ),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Go to Checkout",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    Text(
                      "\$${cart.totalPrice.toStringAsFixed(2)}",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
