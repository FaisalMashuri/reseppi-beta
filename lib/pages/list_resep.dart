import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:reseppi_beta/shared/theme.dart';
import 'package:reseppi_beta/widgets/custom_icon_button.dart';
import 'package:reseppi_beta/widgets/recipe_card.dart';

class ListRecipePage extends StatefulWidget {
  final String apiUrl;
  const ListRecipePage({Key? key, required this.apiUrl}) : super(key: key);

  @override
  _ListRecipePageState createState() => _ListRecipePageState();
}

class _ListRecipePageState extends State<ListRecipePage> {
  String get apiURL => widget.apiUrl;
  
      
  Future<List<dynamic>> _fecthDataRecipe() async {
    var result = await http.get(Uri.parse(apiURL));
    print(json.decode(result.body));
    return json.decode(result.body)['results'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
          child: Column(
            children: [
              buildHeader(),
              buildSearch(),
              buildListResep(MediaQuery.of(context).size.height)
            ],
          ),
        ),
      ),
    );
  }

  Widget buildHeader({Key? key}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomIconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: rPrimaryColor,
                  ),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, "/home");
                  },
                ),
                Text(
                  "Masak Yuk",
                  style:
                      blackTextColor.copyWith(fontSize: 20, fontWeight: bold),
                )
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget buildSearch() {
    return Row(
      children: [
        Expanded(
            child: TextField(
          onSubmitted: (String value) async {
            Navigator.push(context, MaterialPageRoute(builder: (context) => ListRecipePage(apiUrl: 
            "https://api.spoonacular.com/recipes/complexSearch?apiKey=9ee85d6e06154236881c92ed142cadff&number=10&query=${value}&includeIngredients=asparagus&instructionsRequired=false&fillIngredients=true&addRecipeInformation=true"
            )));
          },
          decoration: InputDecoration(
              hintText: "Search Food",
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: rPrimaryColor, width: 2.0)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: rYellowColor, width: 2.0)),
              contentPadding: EdgeInsets.all(8),
              suffixIcon: Icon(
                Icons.search,
                color: rPrimaryColor,
              )),
        )),
        CustomIconButton(
          icon: Icon(Icons.filter_list),
          onPressed: () {},
          margin: EdgeInsets.only(left: 8),
          backgroundColor: rYellowColor,
        )
      ],
    );
  }

  Widget buildListResep(double height) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20,),
          Container(
            margin: EdgeInsets.only(top: 24, bottom: 24),
            child: FutureBuilder<List<dynamic>>(
              future: _fecthDataRecipe(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                print(snapshot.data);
                if (snapshot.hasData) {
                  return ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (_, index) {
                      // Recipe resep = snapshot.data![index];

                      // return RecipeCard(resep: snapshot.data![index]);
                      return RecipeCard(
                        id: snapshot.data![index]['id'],
                        title: snapshot.data![index]['title'],
                        image: snapshot.data![index]['image'],
                        ingredients: snapshot.data![index]
                            ['extendedIngredients'],
                        instructions: snapshot.data![index]['summary'],
                      );
                      // imgaeType: snapshot.data![index]['imageType']);
                    },
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
