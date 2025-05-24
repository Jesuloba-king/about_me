import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
                controller: emailController,
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
                  hintText: "Enter your email",
                  hintStyle: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 16,
                  ),
                  prefixIcon: Icon(
                    Icons.email,
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
                  suffixIcon: Icon(Icons.visibility, color: Colors.grey[400]),
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

            Container(
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

              // TextButton(
              //   onPressed: () {
              //     // Handle login logic here
              //     print("Email: ${emailController.text}");
              //     print("Password: ${passwordController.text}");
              //   },
              //   child: Text(
              //     "Login",
              //     style: TextStyle(
              //       color: Colors.white,
              //       fontSize: 18,
              //       fontWeight: FontWeight.bold,
              //     ),
              //   ),
              // ),
            ),
          ],
        ),
      ),
    );
  }
}
