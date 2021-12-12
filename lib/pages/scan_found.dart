import 'package:flutter/material.dart';
import 'package:reseppi_beta/shared/theme.dart';
import 'package:reseppi_beta/widgets/custom_button.dart';

class ScanFound extends StatefulWidget {
  const ScanFound({Key? key}) : super(key: key);

  @override
  _ScanFoundState createState() => _ScanFoundState();
}

class _ScanFoundState extends State<ScanFound> {
  @override
  Widget build(BuildContext context) {
    Widget BonusCard({bahan, image, title}) {
      return Container(
          width: 400,
          // height:0,
          padding: EdgeInsets.all(defaultMargin),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/bg-card.png'),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: blackTextColor.copyWith(fontWeight: semiBold),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Bahan",
                          style: blackTextColor.copyWith(fontWeight: medium),
                        ),
                        Text(
                          "3/4 lb portobello mushrooms  (340g, approx)",
                          style: blackTextColor.copyWith(
                              fontWeight: medium, fontSize: 10),
                        ),
                        Text(
                          "1 clove garlic",
                          style: blackTextColor.copyWith(
                              fontWeight: medium, fontSize: 10),
                        ),
                        Text(
                          "2 tbsp olive oil",
                          style: blackTextColor.copyWith(
                              fontWeight: medium, fontSize: 10),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  Image.asset(
                    image,
                    width: 120,
                  )
                ],
              ),
              SizedBox(
                height: 41,
              ),
            ],
          ));
    }

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset('assets/portobello.png'),
            Container(
              margin: EdgeInsets.only(top: 16.0),
              child: Text(
                'Portobello',
                style: blackTextColor.copyWith(fontSize: 36, fontWeight: bold),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Container(
                height: 1.0,
                width: 130.0,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BonusCard(
                    title: "Baked Portobello Mashroom",
                    image: "assets/baked-portobello.png"),
                BonusCard(
                    title: "Boiled Portobello Mashroom",
                    image: "assets/baked-portobello.png"),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
