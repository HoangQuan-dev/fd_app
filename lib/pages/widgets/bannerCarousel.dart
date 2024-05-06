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
              'https://res.cloudinary.com/dzgdczkjk/image/upload/v1714421380/banner2_f2mfqg.jpg',
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
              'https://res.cloudinary.com/dzgdczkjk/image/upload/v1714421349/banner1_rkzl8o.jpg',
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
              'https://res.cloudinary.com/dzgdczkjk/image/upload/v1714421381/banner3_wbal2v.jpg',
              fit: BoxFit.cover,
            ),
          ],
        ),
      )
    ],
  );
}
