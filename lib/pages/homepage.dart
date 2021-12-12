

import 'package:flutter/material.dart';
import 'package:reseppi_beta/model/foodModel.dart';
import 'package:reseppi_beta/shared/theme.dart';
import 'package:reseppi_beta/widgets/categories_tile.dart';
import 'package:reseppi_beta/widgets/custom_icon_button.dart';
import 'package:reseppi_beta/widgets/food_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        child: Column(
          children: [
            buildHeader(),
            SizedBox(
              height: 20,
            ),
            buildSearch(),
            _buildCategories(context: context),
            buildRecomendResep()
          ],
        ),
      )),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: IconButton(
              icon: Image.asset(
                "assets/icon_home.png",
                width: 40,
              ),
              onPressed: () {},
            ),
            title: Text(
              "Home",
              style: primaryTextColor.copyWith(fontSize: 12),
            ),
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              icon: Image.asset(
                "assets/icon_camera_active.png",
                width: 40,
              ),
              onPressed: () {
                Navigator.pushNamed(context, "/scan");
              },
            ),
            title: Text(
              "Scan",
              style: primaryTextColor.copyWith(fontSize: 12),
            ),
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              icon: Image.asset(
                "assets/icon_clipboard.png",
                width: 40,
              ),
              onPressed: () {},
            ),
            title: Text(
              "Tulis",
              style: primaryTextColor.copyWith(fontSize: 12),
            ),
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              icon: Image.asset(
                "assets/icon_account.png",
                width: 40,
              ),
              onPressed: () {
                Navigator.pushNamed(context, "/account");
              },
            ),
            title: Text(
              "Akun",
              style: primaryTextColor.copyWith(fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
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
                icon: Icon(Icons.sort),
                onPressed: () {},
              ),
              Text("Masak Yuk", style: blackTextColor.copyWith(
                fontSize: 20,
                fontWeight: bold
              ),)
            ],
          ),
          CircleAvatar(
            backgroundImage:
                NetworkImage("https://source.unsplash.com/200x200/?man"),
          )
        ],
      ),
      SizedBox(
        height: 16,
      ),
      Text(
        "Masak Itu Gampang",
        style: blackTextColor.copyWith(fontSize: 16),
      ),
      Row(
        children: [
          Text(
            "Temukan resep mu disini",
            style: blackTextColor.copyWith(fontSize: 16, fontWeight: bold),
          ),
          Text(
            "#DiRumahAja",
            style: primaryTextColor.copyWith(fontSize: 16, fontWeight: bold),
          )
        ],
      )
    ],
  );
}

Widget buildSearch() {
  return Row(
    children: [
      Expanded(
          child: TextField(
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

Widget _buildCategories({required context}) {
  return Padding(
    padding: EdgeInsets.all(20),
    child: Column(children: [
      Container(
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              'Kategori Resep',
              style: blackTextColor.copyWith(
                fontSize: 18,
                fontWeight: semiBold,
              ),
            ),
            _ExploreAllButton(
              onTap: () {},
            ),
          ],
        ),
      ),
      SizedBox(
        height: 20,
      ),
      _buildCategoriesList()
    ]),
  );
}

Widget _buildCategoriesList() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      CategoriesTile(
        assetPath: 'assets/vegan.png',
        color: Color(0x4D39DF0F),
        title: 'Vegan',
      ),
      CategoriesTile(
        assetPath: 'assets/spicy.png',
        color: Color(0x4DFF2A0F),
        title: 'Spicy',
      ),
      
      CategoriesTile(
        assetPath: 'assets/grill.png',
        color: Color(0x4DCF9E0F),
        title: 'Grill',
      ),
      CategoriesTile(
        assetPath: 'assets/seafood.png',
        color: Color(0x210000FF),
        title: 'Seafood',
      ),
    ],
  );
}

Widget buildRecomendResep() {
  return Padding(
    padding: EdgeInsets.all(8),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Rekomendasi Resep",
          style: blackTextColor.copyWith(
            fontSize: 18,
            fontWeight: semiBold
          ),
        ),
        Container(
          height:220,
          margin: EdgeInsets.only(top: 24),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: foodList.length,
            itemBuilder: (context, index) {
              FoodModel food = foodList[index];
              return FoodCard(food: food);
            },
          ),
        )
      ],
    ),
  );
}

class _ExploreAllButton extends StatelessWidget {
  final Function() onTap;
  const _ExploreAllButton({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: this.onTap,
      child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Color(0xffE0E6EE),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10)),
          ),
          child: Text(
            'Explore All',
            style: primaryTextColor.copyWith(
              fontSize: 13,
              fontWeight: semiBold,
            ),
          )),
    );
  }
}
