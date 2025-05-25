import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'groceries/splash_pg.dart';
import 'screens/intro/intro_pg.dart';

// import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'D E L I V E R Y',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Color(0xffF0E9D2)),
            useMaterial3: true,
            fontFamily: "Jakarta"),
        home: SplashScreen()
        // IntroPage(),
        );
  }
}
