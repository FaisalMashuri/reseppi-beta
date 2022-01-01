import 'package:reseppi_beta/constant/app_constant.dart';

class FoodModel {
  String name;
  String description;
  String image;
  List? ingredient;
  FoodModel(
      {required this.description,
      required this.image,
      required this.name,
});
}

final List<FoodModel> foodList = [
  FoodModel(
    name: "Cream and Corn Soup",
    image: "https://source.unsplash.com/200x200/?asparagus",
    description: LOREM_IPSUM,
  ),
  FoodModel(
    name: "Chicken Sharma",
    image: "https://source.unsplash.com/200x200/?chicken-meat",
    description: LOREM_IPSUM,
  ),
  FoodModel(
    name: "Cream and Corn Soup",
    image: "https://source.unsplash.com/200x200/?portobello",
    description: LOREM_IPSUM,
  ),
  FoodModel(
    name: "Cream and Corn Soup",
    image: "https://source.unsplash.com/200x200/?soup",
    description: LOREM_IPSUM,
  ),
];
