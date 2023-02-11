import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:starbacks/core/resources/colors.dart';
import 'package:starbacks/core/utils/currency_utils.dart';
import 'package:starbacks/features/cart/domain/entities/cart.dart';
import 'package:starbacks/features/cart/presentation/cubit/cart/cart_cubit.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<CartCubit>()..getListCart();

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
            child: Container(
              decoration: BoxDecoration(
                color: BaseColors.accentColor,
                shape: BoxShape.circle,
              ),
              width: 50,
              child: Center(
                child: BlocBuilder<CartCubit, CartState>(
                  builder: (context, state) {
                    return Text(
                      state.cart.length.toString(),
                      style: GoogleFonts.poppins().copyWith(
                        fontSize: 30,
                        color: BaseColors.grey,
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
      backgroundColor: BaseColors.backgroundColor,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        child: ListView(
          children: [
            Container(
              decoration: BoxDecoration(
                color: BaseColors.primaryColor,
                borderRadius: BorderRadius.circular(30),
              ),
              padding: EdgeInsets.all(40),
              height: 180,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "Your",
                        style: GoogleFonts.raleway()
                            .copyWith(fontSize: 25, color: Colors.white),
                      ),
                      SizedBox(width: 5),
                      Text(
                        "Cart",
                        style: GoogleFonts.raleway().copyWith(
                            fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Deliver To",
                        style: GoogleFonts.raleway()
                            .copyWith(fontSize: 16, color: Colors.white),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 3,
                              child: Text(
                                "M-64, Tipping Street, New York",
                                style: GoogleFonts.raleway().copyWith(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            SizedBox(width: 20),
                            // Expanded(
                            //   flex: 1,
                            //   child: Container(
                            //     decoration: BoxDecoration(
                            //       color: BaseColors.primaryColor,
                            //       borderRadius: BorderRadius.circular(666),
                            //     ),
                            //     height: 30,
                            //     child: Center(
                            //       child: Text(
                            //         "Change",
                            //         style: GoogleFonts.poppins().copyWith(
                            //           fontSize: 12,
                            //           color: BaseColors.backgroundColor,
                            //         ),
                            //       ),
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 40),
            BlocBuilder<CartCubit, CartState>(
              builder: (context, state) {
                return Column(
                  children: state.cart
                      .map((e) => CartItem(
                            e.cart,
                            key: ValueKey(e.product.id.toString() +
                                e.productPrice.name.toString()),
                          ))
                      .toList(),
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Subtotal",
                  style: GoogleFonts.raleway().copyWith(fontSize: 20),
                ),
                Text(
                  "\$32.97",
                  style: GoogleFonts.raleway().copyWith(fontSize: 20),
                ),
              ],
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Taxes",
                  style: GoogleFonts.raleway().copyWith(fontSize: 20),
                ),
                Text(
                  "\$1.32",
                  style: GoogleFonts.raleway().copyWith(fontSize: 20),
                ),
              ],
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Delivery",
                  style: GoogleFonts.raleway().copyWith(fontSize: 20),
                ),
                Text(
                  "\$2.83",
                  style: GoogleFonts.raleway().copyWith(fontSize: 20),
                ),
              ],
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total",
                  style: GoogleFonts.raleway()
                      .copyWith(fontSize: 20, color: BaseColors.primaryColor),
                ),
                Text(
                  "\$36.32",
                  style: GoogleFonts.raleway()
                      .copyWith(fontSize: 20, color: BaseColors.primaryColor),
                ),
              ],
            ),
            SizedBox(height: 40),
            Container(
              decoration: BoxDecoration(
                color: BaseColors.primaryColor,
                borderRadius: BorderRadius.circular(666),
              ),
              height: 55,
              child: Center(
                child: Text(
                  "Add to bag",
                  style: GoogleFonts.raleway().copyWith(
                      fontSize: 20, color: BaseColors.backgroundColor),
                ),
              ),
            ),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}

class CartItem extends StatelessWidget {
  final Cart cart;
  CartItem(
    this.cart, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      direction: DismissDirection.endToStart,
      background: Container(
        color: Colors.red,
      ),
      key: ValueKey(1),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.topLeft,
                    height: 80,
                    child: ClipRRect(
                      child: Image.network(
                        cart.product.image,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          cart.product.name,
                          style: GoogleFonts.raleway().copyWith(
                              fontSize: 15, fontWeight: FontWeight.bold),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          cart.productPrice.name,
                          style: GoogleFonts.raleway().copyWith(fontSize: 14),
                        ),
                        Text(
                          "\$${CurrencyUtils.usdFormat(cart.productPrice.amount).toString()}",
                          style: GoogleFonts.poppins().copyWith(
                            fontSize: 18,
                            color: BaseColors.primaryColor,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      color: BaseColors.accentColor,
                      borderRadius: BorderRadius.circular(666),
                    ),
                    height: 30,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: BaseColors.primaryColor,
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Text(
                                "-",
                                style: GoogleFonts.poppins().copyWith(
                                  fontSize: 12,
                                  color: BaseColors.backgroundColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            child: Center(
                              child: Text(
                                "1",
                                style: GoogleFonts.poppins().copyWith(
                                  fontSize: 12,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: BaseColors.primaryColor,
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Text(
                                "+",
                                style: GoogleFonts.poppins().copyWith(
                                  fontSize: 12,
                                  color: BaseColors.backgroundColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // Expanded(
                //   flex: 1,
                //   child: Container(
                //     decoration: BoxDecoration(
                //       color: BaseColors.primaryColor,
                //       borderRadius: BorderRadius.circular(666),
                //     ),
                //     height: 30,
                //     child: Center(
                //       child: Text(
                //         "+Add",
                //         style: GoogleFonts.poppins().copyWith(
                //           fontSize: 12,
                //           color: BaseColors.backgroundColor,
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
                SizedBox(width: 23),
              ],
            ),
          ),
          Divider(
            height: 30,
          )
        ],
      ),
    );
  }
}
