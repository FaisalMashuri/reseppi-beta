import 'dart:convert';

List<Recipe> postFromJson(String str) =>
    List<Recipe>.from(json.decode(str).map((x) => Recipe.fromMap(x)));

class Recipe {
  int id;
  String title;
  String image;
  String imageType;

  Recipe({
    required this.id,
    required this.title,
    required this.image,
    required this.imageType,
  });

  factory Recipe.fromMap(Map<String, dynamic> json) => Recipe(
    id: json['id'],
    title: json["title"],
    image: json['image'],
    imageType: json['imageType'],

  );
}


