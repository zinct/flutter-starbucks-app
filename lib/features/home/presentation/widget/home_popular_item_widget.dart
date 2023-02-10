import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:starbacks/core/constants/router.dart';
import 'package:starbacks/core/resources/colors.dart';
import 'package:starbacks/core/utils/currency_utils.dart';
import 'package:starbacks/features/product/domain/entities/product.dart';

class HomePopularItemWidget extends StatelessWidget {
  Product product;

  HomePopularItemWidget(this.product, {Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed(ROUTER.PRODUCT_DETAIl, arguments: product);
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
                    tag: product.id,
                    child: Image.network(
                      product.image,
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
                        product.name,
                        style: GoogleFonts.raleway().copyWith(fontSize: 20),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "\$${CurrencyUtils.usdFormat(product.prices[0].amount).toString()}",
                            style: GoogleFonts.poppins().copyWith(
                              fontSize: 30,
                              color: BaseColors.primaryColor,
                            ),
                          ),
                          Icon(
                            Icons.favorite,
                            size: 33,
                            color: true
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
