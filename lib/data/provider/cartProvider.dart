import 'package:flutter/material.dart';

import '../model/product.model.dart';

class CartProvider extends ChangeNotifier {
  final List<Product> _items = [];

  List<Product> get items => _items;

  Future<void> add(Product item) async {
    var prodItem = _items.firstWhere((prod) => prod.id == item.id);

    if (prodItem.id != '') {
      prodItem.quantity += 1;
    } else {
      item.quantity = 1;
      _items.add(item);
    }
    notifyListeners();
  }

  void remove(Product item) {
    _items.remove(item);
    notifyListeners();
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }

  double get totalAmount {
    var total = 0.0;
    for (var item in _items) {
      total += item.price! * item.quantity;
    }
    return total;
  }

  int get itemCount => _items.length;
}
