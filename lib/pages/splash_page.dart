import 'dart:async';

import 'package:flutter/material.dart';
import 'package:reseppi_beta/shared/theme.dart';
// import 'package:responsive_widgets/responsive_widgets.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // TODO: implement initState
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/onboard');
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    Orientation orientation = MediaQuery.of(context).orientation;
    return Scaffold(
        body: Container(
      width: screenSize.width,
      decoration: BoxDecoration(color: rPrimaryColor),
      child: Column(
        children: [
          Stack(
            children: [
              Image.asset("assets/bg_ingred.png"),
              Center(
                child: Container(
                  child: Image.asset(
                    "assets/logo.png",
                    height: 250,
                  ),
                  margin: EdgeInsets.only(top: 100),
                ),
              )
            ],
          ),
          SizedBox(
            height: 150,
          ),
          Container(
            margin: EdgeInsets.only(top: 0),
            child: Image.asset(
              "assets/text_logo.png",
              width: 180,
            ),
          )
        ],
      ),
    ));
  }
}
