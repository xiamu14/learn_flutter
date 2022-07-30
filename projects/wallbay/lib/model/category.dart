import 'package:flutter/material.dart';

class Category {
  String name;
  AssetImage image;

  Category({required this.name, required this.image});
}

List<Category> categoryList = [
  Category(
    image: const AssetImage("assets/image/abstract.jpg"),
    name: 'Abstract',
  ),
  Category(
    image: const AssetImage("assets/image/car.jpg"),
    name: 'Cars',
  ),
  Category(
    image: const AssetImage("assets/image/city.jpg"),
    name: 'City',
  ),
  Category(
    image: const AssetImage("assets/image/minimalist.jpg"),
    name: 'Minimalist',
  ),
  Category(
    image: const AssetImage("assets/image/space.jpg"),
    name: 'Space',
  ),
  Category(
    image: const AssetImage("assets/image/sport.jpg"),
    name: 'Sport',
  ),
];
