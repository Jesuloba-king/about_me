import 'package:flutter/material.dart';

import '../../bottom_bar.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(25),
        // alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(
          // gradient: LinearGradient(
          //     begin: Alignment.bottomCenter,
          //     end: Alignment.bottomLeft,
          //     colors: [Color(0xffc4c4c4), Colors.black.withOpacity(0.50)]),
          image: DecorationImage(
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.black38, BlendMode.srcOver),
            image: AssetImage("assets/png/my_back.jpg"),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 120.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "Find and Get Your Best Food",
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 36,
                  fontWeight: FontWeight.w600,
                  // height: 34
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Find the most delicious food with the best quality and free delivery here",
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  // height: 24
                ),
              ),

              SizedBox(
                height: 40,
              ),

              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return MyBottomNavBar();
                    }));
                  },
                  child: CircleAvatar(
                    radius: 35,
                    backgroundColor: Color(0xffFF9431),
                    child: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),

              //skip
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return MyBottomNavBar();
                  }));
                },
                child: Center(
                  child: Text(
                    "Skip",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.grey.shade400,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
