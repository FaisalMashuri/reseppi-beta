import "package:flutter/material.dart";
import 'package:reseppi_beta/shared/theme.dart';

class ResepNotFound extends StatelessWidget {
  const ResepNotFound({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffF8ECDE),

        leading: InkWell(
          child: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: rPrimaryColor,),
            onPressed: () {
              Navigator.pushReplacementNamed(context, "/scan-page");
            },
          ),
          
        ) ,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Image.asset("assets/sadface.png"),
            ),
            Text("Maaf... bahan makanan yang\nkamu cari tidak ditemukan\nCoba bahan makanan lain yuk", style: blackTextColor.copyWith(
              fontSize: 18,
              
            ),textAlign: TextAlign.center,)
          ],
        ),
      ),
    );
  }
}

