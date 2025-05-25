// import 'package:about_me/home/homepage.dart';
// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'screens/category/category.dart';
import 'screens/home/homepage.dart';
import 'settings/settings.dart';
import 'food_page/food_pg.dart';

class MyBottomNavBar extends StatefulWidget {
  const MyBottomNavBar({super.key, required this.username});

  final String username;

  @override
  _MyBottomNavBarState createState() => _MyBottomNavBarState();
}

class _MyBottomNavBarState extends State<MyBottomNavBar> {
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      HomePage(
        username: widget.username,
      ),
      const FoodPage(),
      const MyCategoryPage(),
      const SettingsPage(),
    ];
    return Scaffold(
      body: pages[pageIndex],
      bottomNavigationBar: buildMyNavBar(context),
    );
  }

  Container buildMyNavBar(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.black.withOpacity(0.20),
        ),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.20),
              spreadRadius: 0,
              blurRadius: 15,
              offset: Offset(0, -3))
        ],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                pageIndex = 0;
              });
            },
            icon: pageIndex == 0
                ? SvgPicture.asset(
                    "assets/svg/Home-Fill.svg",
                    color: Color(0xffFF9431),
                    // size: 35,
                  )
                : SvgPicture.asset(
                    "assets/svg/Home-Fill.svg",
                    // color: Color(0xffFF9431),
                    // size: 35,
                  ),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                pageIndex = 1;
              });
            },
            icon: pageIndex == 1
                ? SvgPicture.asset(
                    "assets/svg/Cart.svg",
                    color: Color(0xffFF9431),
                  )
                : SvgPicture.asset(
                    "assets/svg/Cart.svg",
                  ),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                pageIndex = 2;
              });
            },
            icon: pageIndex == 2
                ? SvgPicture.asset(
                    "assets/svg/Category.svg",
                    color: Color(0xffFF9431),
                  )
                : SvgPicture.asset(
                    "assets/svg/Category.svg",
                  ),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                pageIndex = 3;
              });
            },
            icon: pageIndex == 3
                ? SvgPicture.asset(
                    "assets/svg/User.svg",
                    color: Color(0xffFF9431),
                  )
                : SvgPicture.asset(
                    "assets/svg/User.svg",
                  ),
          ),
        ],
      ),
    );
  }
}
