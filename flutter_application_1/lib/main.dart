import 'package:flutter/material.dart';
import 'package:flutter_application_1/Aboutus.dart';
import 'LoginAll.dart';
import 'cho_home.dart';
import 'donor_home.dart';
import 'login_cho.dart';
import 'login_donor.dart';
import 'signup_page.dart';
import 'package:flutter_application_1/Contactus.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food donation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            'Food donation',
          ),
          backgroundColor: Colors.teal[200],
        ),
        body: Container(
            padding: EdgeInsets.only(),
            child: GridView.count(crossAxisCount: 2, children: <Widget>[
              Container(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.only(top: 85, left: 19),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: 'Welcome,\n TO SFD',
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.teal[200],
                            )),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(),
              Card(
                child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomeAbout()));
                  },
                  splashColor: Colors.red,
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Image(image: AssetImage("images/Logo.jpg")),
                        Text("What is SFD", style: new TextStyle(fontSize: 12))
                      ],
                    ),
                  ),
                ),
              ),
              Card(
                child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomeContact()));
                  },
                  splashColor: Colors.red,
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Icon(
                          Icons.contact_support,
                          size: 75,
                          color: Colors.teal,
                        ),
                        Text("Contact us", style: new TextStyle(fontSize: 12))
                      ],
                    ),
                  ),
                ),
              ),
              Card(
                child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignupPage()));
                  },
                  splashColor: Colors.red,
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Icon(
                          Icons.add_circle_outline,
                          size: 75,
                          color: Colors.teal,
                        ),
                        Text("Sign up", style: new TextStyle(fontSize: 12))
                      ],
                    ),
                  ),
                ),
              ),
              Card(
                child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginAll()));
                  },
                  splashColor: Colors.red,
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Icon(
                          Icons.login,
                          size: 75,
                          color: Colors.teal,
                        ),
                        Text("Log in ", style: new TextStyle(fontSize: 12))
                      ],
                    ),
                  ),
                ),
              ),
            ])));
  }
}
