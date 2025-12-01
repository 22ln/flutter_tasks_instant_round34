import 'package:flutter/material.dart';
import 'package:r34_01/widgets/explore_page/box_product.dart';

class ExplorPage extends StatelessWidget {
  const ExplorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Find Products",
          style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              SizedBox(
                height: 57,
                width: 360,
                child: SearchBar(
                  leading: Icon(Icons.search),
                  hintText: "Search Store",
                ),
              ),
              SizedBox(height: 15),

              BoxProduct(
                image1: "assets/images/vegetables.png",
                boxName1: "Frash Fruits& Vegetable",
                image2: "assets/images/oil.png",
                boxName2: "Cooking Oil& Ghee",
              ),
              SizedBox(height: 10),

              BoxProduct(
                image1: "assets/images/fish.png",
                boxName1: "Meat & Fish",
                image2: "assets/images/bread.png",
                boxName2: "Bakery & Snacks",
              ),
              SizedBox(height: 10),

              BoxProduct(
                image1: "assets/images/eggs.png",
                boxName1: "Dairy &Eggs",
                image2: "assets/images/snacks.png",
                boxName2: "Beverages",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
