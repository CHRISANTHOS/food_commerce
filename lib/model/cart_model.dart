import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier{

  final List _shopItems = [
    ['Cheese Burger', 2860, 'images/cheeseBurger.jpg', Colors.green, 1],
    ['Pizza', 7000, 'images/cheeseBurger.jpg', Colors.blue, 1],
    ['Parfait', 4000, 'images/cheeseBurger.jpg', Colors.brown, 1],
    ['Ice cream', 1500, 'images/cheeseBurger.jpg', Colors.yellowAccent, 1]
  ];

  final List _cartItems = [];

  get cartItems => _cartItems;

  get shopItems => _shopItems;

  void addToCart(int index){
    _cartItems.add(_shopItems[index]);
    notifyListeners();
  }

  void removeItem(int index){
    _cartItems.removeAt(index);
    notifyListeners();
  }

  bool checkExist(int index){
   return _cartItems.contains(_shopItems[index]);
  }

  String calculateTotal(){
    double totalPrice = 0;
    for(int i = 0; i < _cartItems.length; i++){
      totalPrice += _cartItems[i][1] * _cartItems[i][4];
    }
    return totalPrice.toStringAsFixed(2);
  }

}