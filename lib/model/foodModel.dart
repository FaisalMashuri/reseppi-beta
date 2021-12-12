import 'package:reseppi_beta/constant/app_constant.dart';

class FoodModel {
  String name;
  double price;
  String description;
  double rating;
  String image;

  FoodModel({required this.description, required this.image, required this.name, required this.price, required this.rating});
}

final List<FoodModel> foodList = [
  FoodModel(
    name: "Cream and Corn Soup",
    price: 29.99,
    rating: 4.5,
    image: "https://source.unsplash.com/200x200/?asparagus",
    description: LOREM_IPSUM,
  ),
  FoodModel(
    name: "Chicken Sharma",
    price: 12.99,
    rating: 4.5,
    image: "https://source.unsplash.com/200x200/?chicken-meat",
    description: LOREM_IPSUM,
  ),
  FoodModel(
    name: "Cream and Corn Soup",
    price: 29.99,
    rating: 4.5,
    image: "https://source.unsplash.com/200x200/?portobello",
    description: LOREM_IPSUM,
  ),
  FoodModel(
    name: "Cream and Corn Soup",
    price: 29.99,
    rating: 4.5,
    image: "https://source.unsplash.com/200x200/?soup",
    description: LOREM_IPSUM,
  ),
];