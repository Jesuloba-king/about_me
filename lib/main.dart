import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          // This is the theme of your application.
          //
          // TRY THIS: Try running your application with "flutter run". You'll see
          // the application has a purple toolbar. Then, without quitting the app,
          // try changing the seedColor in the colorScheme below to Colors.green
          // and then invoke "hot reload" (save your changes or press the "hot
          // reload" button in a Flutter-supported IDE, or press "r" if you used
          // the command line to start the app).
          //
          // Notice that the counter didn't reset back to zero; the application
          // state is not lost during the reload. To reset the state, use hot
          // restart instead.
          //
          // This works for code too, not just values: Most code changes can be
          // tested with just a hot reload.
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          fontFamily: "Jakarta"),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  // final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _increase = 0;

  int _decrease = 0;
  void increaseAmount() {
    setState(() {
      _increase++;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('You liked this!')),
    );
  }

  void _decreaseCounter() {
    setState(() {
      _decrease--;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('You disliked this!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 2,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        // foregroundColor: Colors.red,
        surfaceTintColor: Colors.white,
        // leading: Icon(
        //   Icons.menu,
        //   color: Colors.black,
        // ),
        //to comment a code use Ctrl + /

        centerTitle: false,
        title: GestureDetector(
          onTap: () {
            print("Name is tapped");
          },
          child: Text(
            "DAVID AJK",
            style: TextStyle(
                color: Colors.black,
                fontSize: 25,
                // fontFamily: "Agbalumo",
                fontWeight: FontWeight.w600),
          ),
        ),

        actions: [
          Icon(
            Icons.work,
            color: Colors.black,
          ),
          GestureDetector(
            onDoubleTap: () {
              print("Work is Double tapped");
            },
            child: Text(
              "WORK",
              style: TextStyle(
                  color: Colors.black,
                  // fontFamily: "Agbalumo",
                  fontSize: 25,
                  fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(
            width: 25,
          ),
          Icon(
            Icons.person_2_rounded,
            color: Colors.black,
          ),
          GestureDetector(
            onTap: () {
              print("About is tapped");
            },
            child: Text(
              "ABOUT",
              style: TextStyle(
                  color: Colors.black,
                  // fontFamily: "Agbalumo",
                  fontSize: 25,
                  fontWeight: FontWeight.w600),
            ),
          )
        ],
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            //first round shape
            Container(
              height: 200,
              width: 200,
              // color: Colors.grey,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 231, 236, 226),
                  shape: BoxShape.circle,
                  // border: Border.all(color: Colors.black, width: 2),
                  // borderRadius: BorderRadius.only(
                  //     topLeft: Radius.circular(20),
                  //     bottomLeft: Radius.circular(20)),
                  image: DecorationImage(
                      // fit: BoxFit.cover,
                      image: AssetImage("assets/png/THA_5039.jpg"))),
            ),

            // //2nd style of round shape
            // Text("2nd style of round shape"),
            // CircleAvatar(
            //     radius: 100,
            //     backgroundColor: const Color.fromARGB(255, 231, 236, 226),
            //     // foregroundColor: Colors.red,
            //     // backgroundImage: AssetImage("assets/png/THA_5039.jpg"),
            //     child: CircleAvatar(
            //       radius: 80,
            //       backgroundColor: const Color.fromARGB(255, 231, 236, 226),
            //       child: Image.asset("assets/png/THA_5039.jpg"),
            //       // backgroundImage: AssetImage("assets/png/THA_5039.jpg"),
            //     ),
            //   ),

            //how to use svg images or pictures:
            // SvgPicture.asset(),
            SizedBox(
              height: 10,
            ),
            // Text(
            //   "Sr. Mobile\nDeveloper", //to drop the text to the next line use \n
            //   style: TextStyle(
            //       fontSize: 50, color: Colors.black, fontWeight: FontWeight.bold),
            // ),

            //2nd text
            //standard way of aligning text to a screen size
            SizedBox(
              width: 350,
              child: Column(
                children: [
                  Text(
                    "Sr. Mobile Developer", //to drop the text to the next line use \n
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 50,
                        color: Colors.black,
                        // letterSpacing: 0.5,
                        // wordSpacing: 1.2,
                        // fontFamily: "Agbalumo",
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Currently leading the design & strategy of Crosby retail point-of-sale tool called ''Encore.'' ",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "In my spare time, I enjoy building side projects and contributing to open-source.",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),

            SizedBox(height: 30),

            SizedBox(
              width: 320,
              child: Container(
                height: 50,
                // width: 300,
                padding: EdgeInsets.all(12),
                // width: 300,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "AYOJESUKUNUMI1@GMAIL.COM",
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Icon(
                      Icons.content_copy_rounded,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),

            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Row(
            //     children: [
            //       Text('Likes: $_increase', style: TextStyle(fontSize: 20)),
            //       SizedBox(width: 20),
            //       Text('Dislikes: $_decrease', style: TextStyle(fontSize: 20)),
            //     ],
            //   ),
            // ),

            //
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: _decreaseCounter,
            tooltip: 'Dislike',
            child: const Icon(Icons.thumb_down),
          ),
          SizedBox(
            width: 15,
          ),
          FloatingActionButton(
            onPressed: increaseAmount,
            tooltip: 'Likes',
            child: const Icon(Icons.thumb_up_rounded),
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
