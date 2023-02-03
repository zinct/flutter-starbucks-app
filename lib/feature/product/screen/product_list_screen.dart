import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
            'assets/icons/ic_bars.svg',
            width: 25,
          ),
          onPressed: () {},
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
    ));
  }
}
