import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:r34_01/screens/product_details_page.dart';
import 'package:r34_01/widgets/favourite_page/favourite_provider.dart';

class FavouritePage extends StatelessWidget {
  const FavouritePage({super.key});

  @override
  Widget build(BuildContext context) {
    final favourite = Provider.of<FavouriteProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Favorite",
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
            itemCount: favourite.items.length,
            itemBuilder: (context, index) {
              final product = favourite.items[index];

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

                      Text(
                        product.title,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),

                      Text(
                        "\$${product.price.toStringAsFixed(2)}",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                        icon: Icon(Icons.arrow_forward),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ProductDetailsPage(product: product),
                            ),
                          );
                        },
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
                onPressed: () {},
                child: Text(
                  "Add All To Cart",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
