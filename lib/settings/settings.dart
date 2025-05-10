import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
//shortcut to select MyWidgt and change the name : Ctrl + D

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  // padding: EdgeInsets.all(15),
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey,
                    image: DecorationImage(
                      fit: BoxFit.contain,
                      image: AssetImage("assets/png/THA_5039.jpg"),
                    ),
                  ),
                ),

                SizedBox(
                  width: 15,
                ),

                //username and phone
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "King David",
                      style: TextStyle(
                          fontFamily: "DmSans",
                          fontSize: 25,
                          color: Color(0xff0D0D0D),
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "08138113725",
                      style: TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(255, 61, 58, 58),
                          fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
              ],
            ),

            SizedBox(
              height: 35,
            ),

            //
            sectionTitle('Others'),
            settingTile(
              Icons.lightbulb,
              'Learn',
              'See our Investment tips here',
              () {
                // Handle navigation or action
              },
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
