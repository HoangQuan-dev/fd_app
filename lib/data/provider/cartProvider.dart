import 'package:flutter/material.dart';

import '../model/product.model.dart';

class CartProvider with ChangeNotifier {
  final List<Product> _items = [];

  List<Product> get items => _items;

  Future<void> add(Product item) async {
    var index = _items.indexWhere((product) => product.id == item.id);
    print(index);
    if (index != -1) {
      _items[index].quantity += item.quantity;
    } else {
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
