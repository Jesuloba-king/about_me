import 'package:flutter/material.dart';

class MyCategoryPage extends StatefulWidget {
  const MyCategoryPage({super.key});

  @override
  State<MyCategoryPage> createState() => _MyCategoryPageState();
}

class _MyCategoryPageState extends State<MyCategoryPage> {
  final List<NewCategory> _myCat = [
    NewCategory(
        imagePath: "assets/svg/veggie.png",
        text: "Vegetables",
        backgroundColor: Color(0xffD3E6F7)),
    NewCategory(
        imagePath: "assets/svg/fruit 2.png",
        text: "Fruits",
        backgroundColor: Color(0xffEFF7D3)),
    NewCategory(
        imagePath: "assets/svg/Ingridient-png 1.png",
        text: "Ingredients",
        backgroundColor: Color(0xffD3F7E0)),
    NewCategory(
        imagePath: "assets/svg/spice-png 1.png",
        text: "Spicy",
        backgroundColor: Color(0xffF7D3EA)),
    NewCategory(
        imagePath: "assets/svg/meat 1.png",
        text: "Meat",
        backgroundColor: Color(0xffDBD3F7)),
    NewCategory(
        imagePath: "assets/svg/Side-Dishes.png",
        text: "Side Dishes",
        backgroundColor: Color(0xffF7E4D3)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //order food and rider image

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
                          borderSide:
                              BorderSide(width: 1, color: Color(0xffF0E9D2)),
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
                      color: Color(0xffF9F3D0).withOpacity(0.50),
                      border: Border.all(color: Color(0xffE6E6E6), width: 1),
                      borderRadius: BorderRadius.circular(10)),
                  child: Icon(
                    Icons.settings_suggest_outlined,
                    color: Color(0xffEEBB4D),
                  ),
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
            Text("All Categories",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 25,
                    color: Color(0xff0D0D0D),
                    fontWeight: FontWeight.w600)),

            SizedBox(height: 15),

            Wrap(
                spacing: 8,
                runSpacing: 8,
                children: List.generate(_myCat.length, (index) {
                  final food = _myCat[index];
                  return GestureDetector(
                    onTap: () {
                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (context) {
                      //   return FoodDetails(
                      //     myfood: food,
                      //   );
                      // }));
                    },
                    child: Container(
                      // height: 270,
                      width: 150,
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: food.backgroundColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            food.imagePath.toString(),
                            height: 110,
                          ),

                          SizedBox(height: 15),

                          //title
                          Text(food.text.toString(),
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  // fontFamily: "DmSans",
                                  color: Color(0xff0D0D0D),
                                  fontWeight: FontWeight.w600)),
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

class NewCategory {
  final String imagePath;
  final String text;
  final Color backgroundColor;

  NewCategory(
      {required this.imagePath,
      required this.text,
      required this.backgroundColor});
}
