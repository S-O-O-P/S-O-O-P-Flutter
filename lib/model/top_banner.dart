import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

Widget buildCarouselSlider(List pickList) {
  return CarouselSlider(
    items: pickList.map((item) {
      return Builder(
        builder: (context) {
          return Container(
            margin: EdgeInsets.all(6.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              image: DecorationImage(
                image: NetworkImage(item['thumbnail']),
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      );
    }).toList(),

    //Slider Container properties
    options: CarouselOptions(
      height: 300.0,
      enlargeCenterPage: true,
      autoPlay: true,
      aspectRatio: 9 / 16,
      autoPlayCurve: Curves.fastOutSlowIn,
      enableInfiniteScroll: true,
      autoPlayAnimationDuration: Duration(milliseconds: 800),
      viewportFraction: 0.8,
    ),
  );
}