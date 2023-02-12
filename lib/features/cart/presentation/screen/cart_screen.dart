import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:starbacks/core/resources/colors.dart';
import 'package:starbacks/core/utils/currency_utils.dart';
import 'package:starbacks/features/cart/domain/entities/cart.dart';
import 'package:starbacks/features/cart/domain/usecase/change_quantity_cart.dart';
import 'package:starbacks/features/cart/domain/usecase/remove_cart.dart';
import 'package:starbacks/features/cart/presentation/cubit/cart/cart_cubit.dart';
import 'package:unicons/unicons.dart';

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
        child: BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            if (state.status == CartStatus.loading)
              return Center(
                  child: Padding(
                padding: const EdgeInsets.only(bottom: 100),
                child: CircularProgressIndicator(),
              ));
            return Container(
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                  if (state.cart.isEmpty)
                    Center(
                      child: Lottie.asset('assets/lottie/search_empty.json'),
                    ),
                  if (state.cart.isNotEmpty)
                    Column(
                      children: [
                        Column(
                          children: state.cart.length == 0
                              ? []
                              : state.cart
                                  .map((e) => CartItem(
                                        e.cart,
                                        onRemove: (_) => context
                                            .read<CartCubit>()
                                            .removeCart(
                                                RemoveCartparams(e.cart)),
                                        onChange: (p0) => context
                                            .read<CartCubit>()
                                            .changeQuantity(e, p0),
                                        key: ValueKey(e.product.id.toString() +
                                            e.productPrice.name.toString()),
                                      ))
                                  .toList(),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Subtotal",
                              style:
                                  GoogleFonts.raleway().copyWith(fontSize: 20),
                            ),
                            Text(
                              "\$${CurrencyUtils.usdFormat(state.getSubtotal()).toString()}",
                              style:
                                  GoogleFonts.raleway().copyWith(fontSize: 20),
                            ),
                          ],
                        ),
                        SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Taxes",
                              style:
                                  GoogleFonts.raleway().copyWith(fontSize: 20),
                            ),
                            Text(
                              "\$1.32",
                              style:
                                  GoogleFonts.raleway().copyWith(fontSize: 20),
                            ),
                          ],
                        ),
                        SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Delivery",
                              style:
                                  GoogleFonts.raleway().copyWith(fontSize: 20),
                            ),
                            Text(
                              "\$2.83",
                              style:
                                  GoogleFonts.raleway().copyWith(fontSize: 20),
                            ),
                          ],
                        ),
                        SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Total",
                              style: GoogleFonts.raleway().copyWith(
                                  fontSize: 20, color: BaseColors.primaryColor),
                            ),
                            Text(
                              "\$${CurrencyUtils.usdFormat(state.getCalculateTotal()).toString()}",
                              style: GoogleFonts.raleway().copyWith(
                                  fontSize: 20, color: BaseColors.primaryColor),
                            ),
                          ],
                        ),
                        SizedBox(height: 40),
                        InkWell(
                          onTap: context.read<CartCubit>().emptyCart,
                          child: Container(
                            decoration: BoxDecoration(
                              color: BaseColors.primaryColor,
                              borderRadius: BorderRadius.circular(666),
                            ),
                            height: 55,
                            child: Center(
                              child: Text(
                                "Add to bag",
                                style: GoogleFonts.raleway().copyWith(
                                    fontSize: 20,
                                    color: BaseColors.backgroundColor),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 50)
                      ],
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class CartItem extends StatelessWidget {
  final Cart cart;
  final Function(ChangeQuantityCartAction) onChange;
  final onRemove;

  CartItem(
    this.cart, {
    required this.onChange,
    required this.onRemove,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      direction: DismissDirection.endToStart,
      onDismissed: onRemove,
      background: Container(
        padding: EdgeInsets.only(right: 30),
        alignment: Alignment.centerRight,
        color: Colors.red,
        child: Icon(
          UniconsLine.trash_alt,
          color: BaseColors.backgroundColor,
          size: 40,
        ),
      ),
      key: UniqueKey(),
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
                          child: InkWell(
                            onTap: () =>
                                onChange(ChangeQuantityCartAction.decrement),
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
                        ),
                        Expanded(
                          child: Container(
                            child: Center(
                              child: Text(
                                cart.quantity.toString(),
                                style: GoogleFonts.poppins().copyWith(
                                  fontSize: 12,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () =>
                                onChange(ChangeQuantityCartAction.increment),
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
