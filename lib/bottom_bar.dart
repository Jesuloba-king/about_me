import 'package:about_me/home/homepage.dart';
import 'package:flutter/material.dart';

import 'settings/settings.dart';
import 'food_page/food_pg.dart';

class MyBottomNavBar extends StatefulWidget {
  const MyBottomNavBar({super.key});

  @override
  _MyBottomNavBarState createState() => _MyBottomNavBarState();
}

class _MyBottomNavBarState extends State<MyBottomNavBar> {
  int pageIndex = 0;

  final List<Widget> pages = [
    const HomePage(),
    const FoodPage(),
    const SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
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
                ? const Icon(
                    Icons.home_filled,
                    color: Color(0xffFF9431),
                    size: 35,
                  )
                : const Icon(
                    Icons.home_outlined,
                    color: Color(0xffFF9431),
                    size: 35,
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
                ? const Icon(
                    Icons.shopping_bag,
                    color: Color(0xffFF9431),
                    size: 35,
                  )
                : const Icon(
                    Icons.shopping_bag_outlined,
                    color: Color(0xffFF9431),
                    size: 35,
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
                ? const Icon(
                    Icons.settings,
                    color: Color(0xffFF9431),
                    size: 35,
                  )
                : const Icon(
                    Icons.settings_outlined,
                    color: Color(0xffFF9431),
                    size: 35,
                  ),
          ),
        ],
      ),
    );
  }
}
