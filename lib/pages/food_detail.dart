import 'package:flutter/material.dart';
import 'package:reseppi_beta/model/foodModel.dart';
import 'package:reseppi_beta/widgets/custom_icon_button.dart';

class FoodDetailPage extends StatefulWidget {
  final FoodModel food;

  const FoodDetailPage({Key? key, required this.food}) : super(key: key);
  @override
  _FoodDetailPageState createState() => _FoodDetailPageState();
}

class _FoodDetailPageState extends State<FoodDetailPage> {
  FoodModel get food => widget.food;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          buildImage(),
          buildFoodInfo(),
          buildAppBar(),

        ],
      ),
    );
  }
  var like = 0;

  Widget buildFoodInfo() {
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
                Text(
                  food.name,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                
              ],
            ),
            SizedBox(height: 12),
            Text("Italian soup"),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ...List.generate(
                    5, (index) => Icon(Icons.star, color: Colors.yellow)),
                Text("4.6"),
                Text("(1k+)"),
                Spacer(),
                CustomIconButton(
                  icon: Icon(Icons.remove, size: 16),
                  onPressed: () {},
                  backgroundColor: Colors.black.withOpacity(0.1),
                ),
                Text("1", style: TextStyle(fontSize: 18)),
                CustomIconButton(
                  icon: Icon(Icons.add, size: 16),
                  onPressed: () {},
                  backgroundColor: Colors.black.withOpacity(0.1),
                ),
              ],
            ),
            buildDescription(),
            buildIngredient(),
          ],
        ),
      ),
    );
  }

  Widget buildDescription() {
    return Container(
      margin: EdgeInsets.only(top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Ingredient",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 12),
          Text(food.description),
        ],
      ),
    );
  }

  Widget buildIngredient() {
    return Container(
      margin: EdgeInsets.only(top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Description",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 12),
          Container(
            height: 100,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(
                10,
                (index) => Container(
                  child: Card(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        "https://source.unsplash.com/200x20$index/?vegetable",
                      ),
                    ),
                  ),
                  width: 100,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildImage() {
    return Container(
      height: MediaQuery.of(context).size.height / 2,
      width: double.infinity,
      child: Image.network(
        food.image,
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
              icon:Icon(Icons.favorite, color: Colors.red,),
              onPressed: () {
                
              },
            ),
          ],
        ),
      ),
    );
  }
}