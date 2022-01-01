import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

import 'package:reseppi_beta/model/recipe_model.dart';

class APIService {
  static final String url = "https://api.spoonacular.com";
  static final String apiKey= "8717a5e6637e4ef882cb995821e07d5c";

  Future<List<Recipe>> fetchRecomendRecipe() async {
    final response =
      await http.get(Uri.parse('https://api.spoonacular.com/recipes/random?tags=&apiKey=8717a5e6637e4ef882cb995821e07d5c'));
      // ${url}/apiKey=${apiKey}&number=5&includeIngredients=true'
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
      print(parsed);
      return parsed.map<Recipe>((json) => Recipe.fromMap(json)).toList();
    }else {
      throw Exception("failed to load rescipe");
    }
  }

  Future<List<Recipe>> SearchRecipe(String q) async {
    final response = await http.get(Uri.parse('${url}/apiKey=${apiKey}&query=${q}&includeIngredients=true'));
    if(response.statusCode == 2000) {
      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
      print(parsed);
      return parsed.map<Recipe>((json) => Recipe.fromMap(json)).toList();
    }else {
      throw Exception('failed to load recipe');
    }
  }

  Future<List<Recipe>> searchByTag(String tags) async {
    final response = await http.get(Uri.parse('${url}/apiKey=${apiKey}&tags=${tags}&includeIngredients=true'));
    if(response.statusCode == 200) {
      final parsed = json.decode(response.body).cast<Map<String,dynamic>>();
      print(parsed);
      return parsed.map<Recipe>((json) => Recipe.fromMap(json)).toList();
    }else {
      throw Exception('failed to load recipe');
    }
  }
}