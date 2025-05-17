// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'view_food.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //List of Menu
  final List<Menu> _myCat = [
    Menu(imageurl: "assets/png/hamburguer.png", menutitle: "Burger"),
    Menu(imageurl: "assets/png/pizza.png", menutitle: "Pizza"),
    Menu(imageurl: "assets/png/taco.png", menutitle: "Sandwich"),
  ];

  // FoodItems
  final List<FoodItems> myfoodz = [
    FoodItems(
        imagePath: "assets/png/hamburguer.png",
        title: "Chicken Burger King",
        subtitle: "200 grams chicken + cheese  Lettuce + tomato",
        price: 22.5,
        rating: 4.5,
        star: Icons.star,
        add: Icons.add),

    //
    FoodItems(
        imagePath: "assets/png/hamburguer.png",
        title: " Cheese Burger",
        subtitle: "200 grams chicken + cheese  Lettuce + tomato",
        price: 22.5,
        rating: 4.5,
        star: Icons.star,
        add: Icons.add),

    //
    FoodItems(
        imagePath: "assets/png/hamburguer.png",
        title: "Veggie Burger",
        subtitle: "200 gram cheese  Lettuce + tomato",
        price: 22.5,
        rating: 4.5,
        star: Icons.star,
        add: Icons.add),

    //
    FoodItems(
        imagePath: "assets/png/hamburguer.png",
        title: "Meat Burger",
        subtitle: "200 grams chicken , onions +  Lettuce + tomato",
        price: 30.5,
        rating: 3.5,
        star: Icons.star,
        add: Icons.add),
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
                    label: Text(category.menutitle),
                    avatar: Image.asset(
                      category.imageurl,
                      // height: 40,
                      // width: 40,
                    ),
                    backgroundColor: Colors.blueAccent,
                    labelStyle: TextStyle(color: Colors.white, fontSize: 20, fontFamily: "Agbalumo"),
                  );
                },
              ),
            ),

            SizedBox(height: 15),

            //food items : //create a class for the food items
            Wrap(
                spacing: 8,
                runSpacing: 8,
                children: List.generate(myfoodz.length, (index) {
                  final food = myfoodz[index];
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
                      height: 270,
                      width: 200,
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.black.withOpacity(0.12),
                        ),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.12),
                              spreadRadius: 0,
                              blurRadius: 8,
                              offset: Offset(0, 1))
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //ratings
                          Row(
                            children: [
                              Icon(
                                food.star,
                                color: Color(0xffFF9431),
                              ),
                              SizedBox(width: 5),
                              Text(food.rating.toString()),
                            ],
                          ),

                          //  burger imagee
                          Image.asset(
                            food.imagePath,
                            height: 80,
                          ),

                          //title
                          Text(food.title,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: "DmSans",
                                  color: Color(0xff0D0D0D),
                                  fontWeight: FontWeight.w600)),
                          //subtitle
                          Text(
                            food.subtitle,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: "DmSans",
                                color: Color(0xff0D0D0D),
                                fontSize: 12,
                                fontWeight: FontWeight.w400),
                          ),
                          SizedBox(height: 8),

                          //price and add button
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "\$ ${food.price}",
                                style: TextStyle(
                                    fontFamily: "DmSans",
                                    color: Color(0xffFF9431),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600),
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  height: 28,
                                  width: 28,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color(0xffFF9431)),
                                  child: Icon(
                                    food.add,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
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

//new category class
class Menu {
  final String menutitle;
  final String imageurl;

  Menu({required this.menutitle, required this.imageurl});


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
  final num price;
  final num rating;
  final IconData star;
  final IconData add;

  FoodItems({
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.rating,
    required this.star,
    required this.add,
  });
}
