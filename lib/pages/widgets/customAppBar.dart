import 'package:FoodDeli/pages/cart/cart.dart';
import 'package:FoodDeli/values/app_colors.dart';
import 'package:flutter/material.dart';

AppBar customAppBar(BuildContext context, String title, Color color) {
  return AppBar(
    foregroundColor: AppColors.whiteColor,
    title: Text(
      title,
      style: const TextStyle(
        fontSize: 25.0,
        fontWeight: FontWeight.bold,
      ),
    ),
    centerTitle: true,
    backgroundColor: color,
    actions: <Widget>[
      Stack(
        children: <Widget>[
          IconButton(
            iconSize: 30.0,
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Cart()),
              );
            },
          ),
          Positioned(
            right: 7,
            top: 7,
            child: Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 255, 52, 38),
                borderRadius: BorderRadius.circular(6),
              ),
              constraints: const BoxConstraints(
                minWidth: 14,
                minHeight: 14,
              ),
              child: const Text(
                '10', // number of items in the cart
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 8,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    ],
  );
}
