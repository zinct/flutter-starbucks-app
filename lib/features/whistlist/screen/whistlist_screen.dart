import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:starbacks/core/constants/router.dart';
import 'package:starbacks/core/resources/colors.dart';

class WhistlistScreen extends StatelessWidget {
  const WhistlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          SizedBox(height: 20),
          Container(
            child: Text(
              "My Favorites",
              style: GoogleFonts.raleway()
                  .copyWith(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 20),
          Flexible(
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 3 / 3,
              children: [
                PopularItem(label: 'Chocolate', price: '\$20.00'),
                PopularItem(label: 'Chocolate', price: '\$20.00'),
                // PopularItem(label: 'Chocolate', price: '\$20.00'),
              ],
            ),
          ),
          // Expanded(
          //   child: Container(
          //     color: Colors.amber,
          //     width: double.infinity,
          //     // child: GridView.count(
          //     //   crossAxisCount: 2,
          //     //   children: [
          //     //     Text("Hello"),
          //     //     Text("Hello"),
          //     //   ],
          //     // ),
          //   ),
          // ),
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
      child: Container(
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Hero(
              tag: 'ok',
              child: Image.asset(
                'assets/images/product/chocolate_frappuccino.png',
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
    );
  }
}
