import 'package:flutter/material.dart';
import 'package:reseppi_beta/model/foodModel.dart';
import 'package:reseppi_beta/model/recipe_model.dart';
import 'package:reseppi_beta/pages/food_detail.dart';
import 'package:reseppi_beta/pages/resep_detail.dart';

import 'custom_icon_button.dart';

class RecipeCard extends StatelessWidget {
  final int id;
  final String title;
  final String image;
  final String instructions;
  final List ingredients;
  // final String imgaeType;
  const RecipeCard({Key? key, required this.id, required this.title, required this.image, required this.instructions, required this.ingredients }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => RecipeDetailePage(title: title, image: image, instructions: instructions, ingredients: ingredients)));
            // RecipeDetailePage(apiUrl:"https://api.spoonacular.com/recipes/${id}/information?includeNutrition=false&apiKey=8717a5e6637e4ef882cb995821e07d5c")));
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.7,
        margin: EdgeInsets.only(right: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildFoodImage(),
            SizedBox(height: 8),
            buildFoodInfo(),
          ],
        ),
      ),
    );
  }

  Widget buildFoodImage() {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.network(
            image,
            height: 150,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: CustomIconButton(
            icon: Icon(Icons.favorite, color: Colors.red),
            onPressed: () {},
            radius: 32,
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.black87,
            borderRadius: BorderRadius.circular(4),
          ),
          padding: EdgeInsets.all(4),
          margin: EdgeInsets.all(4),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.star, color: Colors.yellow, size: 12),
              SizedBox(width: 2),
              Text(
                "4.6",
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
              Text(
                "(1k+)",
                style: TextStyle(color: Colors.white70, fontSize: 12),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget buildFoodInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        
      ],
    );
  }
}