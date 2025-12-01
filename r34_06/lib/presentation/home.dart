import 'package:flutter/material.dart';
import 'package:product_shop/config/routes/app_routes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  int? tappedIndex;
  int? pressedButtonIndex;

  final List<Map<String, dynamic>> products = [
    {
      'name': 'Fresh Apples',
      'price': 25.0,
      'image': 'assets/images/apple.png',
      'description': 'Crisp and juicy fresh apples from local farms.'
    },
    {
      'name': 'Organic Bananas',
      'price': 15.0,
      'image': 'assets/images/banana.png',
      'description': 'Sweet and ripe organic bananas rich in potassium.'
    },
    {
      'name': 'Tomatoes',
      'price': 10.0,
      'image': 'assets/images/tomato.png',
      'description': 'Red and fresh tomatoes perfect for salads and sauces.'
    },
    {
      'name': 'Broccoli',
      'price': 20.0,
      'image': 'assets/images/broccoli.png',
      'description': 'Healthy green broccoli packed with vitamins and fiber.'
    },
    {
      'name': 'Strawberries',
      'price': 30.0,
      'image': 'assets/images/strawberry.png',
      'description': 'Fresh and juicy strawberries perfect for desserts.'
    },
  ];

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2))
          ..forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildAnimatedProductCard(BuildContext context, int index) {
    final product = products[index];
    final animation = CurvedAnimation(
      parent: _controller,
      curve: Interval((index * 0.1), 1.0, curve: Curves.easeOutBack),
    );

    bool isTapped = tappedIndex == index;
    bool isPressedButton = pressedButtonIndex == index;

    return FadeTransition(
      opacity: animation,
      child: ScaleTransition(
        scale: animation,
        child: GestureDetector(
          onTapDown: (_) => setState(() => tappedIndex = index),
          onTapUp: (_) async {
            await Future.delayed(const Duration(milliseconds: 120));
            setState(() => tappedIndex = null);
            Navigator.pushNamed(context, AppRoutes.details,
                arguments: product);
          },
          onTapCancel: () => setState(() => tappedIndex = null),
          child: AnimatedScale(
            scale: isTapped ? 1.05 : 1.0,
            duration: const Duration(milliseconds: 150),
            curve: Curves.easeOutBack,
            child: Card(
              color: Colors.white,
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
              shadowColor: Colors.green.withOpacity(0.3),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        product['image'],
                        height: 80,
                        width: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      product['name'],
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Text(
                      product['description'],
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style:
                          TextStyle(color: Colors.grey[600], fontSize: 12),
                    ),
                    Text(
                      "${product['price']} EGP",
                      style: const TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    AnimatedScale(
                      scale: isPressedButton ? 1.1 : 1.0,
                      duration: const Duration(milliseconds: 150),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: isPressedButton
                              ? Colors.green[800]
                              : Colors.green,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () async {
                          setState(() => pressedButtonIndex = index);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content:
                                  Text("${product['name']} added to cart!"),
                              duration: const Duration(seconds: 1),
                            ),
                          );
                          await Future.delayed(
                              const Duration(milliseconds: 200));
                          setState(() => pressedButtonIndex = null);
                        },
                        child: const Text(
                          "Add to Cart",
                          style: TextStyle(fontSize: 12, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F7F3),
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 0,
        title: const Text(
          'E-Grocery Store',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () => Navigator.pushNamed(context, AppRoutes.search),
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart, color: Colors.white),
            onPressed: () => Navigator.pushNamed(context, AppRoutes.cart),
          ),
          IconButton(
            icon: const Icon(Icons.person, color: Colors.white),
            onPressed: () => Navigator.pushNamed(context, AppRoutes.profile),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.green[700],
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Column(
              children: [
                Image.asset(
                  'assets/images/logo.png', 
                  height: 80,
                ),
                const SizedBox(height: 10),
                const Text(
                  "Welcome to E-Grocery!",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  "Get fresh products delivered to your door ",
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),
              ],
            ),
          ),

          // شبكة المنتجات
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(15),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // كروت جنب بعض
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.75,
              ),
              itemCount: products.length,
              itemBuilder: _buildAnimatedProductCard,
            ),
          ),
        ],
      ),
    );
  }
}
