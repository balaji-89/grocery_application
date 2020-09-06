import 'package:flutter/material.dart';

class ProvidesImages with ChangeNotifier {
  List<Map<String, dynamic>> carouselImages = [
    {
      'imagePath': 'assets/images/carousel/Fruits.jpg',
      'offerPercentage': 6,
      'category': 'Fresh Fruits',
    },
    {
      'imagePath': 'assets/images/carousel/Vegetables.jpg',
      'offerPercentage': 3,
      'category': 'Fresh Vegetables',
    },
    {
      'imagePath': 'assets/images/carousel/Beverages.jpg',
      'offerPercentage': 5,
      'category': 'Beverages',
    },
    {
      'imagePath': 'assets/images/carousel/Egg.jpg',
      'offerPercentage': 7,
      'category': 'Daily Essentials Eggs and Dairy',
    },
    {
      'imagePath': 'assets/images/carousel/Nuts.jpg',
      'offerPercentage': 3,
      'category': 'Nuts and Snacks',
    },
  ];


  List<Map<String, String>> shopByCategory = [
    {
      'imageUrl': 'assets/images/category_graphics/Vegetables_category.png',
      'category': 'Vegetables',
    },
    {
      'imageUrl': 'assets/images/category_graphics/Milk_category.png',
      'category': 'Dairy Products',
    },
    {
      'imageUrl': 'assets/images/category_graphics/Beverage_category.png',
      'category': 'Beverages',
    },
    {
      'imageUrl': 'assets/images/category_graphics/FruitsBowl_category.jpg',
      'category': 'Fruits',
    },
    {
      'imageUrl': 'assets/images/category_graphics/Meat_category.png',
      'category': 'Meat',
    },
    {
      'imageUrl': 'assets/images/category_graphics/Egg_category.jpg',
      'category': 'Groceries',
    },


  ];


}
