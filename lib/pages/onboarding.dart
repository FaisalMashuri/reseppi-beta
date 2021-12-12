import 'package:flutter/material.dart';
import 'package:reseppi_beta/shared/theme.dart';
import 'package:reseppi_beta/widgets/onboarding_content.dart';

class OnBoardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Body(),
    );
  }
}

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;

  List<Map<String, String>> onBoardingData = [
    {
      "desc": "Aplikasi ini mengunakan \nscan untuk obyek yang akan dipilih",
      "image": "assets/onboard_1.png",
      "title": "Bisa untuk scan",
    },
    {
      "desc": "Yukk bund... tulis recep \nterbaik bunda disini.",
      "image": "assets/onboard_2.png",
      "title": "Share your thoughts",
    },
    {
      "desc":
          "Liat daftar resep yang pernah \nbunda liat yuk. Tenang ini bukan \ndaftar orang spesial di masa lalu.",
      "image": "assets/onboard_3.png",
      "title": "Realize your project",
    },
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Column(
        children: [
          Container(
            height: size.height * 0.8,
            child: PageView.builder(
              onPageChanged: (value) {
                setState(() {
                  currentPage = value;
                });
              },
              itemCount: onBoardingData.length,
              itemBuilder: (context, index) => Content(
                size: size,
                image: onBoardingData[index]["image"].toString(),
                title: onBoardingData[index]["title"].toString(),
                desc: onBoardingData[index]["desc"].toString(),
              ),
            ),
          ),
          SizedBox(height: size.height * 0.04),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              onBoardingData.length,
              (index) => Container(
                margin: EdgeInsets.only(right: 15),
                height: 13,
                width: 13,
                decoration: BoxDecoration(
                  color: currentPage == index ? rPrimaryColor : Colors.white,
                  border: Border.all(color: rPrimaryColor),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),
          ),
          SizedBox(height: size.height * 0.03),
          GestureDetector(
            child: Text(
              "skip",
              style: yellowTextColor.copyWith(fontSize: 16),
            ),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/home');
            },
          )
        ],
      ),
    );
  }
}
