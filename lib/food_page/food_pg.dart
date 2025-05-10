import 'package:flutter/material.dart';

//shortcut to select MyWidgt and change the name : Ctrl + D

class FoodPage extends StatefulWidget {
  const FoodPage({super.key});

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text("Food Page"),
      ),
    );
  }
}
