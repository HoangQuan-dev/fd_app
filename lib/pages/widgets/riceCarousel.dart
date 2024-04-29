import 'package:FoodDeli/values/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

Widget riceCarousel() {
  return CarouselSlider(
    options: CarouselOptions(
      height: 180.0,
      autoPlay: false,
      enableInfiniteScroll: true,
      viewportFraction: 0.4,
    ),
    items: AppAssets.products.map((prod) {
      return Builder(
        builder: (BuildContext context) {
          return Container(
            width: 130.0,
            margin: const EdgeInsets.symmetric(horizontal: 5.0),
            decoration: const BoxDecoration(color: Colors.white),
            child: Column(
              children: <Widget>[
                Expanded(
                  child: AspectRatio(
                    aspectRatio: 1 / 1,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Image.asset(
                        prod.imagePath,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Text(
                  prod.name,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 14.0),
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Icon(
                      Icons.star,
                      color: Color.fromARGB(255, 249, 226, 24),
                    ),
                    Icon(
                      Icons.favorite_outline,
                      color: Colors.red,
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      );
    }).toList(),
  );
}
