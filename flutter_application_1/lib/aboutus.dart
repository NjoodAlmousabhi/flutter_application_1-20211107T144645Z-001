import 'package:contactus/contactus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';

class HomeAbout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.home_outlined),
          ),
          backgroundColor: Colors.teal[200],
          title: Text(
            "Food donation",
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: Colors.white,
        body: Column(
          // even space distribution
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height / 3,
              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage("images/Logo.jpg"))),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  "\n What is SFD ? ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.teal[200],
                    fontSize: 30,
                  ),
                ),
                SizedBox(),
                Text(
                  "\n SFD is a samrt Mobile-based application which \n can assist in collecting the left over food \n to distrbut it among those in need \n through CHO",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 20,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
