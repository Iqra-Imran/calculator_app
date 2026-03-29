// lib/models/cart.dart
import 'package:calculator/cart_task_with_api/models/cart_product_model.dart';
import 'package:flutter/foundation.dart';

class CartProvider with ChangeNotifier {
  final Map<int, ProductModel> _items = {};

  Map<int, ProductModel> get items => _items;

  double get totalPrice => _items.values
      .fold(0.0, (sum, item) => sum + item.price);

  void add(ProductModel product) {
    _items.putIfAbsent(product.id, () => product);
    notifyListeners();
  }

  void remove(ProductModel product) {
    _items.remove(product.id);
    notifyListeners();
  }
}
