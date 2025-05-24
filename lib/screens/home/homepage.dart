// ignore_for_file: deprecated_member_use

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;

import '../../bottom_bar.dart';
import 'models.dart';
import 'view_food.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    fetchAllProducts();
    super.initState();
  }

  bool isLoading = false;

  List<ProductItems> allProducts = [];

  Future<void> fetchAllProducts() async {
    // Logic to handle user login
    setState(() {
      isLoading = true;
    });

    final String url = "https://fakestoreapi.com/products";
    final response = await http.get(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        // 'Authorization' : "Bearer token_here"
      },
    );

    //set the loading to false
    setState(() {
      isLoading = false;
    });

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);

      allProducts = data.map((items) {
        return ProductItems.fromJson(items);
      }).toList();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.green,
        content: Text(
          "All products fetched successful!",
          style: TextStyle(
            fontFamily: "Agbalumo",
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ));
    } else {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog.adaptive(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              title: Text("Error"),
              content: Text(
                // "Login failed. Invalid credentials."
                response.body,
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Dismiss",
                    style: TextStyle(color: Colors.red, fontSize: 18),
                  ),
                ),
              ],
            );
          });
    }
  }

  //List of categories
  final List<Categories> _myCat = [
    Categories(imagePath: "assets/png/hamburguer.png", text: "Burger"),
    Categories(imagePath: "assets/png/pizza.png", text: "Pizza"),
    Categories(imagePath: "assets/png/taco.png", text: "Sandwich"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: Row(
          children: [
            Icon(
              Icons.pin_drop_rounded,
              color: Color(0xffFF9431),
            ),
            SizedBox(width: 8),
            Text("Lagos, Nigeria"),
            SizedBox(width: 8),
            Icon(
              Icons.keyboard_arrow_down_rounded,
              color: Color(0xffFF9431),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //order food and rider image
            Row(
              children: [
                Expanded(
                  child: Text(
                    "Order Your Food Fast and Free",
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
                  ),
                ),
                Image.asset("assets/png/delivery 1.png")
              ],
            ),

            SizedBox(
              height: 20,
            ),

            //search textfield and filter options
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: TextFormField(
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        // color: Color(0xffCCCCCC),
                        fontSize: 18),
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1, color: Color(0xffE6E6E6)),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 1,
                            // color: Color(0xffE6E6E6)
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1, color: Color(0xffE6E6E6)),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        prefixIcon: Icon(
                          Icons.search_rounded,
                        ),
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Color(0xffCCCCCC),
                            fontSize: 18),
                        hintText: "Search"),
                  ),
                ),

                SizedBox(width: 12),

                //filter button
                Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Color(0xffE6E6E6), width: 1),
                      borderRadius: BorderRadius.circular(10)),
                  child: Icon(Icons.settings_suggest_outlined),
                )
              ],
            ),

            //
            SizedBox(
              height: 20,
            ),

            //Categories : Let's create a class of Categories - An Image and a Text
            // then create a list of the food categories.
            // show the category as a list
            Text("Categories",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: "DmSans",
                    fontSize: 25,
                    color: Color(0xff0D0D0D),
                    fontWeight: FontWeight.w600)),
            SizedBox(
              height: 8,
            ),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: List.generate(
                _myCat.length,
                (index) {
                  final category = _myCat[index];
                  return Chip(
                    label: Text(category.text),
                    avatar: Image.asset(
                      category.imagePath,
                      // height: 40,
                      // width: 40,
                    ),
                    backgroundColor: Color(0xffFF9431),
                    labelStyle: TextStyle(color: Colors.white),
                  );
                },
              ),
            ),

            SizedBox(height: 15),

            //food items : //create a class for the food items
            isLoading
                ? Center(
                    child: SpinKitHourGlass(
                      color: Color(0xffEEA54D),
                      size: 50.0,
                    ),
                  )
                : Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: List.generate(allProducts.length, (index) {
                      final food = allProducts[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return FoodDetails(
                              myfood: food,
                            );
                          }));
                        },
                        child: Container(
                          // height: 270,
                          width: 200,
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: Color(0xffF0E9D2),
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              //ratings

                              //  burger imagee
                              Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Color(0xffF2F2F2),
                                      Color(0xffFFFFFF),
                                      Color(0xffF2F2F2),
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Image.network(
                                  food.image.toString(),
                                  height: 110,
                                ),
                              ),

                              SizedBox(height: 15),

                              //title
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(food.title.toString(),
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                                fontFamily: "DmSans",
                                                color: Color(0xff0D0D0D),
                                                fontWeight: FontWeight.w600)),
                                        SizedBox(height: 8),
                                        Text(
                                          food.category.toString(),
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              fontFamily: "DmSans",
                                              color: Color(0xff0D0D0D),
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    ),
                                  ),

                                  //price
                                  Text(
                                    "\$ ${food.price}",
                                    style: TextStyle(
                                        fontFamily: "DmSans",
                                        color: Color(0xffFF9431),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                              //subtitle
                            ],
                          ),
                        ),
                      );
                    })),
          ],
        ),
      ),
    );
  }
}

//category class
class Categories {
  final String imagePath;
  final String text;

  Categories({required this.imagePath, required this.text});
}

class FoodItems {
  final String imagePath;
  final String title;
  final String subtitle;
  final String price;
  final String rating;
  final IconData icon;
  final IconData add;

  FoodItems({
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.rating,
    required this.icon,
    required this.add,
  });
}
