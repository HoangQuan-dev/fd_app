import 'package:FoodDeli/values/app_colors.dart';
import 'package:flutter/material.dart';

AppBar customAppBarNoCart(BuildContext context, String title, Color color) {
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
  );
}
