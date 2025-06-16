import 'package:flutter/material.dart';
import 'package:myapp/model/food.dart';

class Shop extends ChangeNotifier {
  final List<Food> _foodMenu = [
    Food(
        name: 'Tuna Sushi',
        price: '4500MMK',
        imagePath: 'asset/tuna.png',
        rating: '4.5'),
    Food(
        name: 'Salmon Sashimi',
        price: '5000MMK',
        imagePath: 'asset/sushi.png',
        rating: '4.9'),
    Food(
        name: 'Seaweed Sushi',
        price: '3500MMK',
        imagePath: 'asset/sushi1.png',
        rating: '4.1')
  ];

  List<Food> _cart = [];

  List<Food> get foodMenu => _foodMenu;
  List<Food> get cart => _cart;

  void addToCart(Food foodItem, int quantity) {
    for (int i = 0; i < quantity; i++) {
      _cart.add(foodItem);
    }
    notifyListeners();
  }

  void removeFromCart(Food food) {
    _cart.remove(food);
    notifyListeners();
  }
}
