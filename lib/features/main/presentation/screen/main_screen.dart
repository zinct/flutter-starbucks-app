import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:starbacks/core/constants/router.dart';
import 'package:starbacks/core/resources/colors.dart';
import 'package:starbacks/features/home/presentation/screen/home_screen.dart';
import 'package:starbacks/features/main/presentation/cubit/navigation/navigation_cubit.dart';
import 'package:starbacks/features/whistlist/screen/whistlist_screen.dart';
import 'package:unicons/unicons.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavigationCubit(),
      child: MainScreenWidget(),
    );
  }
}

class MainScreenWidget extends StatelessWidget {
  MainScreenWidget({
    Key? key,
  }) : super(key: key);

  final selectedWidget = [
    const HomeScreen(),
    const WhistlistScreen(),
  ];

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
          margin: const EdgeInsets.only(left: 20),
          decoration: const BoxDecoration(
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
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: BaseColors.accentColor,
            ),
            width: 50,
            child: IconButton(
              icon: const Icon(
                UniconsLine.shopping_bag,
                size: 35,
                color: BaseColors.darkColor,
              ),
              onPressed: () => Navigator.of(context).pushNamed(ROUTER.CART),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
        ],
      ),
      body: BlocBuilder<NavigationCubit, int>(
        builder: (context, state) => selectedWidget[state],
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: BaseColors.primaryColor,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: BaseColors.backgroundColor,
        unselectedItemColor: BaseColors.backgroundColor,
        items: [
          const BottomNavigationBarItem(
            icon: Icon(UniconsLine.home),
            label: "",
            backgroundColor: BaseColors.primaryColor,
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(UniconsLine.wallet),
          //   label: "",
          //   backgroundColor: BaseColors.primaryColor,
          // ),
          const BottomNavigationBarItem(
            icon: Icon(UniconsLine.heart),
            label: "",
            backgroundColor: BaseColors.primaryColor,
          ),
        ],
        onTap: (value) => context.read<NavigationCubit>().changePosition(value),
      ),
    );
  }
}
