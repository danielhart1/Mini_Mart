import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert'; 

class CartProvider extends ChangeNotifier {
  List<Map<String, dynamic>> _cartItems = [];

  List<Map<String, dynamic>> get cartItems => _cartItems;

  Future<void> initCart() async {
    await _loadCart();
  }


  void addToCart(Map<String, dynamic> product) {
    _cartItems.add(product);
    _saveCart();
    notifyListeners();
  }

  void removeFromCart(int index) {
    _cartItems.removeAt(index);
    _saveCart();
    notifyListeners();
  }

  void updateQuantity(int index, bool increase) {
    if (increase) {
      _cartItems[index]['quantity']++;
    } else if (_cartItems[index]['quantity'] > 1) {
      _cartItems[index]['quantity']--;
    }
    _saveCart();
    notifyListeners();
  }

  double getTotalPrice() {
  return _cartItems.fold(0.0, (sum, item) {
    final parsedPrice = double.tryParse(
      item['price'].replaceAll(RegExp(r'[^\d.]'), ''), // 
    ) ?? 0.0;
    
    return sum + (parsedPrice * item['quantity']); 
  });
}

  Future<void> _saveCart() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('cart', jsonEncode(_cartItems)); 
  }

  Future<void> _loadCart() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString('cart');
    if (data != null) {
      _cartItems = List<Map<String, dynamic>>.from(jsonDecode(data));
      notifyListeners();
    }
  }
}