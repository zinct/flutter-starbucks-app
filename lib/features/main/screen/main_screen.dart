import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:starbacks/core/constants/router.dart';
import 'package:starbacks/core/resources/colors.dart';
import 'package:starbacks/features/home/home_screen.dart';
import 'package:starbacks/features/whistlist/screen/whistlist_screen.dart';
import 'package:unicons/unicons.dart';

class MainScreen extends StatefulWidget {
  MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final selectedWidget = [
    HomeScreen(),
    WhistlistScreen(),
  ];

  int currentIndex = 0;

  void _handleBottomNavigation(selectedIndex) {
    setState(() {
      currentIndex = selectedIndex;
    });
  }

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
            child: IconButton(
              icon: Icon(
                UniconsLine.shopping_bag,
                size: 35,
                color: BaseColors.darkColor,
              ),
              onPressed: () => Navigator.of(context).pushNamed(ROUTER.CART),
            ),
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
      body: selectedWidget[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: BaseColors.primaryColor,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: BaseColors.backgroundColor,
        unselectedItemColor: BaseColors.backgroundColor,
        items: [
          BottomNavigationBarItem(
            icon: Icon(UniconsLine.home),
            label: "",
            backgroundColor: BaseColors.primaryColor,
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(UniconsLine.wallet),
          //   label: "",
          //   backgroundColor: BaseColors.primaryColor,
          // ),
          BottomNavigationBarItem(
            icon: Icon(UniconsLine.heart),
            label: "",
            backgroundColor: BaseColors.primaryColor,
          ),
        ],
        onTap: _handleBottomNavigation,
      ),
    );
  }
}
