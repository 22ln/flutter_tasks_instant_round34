import 'dart:convert';

import '../core/api/api.dart';
import '../core/utils/pastebin dart api/usecases/show_paste.dart';
import '../entity/product.dart';
import '../model/product_model.dart';

abstract class DataRepository {
  Future<List<Product>> getAllProducts();
  List<Product> searchproduct({required String name, String? category});
  List<Product> topSold({required List<Product> products});
  List<Product> topViewed({required List<Product> products});
}

class Data extends DataRepository {
  List<Product> allProducts = []; // نخزن المنتجات بعد  API

  @override
  Future<List<Product>> getAllProducts() async {
    List<Product> products = [];
    try {
      String response = await showPaste(pasteKey: Api.storeAPI);
      List<dynamic> json = jsonDecode(response);
      for (var element in json) {
        products.add(ProductModel.fromJson(element));
      }
      allProducts = products; // نخزن المنتجات
    } catch (e) {
      print("Error fetching products: $e");
      allProducts = [];
    }
    return products;
  }

  @override
  List<Product> searchproduct({required String name, String? category}) {
    if (allProducts.isEmpty) return []; // لو القائمة فاضية، رجع قائمة فارغة

    return allProducts.where((product) {
      final matchesName = product.title.toLowerCase().contains(name.toLowerCase());
      final matchesCategory = category != null
          ? product.category.toLowerCase() == category.toLowerCase()
          : true;
      return matchesName && matchesCategory;
    }).toList();
  }

  @override
  List<Product> topSold({required List<Product> products}) {
    List<Product> sorted = List.from(products);
    // ترتيب حسب عدد المبيعات (sold)
    sorted.sort((a, b) => b.sold.compareTo(a.sold));
    return sorted;
  }

  @override
  List<Product> topViewed({required List<Product> products}) {
    List<Product> sorted = List.from(products);
    // ترتيب حسب عدد المشاهدات (views)
    sorted.sort((a, b) => b.views.compareTo(a.views));
    return sorted;
  }
}
