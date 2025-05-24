import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../bottom_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isVisible = false;

  bool isLoading = false;

  Future<void> loginWithEmail(String email, String password) async {
    // final path = Uri.parse("${baseUrl}auth/login");
    final pathurl = Uri.parse("https://fakestoreapi.com/auth/login");

    try {
      // Making a POST / GET / Delete / request to the login endpoint

      //show a dialog for my success messages
    } catch (e) {
      //dialog for catch : failed responses or messages.

      // Handle any exceptions that occur during the request
      print("Error during login: $e");
    }
  }

//second approach
  Future<void> login() async {
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
      // body: jsonEncode({
      //   "username": usernameController.text,
      //   "password": passwordController.text
      // }),
    );

    //set the loading to false
    setState(() {
      isLoading = false;
    });

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.green,
        content: Text(
          "Login successful!",
          style: TextStyle(
            fontFamily: "Agbalumo",
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ));

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => MyBottomNavBar(),
        ),
      );
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

      // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      //   backgroundColor: Colors.red,
      //   content: Text(
      //     "Login failed!",
      //     style: TextStyle(
      //       fontFamily: "Agbalumo",
      //       color: Colors.white,
      //       fontSize: 18,
      //       fontWeight: FontWeight.bold,
      //     ),
      //   ),
      // ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("G R O C E R I E S"),
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        // elevation: 3,
        centerTitle: true,
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.people, size: 100, color: Color(0xffEEA54D)),
            SizedBox(height: 20),
            Text("Welcome to Grocery App",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                )),
            SizedBox(height: 20),
            Text("Enter your login details below",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                )),
            SizedBox(height: 40),

            //email
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextFormField(
                controller: usernameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your username';
                  }
                  // Regular expression for validating email format
                  // String pattern =
                  //     r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
                  // RegExp regex = RegExp(pattern);
                  // if (!regex.hasMatch(value)) {
                  //   return 'Please enter a valid email address';
                  // }
                  // if (value.length < 5) {
                  //   return 'Email must be at least 5 characters long';
                  // }
                  // if (!value.contains('@')) {
                  //   return 'Email must contain "@" symbol';
                  // }
                  // if (!value.contains('.')) {
                  //   return 'Email must contain a "." symbol';
                  // }
                  // if (value.length > 50) {
                  //   return 'Email must not exceed 50 characters';
                  // }
                  // // if (value.contains(' ')) {
                  // //   return 'Email must not contain spaces';
                  // // }
                  // if (value.contains('..')) {
                  //   return 'Email must not contain consecutive dots';
                  // }

                  if (value.length < 5) {
                    return 'Username must be at least 5 characters long';
                  }

                  return null;
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                  // label: Row(
                  //   children: [
                  //     Text("Email"),
                  //     SizedBox(width: 10),
                  //     Icon(
                  //       Icons.email,
                  //       color: Color(0xffEEA54D),
                  //     ),
                  //   ],
                  // ),
                  // labelStyle: TextStyle(
                  //   color: Colors.black,
                  //   fontSize: 18,
                  // ),
                  hintText: "Enter your username",
                  hintStyle: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 16,
                  ),
                  prefixIcon: Icon(
                    Icons.person,
                    color: Colors.grey[400],
                  ),
                  // suffixIcon: Icon(Icons.visibility, color: Colors.grey[400]),
                  filled: true,
                  fillColor: const Color.fromARGB(255, 245, 243, 243),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(width: 0, color: Colors.grey),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(width: 0, color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(width: 0, color: Color(0xffEEA54D)),
                  ),
                ),
                // readOnly: true,
              ),
            ),

            //password
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextFormField(
                controller: passwordController,
                obscureText: isVisible,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  if (value.length < 6) {
                    return 'Password must be at least 6 characters long';
                  }

                  if (!RegExp(r'[!@#\$%^&*(),.?":{}|<>]').hasMatch(value)) {
                    return 'Password must contain at least one uppercase letter,\none lowercase letter, and one number';
                  }
                  return null;
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                  // label: Row(
                  //   children: [
                  //     Text("Password"),
                  //     SizedBox(width: 10),
                  //     Icon(
                  //       Icons.security,
                  //       color: Color(0xffEEA54D),
                  //     ),
                  //   ],
                  // ),
                  // labelStyle: TextStyle(
                  //   color: Colors.black,
                  //   fontSize: 18,
                  // ),
                  hintText: "Enter your password",
                  hintStyle: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 16,
                  ),
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Colors.grey[400],
                  ),
                  suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          isVisible = !isVisible;
                        });
                      },
                      child: Icon(
                          isVisible ? Icons.visibility_off : Icons.visibility,
                          color: Colors.grey[400])),
                  filled: true,
                  fillColor: const Color.fromARGB(255, 245, 243, 243),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(width: 0, color: Colors.grey),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(width: 0, color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(width: 0, color: Color(0xffEEA54D)),
                  ),
                ),
              ),
            ),

            //
            SizedBox(height: 20),

            isLoading
                ? Center(
                    child: SpinKitWave(
                      color: Color(0xffEEA54D),
                      size: 50.0,
                    ),

                    // CircularProgressIndicator(
                    //   color: Color(0xffEEA54D),
                    // ),
                  )
                : GestureDetector(
                    onTap: () {
                      print("This is my email : ${usernameController.text}");
                      print("This is my password : ${passwordController.text}");

                      if (usernameController.text.isNotEmpty &&
                          passwordController.text.isNotEmpty) {
                        // print("Login successful!");
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return MyBottomNavBar();
                        }));
                        // login(usernameController.text, passwordController.text);

                        // isLoading ? null : login();
                      } else {
                        print("Please fill in all fields.");

                        //
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog.adaptive(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                title: Text("Error"),
                                content: usernameController.text.isEmpty &&
                                        passwordController.text.isEmpty
                                    ? Text("Please fill in all fields.")
                                    : usernameController.text.isEmpty
                                        ? Text("Please enter your email.")
                                        : passwordController.text.isEmpty
                                            ? Text(
                                                "Please enter your password.")
                                            : Text(
                                                "Please fill in all fields."),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text("Cancel"),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text("OK"),
                                  ),
                                ],
                              );
                            });
                      }

                      //
                    },
                    child: Container(
                      padding: EdgeInsets.all(15),
                      width: double.infinity,
                      margin: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Color(0xffEEA54D),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                        child: Text(
                          "Login",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account? ",
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Register now!",
                    style: TextStyle(
                      color: Color(0xffEEA54D),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
