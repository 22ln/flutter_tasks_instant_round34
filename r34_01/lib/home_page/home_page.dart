import 'package:flutter/material.dart';
import 'package:r34_01/entities/product_entity.dart';
import 'package:r34_01/home_page/widgets/drawer.dart';
import 'package:r34_01/home_page/widgets/home_category.dart';
import 'package:r34_01/home_page/widgets/slider.dart';
import 'package:r34_01/widgets/name_style.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Column(
          children: [
            NameStyle(fontSize: 22),
            Text(
              "Your Daily Needs",
              style: TextStyle(fontSize: 10, color: Colors.grey),
            ),
          ],
        ),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            AppBar(title: Text("Menu", style: TextStyle(fontSize: 15))),
            DrawerList(label: "Invited Friend", onPressed: () {}),
            DrawerList(label: "About Us", onPressed: () {}),
            DrawerList(label: "FAQs", onPressed: () {}),
            DrawerList(label: "Terms & Conditions", onPressed: () {}),
            DrawerList(label: "Help Center", onPressed: () {}),
            DrawerList(label: "Rate this App", onPressed: () {}),
            DrawerList(label: "Privacy Policy", onPressed: () {}),
            DrawerList(label: "Contact Us", onPressed: () {}),
            SizedBox(height: 30),
            DrawerList(label: "Logout", onPressed: () {}),
          ],
        ),
      ),

      body: ListView(
        children: [
          Padding(padding: const EdgeInsets.all(8.0), child: SliderContainer()),

          HomeCategory(
            categoryLabel: "Popular Packs",
            products: [
              Product(
                title: 'Bundle Pack',
                subtitle: 'Onion, Oil, Salt',
                price: '\$35',
                offPrice: '\$50.32',
                image: 'assets/images/packs.png',
                typeProduct: 'Vegetables',
              ),
              Product(
                title: 'Bundle Pack',
                subtitle: 'Onion, Oil, Salt',
                price: '\$35',
                offPrice: '\$50.32',
                image: 'assets/images/packs.png',
                typeProduct: 'Vegetables',
              ),
              Product(
                title: 'Bundle Pack',
                subtitle: 'Onion, Oil, Salt',
                price: '\$35',
                offPrice: '\$50.32',
                image: 'assets/images/packs.png',
                typeProduct: 'Vegetables',
              ),
            ],
          ),
          SizedBox(height: 10),
          HomeCategory(
            categoryLabel: "Ice Creams",
            products: [
              Product(
                title: 'Ice Cream Bananas',
                subtitle: '800 gm',
                price: '\$13',
                offPrice: '\$15',
                image: 'assets/images/ice_cream.png',
                typeProduct: 'Ice Cream',
              ),
              Product(
                title: 'Ice Cream Bananas',
                subtitle: '800 gm',
                price: '\$13',
                offPrice: '\$15',
                image: 'assets/images/ice_cream.png',
                typeProduct: 'Ice Cream',
              ),
              Product(
                title: 'Ice Cream Bananas',
                subtitle: '800 gm',
                price: '\$13',
                offPrice: '\$15',
                image: 'assets/images/ice_cream.png',
                typeProduct: 'Ice Cream',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
