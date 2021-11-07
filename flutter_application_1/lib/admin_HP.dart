import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/services.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_application_1/main.dart';

class admin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: adminhp(),
    );
  }
}

class adminhp extends StatefulWidget {
  @override
  _adminhpState createState() => _adminhpState();
}

class _adminhpState extends State<adminhp> {
  final formKey = GlobalKey<FormState>(); //key for form
  String name = "";
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.teal[200],
        title: Text('Food donation'),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(
              Icons.logout,
              color: Colors.white,
            ),
            label: Text(
              "Logout",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => HomePage())); //اغيره للهوم بيج
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          // we will give media query height
          // double.infinity make it big as my parent allows
          // while MediaQuery make it big as per the screen

          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
          child: Column(
            // even space distribution
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              IconButton(
                padding: EdgeInsets.only(top: 50, left: 10),
                icon: Image.asset('assets/images/newAccounts.png'),
                iconSize: 90,
                color: Colors.teal[300],
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                },
              ),
              GestureDetector(
                  child: Padding(
                    padding: const EdgeInsets.only(),
                    child: Text(
                      'New accounts',
                      style: TextStyle(color: Colors.teal[200], fontSize: 15.0),
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  }),
              IconButton(
                padding: EdgeInsets.only(top: 60, left: 10),
                icon: Image.asset('assets/images/listAccounts.png'),
                iconSize: 90,
                color: Colors.teal[300],
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                },
              ),
              GestureDetector(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      bottom: 140,
                    ),
                    child: Text(
                      'list of accounts',
                      style: TextStyle(color: Colors.teal[200], fontSize: 15.0),
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
