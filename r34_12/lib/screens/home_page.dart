import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:market_app/source/data.dart';

import '../entity/product.dart';
import '../widgets/product_card.dart';
import '../widgets/section_header.dart';
import '../screens/product_details_page.dart';


class HomePage extends StatefulWidget { 
  const HomePage({super.key});
   @override State<HomePage> createState() => _HomePageState(); 
  }

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  String _currentAddress = "Getting location...";

  final Data data = Data(); // كلاس Data الجديد
  List<Product> offers = [];
  List<Product> bestSelling = [];

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
    _loadProducts();
  }

  Future<void> _loadProducts() async {
    List<Product> products = await data.getAllProducts();
    setState(() {
      // نفترض: أول 3 منتجات للعروض، والباقي للأكثر مبيعاً
      offers = products.take(3).toList();
      bestSelling = products.length > 3 ? products.sublist(3, products.length) : [];
    });
  }

  Future<void> _getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      setState(() => _currentAddress = "Location disabled");
      return;
    }

    LocationPermission permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.deniedForever ||
        permission == LocationPermission.denied) {
      setState(() => _currentAddress = "Permission denied");
      return;
    }

    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);

    Placemark place = placemarks[0];
    setState(() {
      _currentAddress = "${place.locality}, ${place.country}";
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final cardWidth = screenWidth * 0.45;

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        onTap: (index) => setState(() => _selectedIndex = index),
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag_outlined), label: "Shop"),
          BottomNavigationBarItem(icon: Icon(Icons.explore_outlined), label: "Explore"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined), label: "Cart"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: "Favorite"),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: "Account"),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("assets/images/logo.png", height: 50, fit: BoxFit.contain),
                const SizedBox(height: 10),

                // 🔹 Location
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.location_on, color: Colors.black, size: 20),
                    const SizedBox(width: 5),
                    Flexible(
                      child: Text(
                        _currentAddress,
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                //  Search bar
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      icon: Padding(
                        padding: EdgeInsets.only(left: 12.0),
                        child: Icon(Icons.search, color: Colors.black),
                      ),
                      hintText: "Search Store",
                      border: InputBorder.none,
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                //  Banner
                Container(
                  height: 150.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: const DecorationImage(
                      image: AssetImage('assets/images/banner.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                //  Offers Section
                const SectionHeader(title: "Exclusive Offer"),
                _buildHorizontalCardList(offers, cardWidth),

                const SizedBox(height: 25),

                //  Best Selling Section
                const SectionHeader(title: "Best Selling"),
                _buildHorizontalCardList(bestSelling, cardWidth),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHorizontalCardList(List<Product> products, double cardWidth) {
    return SizedBox(
      height: 250,
      child: products.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return Padding(
                  padding: EdgeInsets.only(right: index == products.length - 1 ? 0 : 15),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductDetailsPage(product: product),
                        ),
                      );
                    },
                    child: ProductCard(product: product, width: cardWidth),
                  ),
                );
              },
            ),
    );
  }
}
