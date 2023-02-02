import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:starbacks/core/resources/colors.dart';
import 'package:unicons/unicons.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BaseColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: BaseColors.backgroundColor,
        elevation: 0,
        centerTitle: true,
        toolbarHeight: 75,
        leadingWidth: 70,
        leading: Container(
          margin: EdgeInsets.only(left: 20),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: BaseColors.accentColor,
          ),
          width: 30,
          child: IconButton(
            icon: SvgPicture.asset(
              'assets/icons/ic_back.svg',
              width: 15,
              color: BaseColors.grey,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        title: Image.asset(
          'assets/images/logo.png',
          width: 70,
        ),
        actions: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: BaseColors.accentColor,
            ),
            width: 50,
            child: Icon(
              UniconsLine.shopping_bag,
              size: 35,
              color: BaseColors.darkColor,
            ),
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 30,
                vertical: 20,
              ),
              child: ListView(
                children: [
                  Container(
                    height: 370,
                    child: Container(
                      width: double.infinity,
                      child: Hero(
                        tag: 'ok',
                        child: Image.asset(
                          'assets/images/product/chocolate_frappuccino.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Coffee",
                    style: GoogleFonts.raleway().copyWith(fontSize: 18),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Chocolate Frappuccino",
                          style: GoogleFonts.raleway().copyWith(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "\$20.00",
                          style: GoogleFonts.poppins().copyWith(
                            fontSize: 22,
                            color: BaseColors.primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "This is a simple Starbucks app repository, featuring a cart system that allows users to add menu items to their virtual cart.",
                    style: GoogleFonts.raleway().copyWith(
                      fontSize: 18,
                      color: Color(0xFF6D6D6D),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    child: Row(
                      children: [
                        Topping(
                          label: 'Tall',
                          isSelected: true,
                        ),
                        Topping(label: 'Grande'),
                        Topping(
                          label: 'Venti',
                          isLast: true,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                decoration: BoxDecoration(
                  color: BaseColors.primaryColor,
                  borderRadius: BorderRadius.circular(666),
                ),
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                height: 55,
                child: Center(
                  child: Text(
                    "Add to bag",
                    style: GoogleFonts.raleway().copyWith(
                        fontSize: 20, color: BaseColors.backgroundColor),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Topping extends StatelessWidget {
  final bool isSelected;
  final bool isLast;
  final String label;

  const Topping(
      {Key? key,
      required this.label,
      this.isSelected = false,
      this.isLast = false})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Container(
              height: 78,
              width: 78,
              decoration: BoxDecoration(
                color: isSelected ? BaseColors.primaryColor : Color(0xFFF2F2F2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.asset(
                  "assets/images/${isSelected ? 'selected' : 'unselected'}_small.png"),
            ),
            SizedBox(height: 5),
            Text(
              label,
              style: GoogleFonts.raleway().copyWith(
                  fontSize: 18,
                  color: isSelected ? BaseColors.primaryColor : Colors.grey),
            ),
          ],
        ),
        !isLast
            ? SizedBox(
                width: 18,
              )
            : SizedBox(
                width: 8,
              ),
      ],
    );
  }
}
