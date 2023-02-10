import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:starbacks/core/resources/colors.dart';

class ProductPriceWidget extends StatelessWidget {
  final bool isSelected;
  final bool isLast;
  final String label;
  final Function() onTap;

  const ProductPriceWidget(
      {Key? key,
      required this.label,
      required this.onTap,
      this.isSelected = false,
      this.isLast = false})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
            height: 78,
            width: 78,
            decoration: BoxDecoration(
              color: isSelected ? BaseColors.primaryColor : Color(0xFFF2F2F2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.asset(
                "assets/images/${isSelected ? 'selected' : 'unselected'}_$label.png"),
          ),
        ),
        SizedBox(height: 5),
        Text(
          label,
          style: GoogleFonts.raleway().copyWith(
              fontSize: 18,
              color: isSelected ? BaseColors.primaryColor : Colors.grey),
        ),
      ],
    );
  }
}
