import 'package:flutter/widgets.dart';
import 'package:r34_01/entities/product_entity.dart';

class CartProvider with ChangeNotifier {
  final List<ProductEntity> items = [];
  final Map<ProductEntity, int> quantities = {};

  List<ProductEntity> get getItems => items;

  int getQuantity(ProductEntity product) {
    return quantities[product] ?? 1;
  }

  void increaseQty(ProductEntity product) {
    quantities[product] = getQuantity(product) + 1;
    notifyListeners();
  }

  void decreaseQty(ProductEntity product) {
    quantities[product] = getQuantity(product) - 1;
    notifyListeners();
  }

  void addToCart(ProductEntity product) {
    if (!items.contains(product)) {
      items.add(product);
      quantities[product] = 1;
    }
    notifyListeners();
  }

  void remove(ProductEntity product) {
    quantities.remove(product);
    items.remove(product);
    notifyListeners();
  }

  double get totalPrice {
    double total = 0;
    for (var p in items) {
      total += p.price * getQuantity(p);
    }
    return total;
  }
}
