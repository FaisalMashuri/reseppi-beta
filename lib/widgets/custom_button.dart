import 'package:flutter/material.dart';
import 'package:reseppi_beta/shared/theme.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final double width;
  final Function() onPressed;
  final EdgeInsets margin;

  const CustomButton({
    Key? key,
    required this.title,
    this.width = double.infinity,
    required this.onPressed,
    this.margin = EdgeInsets.zero,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 55,
      margin: margin,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          side: BorderSide(width: 2.0, color: rYellowColor),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(defaultRadius),
          ),
        ),
        child: Text(
          title,
          style: yellowTextColor.copyWith(fontSize: 20, fontWeight: bold),
        ),
      ),
    );
  }
}
