import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:reseppi_beta/pages/list_resep.dart';
import 'package:reseppi_beta/shared/theme.dart';
import 'package:reseppi_beta/widgets/custom_button.dart';
import 'package:tflite/tflite.dart';

class ScanPage extends StatefulWidget {
  const ScanPage({Key? key}) : super(key: key);

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  XFile? _image;
  bool _loading = true;
  File? _images;
  List? _output;
  final picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    loadModel().then((value) {
      setState(() {});
    });
  }

  classifyImage(File image) async {
    var output = await Tflite.runModelOnImage(
        path: image.path,
        numResults: 5,
        threshold: 0.5,
        imageStd: 127.5,
        imageMean: 127.5);
    setState(() {
      _output = output;
      _loading = false;
    });

    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => ListRecipePage(
              apiUrl:
                  "https://api.spoonacular.com/recipes/complexSearch?apiKey=9ee85d6e06154236881c92ed142cadff&query=${_output![0]['label']}&includeIngredients=asparagus&instructionsRequired=false&fillIngredients=true&addRecipeInformation=true")),
    );
  }

  loadModel() async {
    await Tflite.loadModel(
        model: "assets/reseppi_model.tflite", labels: "assets/labels.txt"
    );
  }

  Future pickImage(ImageSource source) async {
    try {
      // var image = await picker.getImage(source: source);
      // if (image==null) return null;
      // setState(() {
      //   _images = File(image.path);
      // });

      // classifyImage(_images!);
      var imageFile = await ImagePicker()
          .pickImage(source: source, maxHeight: 224, maxWidth: 224);
      if (imageFile != null) {
        setState(() {
          _loading = true;
          _image = imageFile;
        });
      }
      classifyImage(File(_image!.path));
    } on PlatformException catch (e) {
      print("Failed to pick image");
    }
  }

  @override
  void dispose() {
    Tflite.close();
    super.dispose();
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
              child: Image.asset(
                      "assets/cake.png",
                      width: MediaQuery.of(context).size.width * 0.7,
                      height: MediaQuery.of(context).size.height * 0.5,
                    )
                  
              // Column(
              //     children: [
              //       // Text(_listResult.toString()),
              //       Image.file(
              //         File(_image!.path),
              //         width: MediaQuery.of(context).size.width,
              //         height: MediaQuery.of(context).size.height * 0.5,
              //       ),
              //     ],
              //   )
              ),
          SizedBox(
            height: 10,
          ),
          CustomButton(
              title: "Scan",
              width: 100,
              onPressed: () {
                pickImage(ImageSource.camera);
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
              onPressed: () {},
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
              onPressed: () {
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
