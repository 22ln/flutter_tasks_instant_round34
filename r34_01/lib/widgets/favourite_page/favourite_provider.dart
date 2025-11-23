import 'package:flutter/widgets.dart';
import 'package:r34_01/entities/product_entity.dart';

class FavouriteProvider with ChangeNotifier {
  final List<ProductEntity> items = [];

  List<ProductEntity> get getItems => items;

  void addToFavorite(ProductEntity product) {
    items.add(product);
    notifyListeners();
  }

  void removeFavorite(ProductEntity product) {
    items.removeWhere((item) => item.id == product.id);
    notifyListeners();
  }
  bool isFavourite(ProductEntity product) {
    // We check if any product in the list has the same ID as the given product
    return items.any((item) => item.id == product.id);
  }
}
