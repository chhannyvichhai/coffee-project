import 'package:coffeetute/components/coffee_tile.dart';
import 'package:coffeetute/models/coffee.dart';
import 'package:coffeetute/models/coffee_shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {

  // remove item from cart
  void removeFromCart(Coffee coffee){
    Provider.of<CoffeeShop>(context, listen: false).removeItemFromCart(coffee);
  }

  // pay button tapped
  void payNow(){
    /*
    fill out your payment service here
    */
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeShop>(
      builder: (context, value, child) =>SafeArea(
      child: Column(
        children: [
         const Text("Your Carts", 
          style: TextStyle(fontSize: 20,),
        ),

        // list of cart items
        Expanded(
          child: ListView.builder(
            itemCount: value.userCart.length,
            itemBuilder: (context, index) {
          // get individual cart items
          Coffee eachCoffee = value.userCart[index];

          // return coffe tile
          return CoffeeTile(
            coffee: eachCoffee,
             onPressed: () => removeFromCart(eachCoffee),
              icon: Icon(Icons.delete));
          
        },
         ),
         ),

         // pay button
         GestureDetector(
          onTap: payNow,
           child: Container(
            padding: const EdgeInsets.all(25),
            width: double.infinity,
            decoration: BoxDecoration(color: Colors.brown, 
            borderRadius: BorderRadius.circular(12),
            ),
            child: const Center(
              child: Text("Pay Now", 
              style: TextStyle(color: Colors.white),
              ),
            ),
           ),
         ),
        ],
        ),
        ),
    );
  }
}