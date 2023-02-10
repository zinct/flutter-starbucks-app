import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:m_toast/m_toast.dart';
import 'package:starbacks/core/resources/colors.dart';
import 'package:starbacks/core/utils/currency_utils.dart';
import 'package:starbacks/features/cart/domain/usecase/create_cart.dart';
import 'package:starbacks/features/cart/presentation/cubit/cart/cart_cubit.dart';
import 'package:starbacks/features/product/domain/entities/product.dart';
import 'package:starbacks/features/product/presentation/cubit/productprice/product_price_cubit.dart';
import 'package:starbacks/features/product/presentation/widget/product_price_widget.dart';
import 'package:starbacks/injection_container.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var product = ModalRoute.of(context)?.settings.arguments as Product;

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => ProductPriceCubit(product.prices[0]),
        ),
        BlocProvider(
          create: (context) => getIt<CartCubit>(),
        ),
      ],
      child: ProductDetailScreenWidget(),
    );
  }
}

class ProductDetailScreenWidget extends StatelessWidget {
  const ProductDetailScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var priceCubit = context.read<ProductPriceCubit>();
    var cartCubit = context.read<CartCubit>();
    var product = ModalRoute.of(context)?.settings.arguments as Product;

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
              Icons.favorite,
              size: 35,
              color: Colors.red,
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
            BlocListener<CartCubit, CartState>(
              listener: (context, state) {
                if (state.status == CartStatus.added) {
                  ShowMToast().successToast(
                    context,
                    message: 'Berhasil menambahkan Ke Cart',
                    alignment: Alignment.bottomCenter,
                  );
                }
              },
              child: Container(),
            ),
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
                        tag: product.id,
                        child: Image.network(
                          product.image,
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
                          product.name,
                          style: GoogleFonts.raleway().copyWith(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        BlocBuilder<ProductPriceCubit, ProductPrice>(
                          builder: (context, state) {
                            return Text(
                              "\$${CurrencyUtils.usdFormat(state.amount).toString()}",
                              style: GoogleFonts.poppins().copyWith(
                                fontSize: 22,
                                color: BaseColors.primaryColor,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  BlocBuilder<ProductPriceCubit, ProductPrice>(
                    builder: (context, state) {
                      return Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: product.prices
                              .map(
                                (e) => ProductPriceWidget(
                                  label: e.name,
                                  isSelected:
                                      priceCubit.selectedPrice.name == e.name,
                                  onTap: () => priceCubit.changePrice(e),
                                ),
                              )
                              .toList(),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Description",
                    style: GoogleFonts.raleway().copyWith(
                      fontSize: 16,
                      color: Color(0xFF6D6D6D),
                    ),
                  ),
                  Divider(),
                  Text(
                    "This is a simple Starbucks app repository, featuring a cart system that allows users to add menu items to their virtual cart.",
                    style: GoogleFonts.raleway().copyWith(
                      fontSize: 18,
                      color: Color(0xFF6D6D6D),
                    ),
                  ),
                  SizedBox(height: 100),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: InkWell(
                onTap: () => cartCubit.createCart(
                    CreateCartParams(product, priceCubit.selectedPrice, 1)),
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
                        fontSize: 20,
                        color: BaseColors.backgroundColor,
                      ),
                    ),
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
