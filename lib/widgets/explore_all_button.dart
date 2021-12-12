import 'package:flutter/material.dart';
import 'package:reseppi_beta/shared/theme.dart';

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
          )
        )
      ),
    );
  }
}