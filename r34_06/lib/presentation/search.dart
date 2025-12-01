import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  List<String> products = [
    'Fresh Apples',
    'Organic Bananas',
    'Tomatoes',
    'Broccoli',
    'Carrots',
    'Strawberries',
    'Spinach',
    'Cucumbers',
    'Bell Peppers',
  ];
  List<String> searchResults = [];

  void _onSearch(String query) {
    setState(() {
      searchResults = products
          .where((item) => item.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Products'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              onChanged: _onSearch,
              decoration: InputDecoration(
                hintText: 'Search for a product...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: searchResults.isEmpty
                  ? const Center(
                      child: Text(
                        'No results found',
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                    )
                  : ListView.builder(
                      itemCount: searchResults.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: Icon(Icons.shopping_bag_outlined),
                          title: Text(searchResults[index]),
                          onTap: () {
                            // تقدر تربطها بصفحة التفاصيل بعدين
                          },
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
