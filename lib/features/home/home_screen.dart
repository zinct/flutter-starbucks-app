import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:starbacks/core/constants/router.dart';
import 'package:starbacks/core/resources/colors.dart';
import 'package:unicons/unicons.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      margin: EdgeInsets.only(top: 40),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: ListView(
        children: [
          Container(
            padding: EdgeInsets.only(right: 150),
            child: Text(
              "Our way of loving you back.",
              style: GoogleFonts.raleway().copyWith(
                  fontSize: 25, fontWeight: FontWeight.bold, height: 1.6),
            ),
          ),
          SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(
              color: BaseColors.accentColor,
              borderRadius: BorderRadius.circular(26.5),
            ),
            height: 50,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Icon(
                        UniconsLine.search,
                        color: BaseColors.grey.withOpacity(.4),
                        size: 26,
                      ),
                      SizedBox(
                        width: 13,
                      ),
                      Text(
                        "Search",
                        style: GoogleFonts.raleway().copyWith(
                          fontSize: 16,
                          color: BaseColors.grey.withOpacity(.7),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 30),
            width: MediaQuery.of(context).size.width,
            height: 40,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                CategoryTab(label: 'All', isSelected: true),
                CategoryTab(label: 'Coffee'),
                CategoryTab(label: 'Tea'),
                CategoryTab(label: 'Drink'),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 30),
            width: MediaQuery.of(context).size.width,
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Popular",
                  style: GoogleFonts.raleway().copyWith(fontSize: 20),
                ),
                InkWell(
                  onTap: () =>
                      Navigator.of(context).pushNamed(ROUTER.PRODUCT_LIST),
                  child: Text(
                    "See All",
                    style: GoogleFonts.raleway()
                        .copyWith(fontSize: 20, color: BaseColors.primaryColor),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 400,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                PopularItem(
                  label: "Chocolate Frappuccino",
                  price: "\$20.00",
                ),
                // PopularItem(
                //   label: "Chocolate Frappuccino",
                //   price: "\$20.00",
                // ),
              ],
            ),
          ),
          SizedBox(height: 100),
        ],
      ),
    );
  }
}

class PopularItem extends StatelessWidget {
  final bool isFavorite;
  final String label;
  final String price;

  const PopularItem(
      {Key? key,
      required this.label,
      required this.price,
      this.isFavorite = false})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(ROUTER.PRODUCT_DETAIl);
      },
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: BaseColors.backgroundColor,
              borderRadius: BorderRadius.circular(14),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 0),
                  blurRadius: 10,
                  color: Color(0xFF000000).withOpacity(.1),
                ),
              ],
            ),
            width: 256,
            height: 390,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  child: Hero(
                    tag: 'ok',
                    child: Image.asset(
                      'assets/images/product/chocolate_frappuccino.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        label,
                        style: GoogleFonts.raleway().copyWith(fontSize: 20),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            price,
                            style: GoogleFonts.poppins().copyWith(
                              fontSize: 30,
                              color: BaseColors.primaryColor,
                            ),
                          ),
                          Icon(
                            Icons.favorite,
                            size: 33,
                            color: isFavorite
                                ? Colors.red
                                : BaseColors.grey.withOpacity(.2),
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryTab extends StatelessWidget {
  final bool isSelected;
  final String label;

  const CategoryTab({Key? key, required this.label, this.isSelected = false})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
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
        SizedBox(
          width: 15,
        ),
      ],
    );
  }
}
