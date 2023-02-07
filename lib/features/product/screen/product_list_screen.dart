import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:starbacks/core/resources/colors.dart';
import 'package:unicons/unicons.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      backgroundColor: BaseColors.backgroundColor,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: ListView(
          children: [
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
            SizedBox(height: 30),
            Container(
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
            SizedBox(height: 30),
            ListProductItem(),
            ListProductItem(),
            ListProductItem(),
            ListProductItem(),
            ListProductItem(),
            ListProductItem(),
            ListProductItem(),
            ListProductItem(),
          ],
        ),
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

class ListProductItem extends StatelessWidget {
  const ListProductItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  alignment: Alignment.topLeft,
                  height: 100,
                  child: ClipRRect(
                    child: Image.asset(
                      'assets/images/product/chocolate_frappuccino.png',
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Coffee",
                        style: GoogleFonts.raleway().copyWith(fontSize: 14),
                      ),
                      Text(
                        "Chocolate Frappuccino",
                        style: GoogleFonts.raleway().copyWith(
                            fontSize: 17, fontWeight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        "\$20.00",
                        style: GoogleFonts.poppins().copyWith(
                          fontSize: 18,
                          color: BaseColors.primaryColor,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(width: 23),
              Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                    color: BaseColors.primaryColor,
                    borderRadius: BorderRadius.circular(666),
                  ),
                  height: 30,
                  child: Center(
                    child: Text(
                      "+Add",
                      style: GoogleFonts.poppins().copyWith(
                        fontSize: 12,
                        color: BaseColors.backgroundColor,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        Divider(
          height: 30,
        )
      ],
    );
  }
}
