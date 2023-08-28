import 'package:flutter/material.dart';

import 'coffee.dart';

class CoffeeShop extends ChangeNotifier{
  // coffee for sale list 
  final List<Coffee> _shop = [
    // black coffee
    Coffee(
      name: "Long Black",
      price: "4.10",
      imagePath: "lib/images/black.jpg"
    ),

    // latte
    Coffee(
      name: "Latte",
      price: "3.98",
      imagePath: "lib/images/latte.jpg"
    ),

    // espresso
    Coffee(
      name: "Espresso",
      price: "5.40",
      imagePath: "lib/images/black.jpg"
    ),

    // iced coffee
    Coffee(
      name: "Iced Coffee",
      price: "3.10",
      imagePath: "lib/images/latte.jpg"
    ),
  ];

  // user cart
  final List<Coffee> _userCart = [];

  // get coffee list 
  List<Coffee> get coffeeShop => _shop;

  // get user cart
  List<Coffee> get userCart => _userCart;

  // add item to cart 
  void addItemToCart(Coffee coffee){
    _userCart.add(coffee);
    notifyListeners();
  }

  // remove item from cart
  void removeItemFromCart(Coffee coffee){
    _userCart.remove(coffee);
    notifyListeners();
  }
}