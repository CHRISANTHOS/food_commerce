import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier{

  final List _shopItems = [
    ['Cheese Burger', 2860, 'images/cheeseBurger.jpg', Colors.green],
    ['Pizza', 7000, 'images/cheeseBurger.jpg', Colors.blue],
    ['Parfait', 4000, 'images/cheeseBurger.jpg', Colors.brown],
    ['Ice cream', 1500, 'images/cheeseBurger.jpg', Colors.yellowAccent]
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

  String calculateTotal(){
    double totalPrice = 0;
    for(int i = 0; i < _cartItems.length; i++){
      totalPrice += double.parse(_cartItems[i][1]);
    }
    return totalPrice.toStringAsFixed(2);
  }

}