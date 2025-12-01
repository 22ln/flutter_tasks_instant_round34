import 'package:r34_16/src/core/routes/routes.dart';
import 'package:flutter/material.dart';

class OurNewItem extends StatelessWidget {
  const OurNewItem({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> newItems = [
      {'title': 'Medium Spice Pack', 'subtitle': 'Onion, Oil, Salt', 'price': '\$35'},
      {'title': 'Healthy Fruits', 'subtitle': 'Apple, Banana, Orange', 'price': '\$25'},
      {'title': 'Breakfast Bundle', 'subtitle': 'Bread, Eggs, Milk', 'price': '\$30'},
      {'title': 'Vegetable Mix', 'subtitle': 'Carrot, Tomato, Peas', 'price': '\$20'},
      {'title': 'Party Essentials', 'subtitle': 'Juice, Snacks, Cake', 'price': '\$60'},
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Our New Items',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Text(
                  'View All',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),

          // Horizontal list
          SizedBox(
            height: 160,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: newItems.length,
              itemBuilder: (context, index) {
                final item = newItems[index];

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(15),
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        RoutesName.ournewitemdetails, // make sure to define this route
                        arguments: item,
                      );
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Container(
                        width: 140,
                        color: Colors.grey,
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              item['title']!,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              item['subtitle']!,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.white70,
                              ),
                            ),
                            Text(
                              item['price']!,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
