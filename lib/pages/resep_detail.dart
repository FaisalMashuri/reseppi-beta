import 'dart:convert';
// import 'dart:js';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:reseppi_beta/model/foodModel.dart';
import 'package:reseppi_beta/model/recipe_model.dart';
import 'package:reseppi_beta/widgets/custom_icon_button.dart';
// import 'package:html/parser.dart';

class RecipeDetailePage extends StatefulWidget {
  final String title;
  final String image;
  final String instructions;
  final List ingredients;
  const RecipeDetailePage(
      {Key? key,
      required this.title,
      required this.image,
      required this.instructions,
      required this.ingredients})
      : super(key: key);

  @override
  _RecipeDetailePageState createState() => _RecipeDetailePageState();
}

class _RecipeDetailePageState extends State<RecipeDetailePage> {
  // String get apiUrl => widget.apiUrl;
  String get title => widget.title;
  String get image => widget.image;
  String get instructions => widget.instructions;
  List get ingreients => widget.ingredients;
  // Future<dynamic> _fecthDataRecipe() async {
  //   var result = await http.get(Uri.parse(apiUrl));
  //   if (result.statusCode == 200) {
  //     return json.decode(result.body);
  //   } else {
  //     throw Exception("failed");
  //   }
  //   // print(json.decode(result.body));
  // }

  @override
  Widget build(BuildContext context) {
  print("instructios: ${instructions}");

    return Scaffold(
      body: Stack(
        children: [
          buildImage(image),
          buildRecipeInfo(title, widget.instructions,
              ingreients),
          buildAppBar(),
        ],
      ),
      // FutureBuilder<dynamic>(
      //   future: _fecthDataRecipe(),
      //   builder: (context, AsyncSnapshot snapshot) {
      //     if (snapshot.hasData) {
      //       return Stack(
      //         children: [
      //           buildImage(snapshot.data['image']),
      //           buildRecipeInfo(snapshot.data['title'], snapshot.data['instructions'], snapshot.data['extendedIngredients']),
      //           buildAppBar(),
      //         ],
      //       );
      //     } else if (snapshot.hasError) {
      //       return Text("${snapshot.error}");
      //     } else {
      //       return Center(
      //         child: CircularProgressIndicator(),
      //       );
      //     }
      //   },
      // )
    );
  }

  Widget buildRecipeInfo(
      String title, String instruction, extendedIngredients) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        vertical: MediaQuery.of(context).size.height / 2 - 16,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        padding: EdgeInsets.symmetric(vertical: 24, horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
            SizedBox(height: 12),
            // Text("Italian soup"),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ...List.generate(
                    5, (index) => Icon(Icons.star, color: Colors.yellow)),
                Text("4.6"),
                Text("(1k+)"),
                Spacer(),
              ],
            ),
            buildIngredient(extendedIngredients),
            buildDescription(instruction),
          ],
        ),
      ),
    );
  }

  Widget buildDescription(String instruction) {
    return Container(
      margin: EdgeInsets.only(top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Instruksi",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 12),
          Text(instruction)
        ],
      ),
    );
  }

  Widget buildIngredient(List ingerient) {
    return Container(
      margin: EdgeInsets.only(top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Bahan - Bahan",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 12),
          Container(
            height: 100,
            child: ListView.builder(
              itemCount: ingerient.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) {
                return Container(
                  child: Card(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        "https://spoonacular.com/cdn/ingredients_100x100/${ingerient[index]['image']}",
                      ),
                    ),
                  ),
                  width: 100,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildImage(String image) {
    return Container(
      height: MediaQuery.of(context).size.height / 2,
      width: double.infinity,
      child: Image.network(
        image,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget buildAppBar() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomIconButton(
              icon: Icon(Icons.arrow_back),
              backgroundColor: Colors.white,
              onPressed: () => Navigator.of(context).pop(),
            ),
            CustomIconButton(
              backgroundColor: Colors.white.withOpacity(0.5),
              icon: Icon(
                Icons.favorite,
                color: Colors.red,
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}


// class RecipeDetailPage extends StatefulWidget {
//   final String apiUrl;

//   const RecipeDetailPage({Key? key, required this.apiUrl}) : super(key: key);
//   @override
//   _RecipeDetailPageState createState() => _RecipeDetailPageState();
// }

// class _RecipeDetailPageState extends State<RecipeDetailPage> {

//     Future<List<dynamic>> _fecthDataRecipe() async {
//       var result = await http.get(Uri.parse(apiUrl));
//       return json.decode(result.body)['results'];
//     }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           buildImage(),
//           buildRecipeInfo(),
//           buildAppBar(),

//         ],
//       ),
//     );
//   }
//   var like = 0;

//   Widget buildRecipeInfo() {
//     return SingleChildScrollView(
//       padding: EdgeInsets.symmetric(
//         vertical: MediaQuery.of(context).size.height / 2 - 16,
//       ),
//       child: Container(
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
//         ),
//         padding: EdgeInsets.symmetric(vertical: 24, horizontal: 12),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   resep.title,
//                   style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//                 ),
                
//               ],
//             ),
//             SizedBox(height: 12),
//             Text("Italian soup"),
//             SizedBox(height: 8),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 ...List.generate(
//                     5, (index) => Icon(Icons.star, color: Colors.yellow)),
//                 Text("4.6"),
//                 Text("(1k+)"),
//                 Spacer(),
//                 CustomIconButton(
//                   icon: Icon(Icons.remove, size: 16),
//                   onPressed: () {},
//                   backgroundColor: Colors.black.withOpacity(0.1),
//                 ),
//                 Text("1", style: TextStyle(fontSize: 18)),
//                 CustomIconButton(
//                   icon: Icon(Icons.add, size: 16),
//                   onPressed: () {},
//                   backgroundColor: Colors.black.withOpacity(0.1),
//                 ),
//               ],
//             ),
//             buildDescription(),
//             buildIngredient(),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget buildDescription() {
//     return Container(
//       margin: EdgeInsets.only(top: 16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text("Ingredient",
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//           SizedBox(height: 12),
//           Text(resep.description),
//         ],
//       ),
//     );
//   }

//   Widget buildIngredient() {
//     return Container(
//       margin: EdgeInsets.only(top: 16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text("Description",
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//           SizedBox(height: 12),
//           Container(
//             height: 100,
//             child: ListView(
//               scrollDirection: Axis.horizontal,
//               children: List.generate(
//                 10,
//                 (index) => Container(
//                   child: Card(
//                     child: ClipRRect(
//                       borderRadius: BorderRadius.circular(8),
//                       child: Image.network(
//                         "https://source.unsplash.com/200x20$index/?vegetable",
//                       ),
//                     ),
//                   ),
//                   width: 100,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget buildImage() {
//     return Container(
//       height: MediaQuery.of(context).size.height / 2,
//       width: double.infinity,
//       child: Image.network(
//         resep.image,
//         fit: BoxFit.cover,
//       ),
//     );
//   }

  

//   Widget buildAppBar() {
//     return SafeArea(
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             CustomIconButton(
//               icon: Icon(Icons.arrow_back),
//               backgroundColor: Colors.white,
//               onPressed: () => Navigator.of(context).pop(),
//             ),
//             CustomIconButton(
//               backgroundColor: Colors.white.withOpacity(0.5),
//               icon:Icon(Icons.favorite, color: Colors.red,),
//               onPressed: () {
                
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }