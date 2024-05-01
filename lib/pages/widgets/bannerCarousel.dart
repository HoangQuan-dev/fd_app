import 'package:FoodDeli/values/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

Widget bannerCarousel() {
  return CarouselSlider(
    options: CarouselOptions(
      autoPlay: true,
      enableInfiniteScroll: true,
      viewportFraction: 1,
    ),
    items: [
      ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(5.0)),
        child: Stack(
          children: <Widget>[
            Image.network(
              'https://res.cloudinary.com/dzgdczkjk/image/upload/v1698200601/Spicy_Fried_Chicken_xgveuu.png',
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
      ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(5.0)),
        child: Stack(
          children: <Widget>[
            Image.network(
              'https://res.cloudinary.com/dzgdczkjk/image/upload/v1698200601/Potato_Sandwich_pnfa5y.png',
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
      ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(5.0)),
        child: Stack(
          children: <Widget>[
            Image.network(
              'https://res.cloudinary.com/dzgdczkjk/image/upload/v1698200595/Grilled_Beef_Burger_Whopper_Jr_mocdid.png',
              fit: BoxFit.cover,
            ),
          ],
        ),
      )
    ],
  );
}
