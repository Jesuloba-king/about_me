import 'package:flutter/material.dart';

import 'homepage.dart';
import 'models.dart';

class FoodDetails extends StatefulWidget {
  const FoodDetails({super.key, required this.myfood});

  final ProductItems myfood;

  @override
  State<FoodDetails> createState() => _FoodDetailsState();
}

class _FoodDetailsState extends State<FoodDetails> {
  bool _isLiked = false;

  //likes
  void onTapLike() {
    setState(() {
      _isLiked = !_isLiked;
    });
    if (_isLiked == true) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            backgroundColor: Color(0xffD86804),
            content: Text('You Liked this!')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            // backgroundColor: Color(0xffD86804),
            content: Text('You disliked this!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    int counter = widget.myfood.rating?.count?.toInt() ?? 0;
    // int _decrease = 0;
    void increaseAmount() {
      setState(() {
        counter++;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            backgroundColor: Color(0xffD86804), content: Text('You added!')),
      );
    }

    void decreaseCounter() {
      setState(() {
        counter--;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('You removed!')),
      );
    }

    return Scaffold(
      backgroundColor: Color(0xffD86804),
      body: Column(
        children: [
          SizedBox(height: 60),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //arrow back
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        border: Border.all(color: Colors.white, width: 1.5),
                        borderRadius: BorderRadius.circular(10)),
                    child: Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: Colors.white,
                    ),
                  ),
                ),

                //like
                InkWell(
                  onDoubleTap: onTapLike,
                  child: Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        border: Border.all(color: Colors.white, width: 1.5),
                        borderRadius: BorderRadius.circular(10)),
                    child: Icon(
                      !_isLiked
                          ? Icons.favorite_border_outlined
                          : Icons.favorite,
                      color: !_isLiked ? Colors.white : Color(0xffFF9431),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Image.network(
                widget.myfood.image.toString(),
                height: 250,
              ),
            ),
          ),
          Expanded(
              child: Container(
            padding: EdgeInsets.all(25),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25))),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          widget.myfood.title.toString(),
                          style: TextStyle(
                              fontFamily: "DmSans",
                              fontSize: 25,
                              color: Color(0xff0D0D0D),
                              fontWeight: FontWeight.w600),
                        ),
                      ),

                      //
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Color(0xffFF9431),
                          ),
                          SizedBox(width: 5),
                          Text(
                            widget.myfood.rating?.rate.toString() ?? "0.0",
                            style: TextStyle(
                                fontFamily: "DmSans",
                                fontSize: 18,
                                color: Color(0xff0D0D0D),
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(width: 8),
                          Text(
                            "(45 reviews)",
                            style: TextStyle(
                                fontFamily: "DmSans",
                                fontSize: 12,
                                color: Color(0xff0D0D0D),
                                fontWeight: FontWeight.w300),
                          ),
                        ],
                      ),
                    ],
                  ),

                  //price and add/reduce
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\$ ${widget.myfood.price}",
                        style: TextStyle(
                            fontFamily: "DmSans",
                            color: Color(0xffFF9431),
                            fontSize: 24,
                            fontWeight: FontWeight.w600),
                      ),
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: Color(0xffFFF1E5),
                            borderRadius: BorderRadius.circular(30)),
                        child: Row(
                          children: [
                            //subtract
                            GestureDetector(
                              onTap: decreaseCounter,
                              child: Container(
                                height: 35,
                                width: 35,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xffFF9431)),
                                child: Icon(
                                  Icons.remove,
                                  color: Colors.white,
                                ),
                              ),
                            ),

                            SizedBox(width: 15),

                            //increase counter
                            Text(
                              "$counter",
                              style: TextStyle(
                                  color: Color(0xff0D0D0D),
                                  fontSize: 24,
                                  fontFamily: "DmSans",
                                  fontWeight: FontWeight.w600),
                            ),

                            //add
                            SizedBox(width: 15),
                            GestureDetector(
                              onTap: increaseAmount,
                              child: Container(
                                height: 35,
                                width: 35,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xffFF9431)),
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 30,
                  ),

                  //size , energy and delivery
                  // for (int i = 0; i < 3; i++)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SectionCard(
                        title: "Size",
                        text: "Medium",
                      ),
                      //
                      SectionCard(
                        title: "Energy",
                        text: "544 KCal",
                      ),

                      //delivery
                      SectionCard(
                        title: "Delivery",
                        text: "45 mins",
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 30,
                  ),

                  //about
                  Text(
                    "About",
                    style: TextStyle(
                        color: Color(0xff0D0D0D),
                        fontSize: 20,
                        fontFamily: "DmSans",
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 8),
                  Text(
                    widget.myfood.description.toString(),
                    style: TextStyle(
                        color: Color(0xff0D0D0D),
                        fontSize: 14,
                        fontFamily: "DmSans",
                        fontWeight: FontWeight.w400),
                  ),

                  SizedBox(
                    height: 50,
                  ),

                  //button
                  Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: Color(0xffFF9431),
                        borderRadius: BorderRadius.circular(15)),
                    child: Center(
                      child: Text(
                        "Buy Now",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: "DmSans",
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
}

class SectionCard extends StatelessWidget {
  const SectionCard({
    super.key,
    required this.title,
    required this.text,
  });

  final String title, text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      width: 130,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Color(0xffFF9431),
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //size and dropdown
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                    color: Color(0xffFF9431),
                    fontSize: 14,
                    fontFamily: "DmSans",
                    fontWeight: FontWeight.w500),
              ),
              Icon(
                Icons.keyboard_arrow_down_sharp,
                color: Color(0xffFF9431),
              )
            ],
          ),
          Text(
            text,
            style: TextStyle(
                color: Color(0xff0D0D0D),
                fontSize: 18,
                fontFamily: "DmSans",
                fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}
