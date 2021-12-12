import 'package:flutter/material.dart';
import 'package:reseppi_beta/shared/theme.dart';

class Content extends StatelessWidget {
  const Content({
    Key? key,
    required this.size,
    required this.image,
    required this.title,
    required this.desc,
  }) : super(key: key);

  final Size size;
  final String image, title,desc;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.08, vertical: size.height * 0.015),
        ),
        Expanded(
          child: Image.asset(
            image,
            width: 200,
          ),
        ),
        SizedBox(height: 10),
        Text(
          title,
          style: yellowTextColor.copyWith(fontWeight: semiBold,
          fontSize: 24),
        ),
        Divider(
          thickness: 2.0,
          color: rPrimaryColor,
          endIndent: size.width * 0.4,
          indent: size.width * 0.4,
        ),
        SizedBox(height: size.height * 0.03),
        Text(
          desc,
          textAlign: TextAlign.center,
          style: blackTextColor.copyWith(fontSize: 18),
        ),
      ],
    );
  }
}
