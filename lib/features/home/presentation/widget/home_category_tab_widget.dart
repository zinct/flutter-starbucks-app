import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:starbacks/core/resources/colors.dart';

class HomeCategoryTabWidget extends StatelessWidget {
  final bool isSelected;
  final String? id;
  final String label;
  final Function(dynamic) onTap;

  const HomeCategoryTabWidget(
      {Key? key,
      required this.label,
      this.id,
      this.isSelected = false,
      required this.onTap})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () => onTap(id),
          child: Container(
            decoration: BoxDecoration(
              color:
                  isSelected ? BaseColors.primaryColor : BaseColors.accentColor,
              borderRadius: BorderRadius.circular(100),
            ),
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Center(
              child: Text(
                label,
                style: GoogleFonts.raleway().copyWith(
                  color: isSelected
                      ? BaseColors.backgroundColor
                      : BaseColors.grey.withOpacity(.7),
                  fontSize: 22,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 15,
        ),
      ],
    );
  }
}
