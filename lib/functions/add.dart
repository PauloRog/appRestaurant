import 'package:app_restaurant_test/models/products.dart';
import 'package:app_restaurant_test/test/list.products.dart';

class Add {
  void addFood(String image, String title, String description, double price) {
    ListProducts.foods.add(Products(
        image: image, title: title, description: description, price: price));
  }

  void addDrink(String image, String title, String description, double price) {
    drinks.add(Products(
        image: image, title: title, description: description, price: price));
  }
}
