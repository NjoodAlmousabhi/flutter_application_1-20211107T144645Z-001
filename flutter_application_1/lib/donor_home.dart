import 'package:flutter/material.dart';
import 'LoginAll.dart';
import 'package:flutter_application_1/main.dart';

class HomeD extends StatelessWidget {
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
        elevation: 0.0,
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(
              Icons.logout,
              color: Colors.white,
            ),
            label: Text("Logout"),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => LoginAll()));
            },
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(35),
        child: GridView.count(
          crossAxisCount: 2,
          children: <Widget>[
            Card(
              child: InkWell(
                onTap: () {},
                splashColor: Colors.red,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(
                        Icons.article,
                        size: 75,
                        color: Colors.teal,
                      ),
                      Text("Contracts", style: new TextStyle(fontSize: 12))
                    ],
                  ),
                ),
              ),
            ),
            Card(
              child: InkWell(
                onTap: () {},
                splashColor: Colors.red,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(
                        Icons.receipt_long,
                        size: 75,
                        color: Colors.teal,
                      ),
                      Text("Publish an offer",
                          style: new TextStyle(fontSize: 12))
                    ],
                  ),
                ),
              ),
            ),
            Card(
              child: InkWell(
                onTap: () {},
                splashColor: Colors.red,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(
                        Icons.fact_check,
                        size: 75,
                        color: Colors.teal,
                      ),
                      Text("Published offer",
                          style: new TextStyle(fontSize: 12))
                    ],
                  ),
                ),
              ),
            ),
            Card(
              child: InkWell(
                onTap: () {},
                splashColor: Colors.red,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(
                        Icons.circle_notifications,
                        size: 75,
                        color: Colors.teal,
                      ),
                      Text("Notifications", style: new TextStyle(fontSize: 12))
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(bottom: 50, left: 100),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/Dhome.jpeg'),
                      fit: BoxFit.cover)),
            ),
          ],
        ),
      ),
    );
  }
}
