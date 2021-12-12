import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:reseppi_beta/shared/theme.dart';
import 'package:reseppi_beta/widgets/custom_button.dart';

class ScanPage extends StatefulWidget {
  const ScanPage({Key? key}) : super(key: key);

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  XFile? _image;

  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker()
          .pickImage(source: source, maxHeight: 224, maxWidth: 224);

      if (image != null) {
        setState(() {
          _image = image;
        });
      }
    } on PlatformException catch (e) {
      print("Failed to pick image");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
              child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
            child: _image == null
                ? Image.asset(
                    "assets/cake.png",
                    width: MediaQuery.of(context).size.width * 0.7,
                    height: MediaQuery.of(context).size.height * 0.5,
                  )
                : Image.file(
                    File(_image!.path),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.5,
                  ),
          ),
          SizedBox(
            height: 10,
          ),
          CustomButton(
              title: "Scan",
              width: 100,
              onPressed: () {
                // _openCamera(context);
              }),
          SizedBox(
            height: 20,
          ),
          Text(
            "atau",
            style: blackTextColor.copyWith(fontSize: 18, fontWeight: semiBold),
          ),
          SizedBox(
            height: 20,
          ),
          CustomButton(
              title: "choose file",
              width: 200,
              onPressed: () {
                pickImage(ImageSource.gallery);
              }),
        ],
      ) //,
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
                onPressed: (){},
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
                onPressed: (){
                  Navigator.pushNamed(context, "/scan-found");
                },
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
