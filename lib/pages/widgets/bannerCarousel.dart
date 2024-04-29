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
            Image.asset(
              '${AppAssets.banners}/banner1.jpg',
              fit: BoxFit.fitHeight,
            ),
          ],
        ),
      ),
      ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(5.0)),
        child: Stack(
          children: <Widget>[
            Image.asset(
              '${AppAssets.banners}/banner2.jpg',
              fit: BoxFit.fitHeight,
            ),
          ],
        ),
      ),
      ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(5.0)),
        child: Stack(
          children: <Widget>[
            Image.asset(
              '${AppAssets.banners}/banner3.jpg',
              fit: BoxFit.fitHeight,
            ),
          ],
        ),
      )
    ],
  );
}
