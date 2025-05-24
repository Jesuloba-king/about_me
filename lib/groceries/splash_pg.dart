import 'package:flutter/material.dart';

import '../screens/home/homepage.dart';
import 'login_pg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // @override
  // void initState() {
  //   // // Navigate to the home screen after a delay
  //   // Future.delayed(const Duration(seconds: 3), () {
  //   //   Navigator.pushReplacementNamed(context, '/home');
  //   // });
  //   super.initState();
  // }

  @override
  void initState() {
    //navigate to the login screen after a delay

    Future.delayed(const Duration(seconds: 3), () {
      // print(
      //     'Three second has passed to navigate to login.'); // Prints after 3 second.

      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return LoginPage();
      }));
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromARGB(255, 223, 178, 138),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        // width: MediaQuery.of(context).size.width,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xffF9F3D0), Color(0xffDFB398)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "G R O C E R Y",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 50,
                fontFamily: "Agbalumo",
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "A simple grocery app",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontFamily: "DmSans",
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
