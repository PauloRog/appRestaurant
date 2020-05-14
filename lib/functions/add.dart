import 'package:app_restaurant_test/models/products.dart';
import 'package:app_restaurant_test/test/list.products.dart';

class Add {
  ListProducts list = ListProducts();

  void addFood(String image, String title, String description, double price) {
    list.foods.add(Products(
        image: image, title: title, description: description, price: price));
  }

  void addDrink(String image, String title, String description, double price) {
    list.drinks.add(Products(
        image: image, title: title, description: description, price: price));
  }
}
