import 'package:flutter/material.dart';
import 'package:reseppi_beta/shared/theme.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Account")
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: IconButton(
              icon: Image.asset(
                "assets/icon_home.png",
                width: 40,
              ),
              onPressed: () {
                Navigator.pushNamed(context, "/home");
              },
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
                onPressed: (){
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
                onPressed: (){},
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
                onPressed: (){
                  
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