import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
//shortcut to select MyWidgt and change the name : Ctrl + D

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _isLiked = false;
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
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          // backgroundBlendMode: BlendMode.darken,
          image: DecorationImage(
            scale: 1.0,
            image: AssetImage("assets/png/jay.png"),
            // colorFilter: ColorFilter.mode(
            //     Colors.black.withOpacity(0.5), BlendMode.darken),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                // color: Colors.black.withOpacity(0.5),
                // border: Border.all(width: 0),
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withOpacity(0.15),
                    Colors.black,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.center,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Jesuloba Fademi A.D",
                    style: TextStyle(
                        fontFamily: "DmSans",
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "I'm a Flutter Developer with a passion for building beautiful and functional apps and websites.",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontFamily: "DmSans",
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Rating(),

                      SizedBox(
                        height: 25,
                        child: VerticalDivider(
                          color: Colors.white,
                          thickness: 1,
                        ),
                      ),

                      OtherCard(
                        title: "\$100k+",
                        subz: "Earned",
                      ),

                      SizedBox(
                        height: 25,
                        child: VerticalDivider(
                          color: Colors.white,
                          thickness: 1,
                        ),
                      ),

                      OtherCard(
                        title: "\$200/hr",
                        subz: "Rate",
                      ),

                      //earnin

                      //username and phone
                    ],
                  ),

                  SizedBox(
                    height: 25,
                  ),

                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: InkWell(
                          child: Container(
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.mail_outline_rounded,
                                  size: 20,
                                  color: Colors.black,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Get in Touch",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: "DmSans",
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      //
                      GestureDetector(
                        onDoubleTap: onTapLike,
                        child: Container(
                          padding: EdgeInsets.all(15),
                          margin: EdgeInsets.only(left: 10),
                          decoration: BoxDecoration(
                            color: Colors.white24,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                              !_isLiked
                                  ? Icons.bookmark_border_rounded
                                  : Icons.bookmark_rounded,
                              size: 20,
                              color: Colors.white),
                        ),
                      ),
                    ],
                  ),

                  // //
                  // sectionTitle('Others'),
                  // settingTile(
                  //   Icons.lightbulb,
                  //   'Learn',
                  //   'See our Investment tips here',
                  //   () {
                  //     // Handle navigation or action
                  //   },
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  //
  Widget sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
    );
  }

  Widget settingTile(
      IconData icon, String title, String subtitle, void Function()? onTap) {
    return ListTile(
      contentPadding: EdgeInsets.all(2),
      leading: Icon(icon, color: Colors.green),
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }
}

class OtherCard extends StatelessWidget {
  const OtherCard({
    super.key,
    required this.title,
    required this.subz,
  });

  final String title, subz;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: 15,
              fontFamily: "DmSans",
              color: Colors.white,
              fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          subz,
          style: TextStyle(
              color: Colors.white,
              fontFamily: "DmSans",
              fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}

class Rating extends StatelessWidget {
  const Rating({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              Icons.star,
              color: Colors.amber.shade800,
            ),
            SizedBox(
              width: 4,
            ),
            Text(
              "4.8",
              style: TextStyle(
                  fontSize: 15,
                  fontFamily: "DmSans",
                  color: Colors.white,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          "Rating",
          style: TextStyle(
              color: Colors.white,
              fontFamily: "DmSans",
              fontWeight: FontWeight.w400),
        )
      ],
    );
  }
}
