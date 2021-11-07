import 'package:flutter/material.dart';
import 'package:flutter_application_1/login_cho.dart';
import 'package:flutter_application_1/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'cho_home.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<SignupPage> {
  final _auth = FirebaseAuth.instance;

  late String e_mail;
  late String pass;

  final formKey = GlobalKey<FormState>(); //key for form

  final _firestore = FirebaseFirestore.instance;
  String? nAme;
  String? eType;
  String? phone;
  String? location;

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
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          //padding: EdgeInsets.symmetric(horizontal: 40),
          //height: MediaQuery.of(context).size.height - 50,
          //width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    "Sign up with us",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Create an account",
                    style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  TextFormField(
                    onChanged: (value) {
                      nAme = value;
                    },
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 14, vertical: 16),
                      labelText: 'Name',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    onChanged: (value) {
                      eType = value;
                    },
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 14, vertical: 16),
                      labelText: 'Establishment Type',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                      onChanged: (value) {
                        e_mail = value;
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 14, vertical: 16),
                        labelText: 'Email',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        } else if (!RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(value) ||
                            value == null)
                          return 'Enter a valid email address';
                        else
                          return null;
                      }),
                  TextFormField(
                    onChanged: (value) {
                      pass = value;
                    },
                    obscureText: true,
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 14, vertical: 16),
                      labelText: 'Password',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      } else if (!RegExp(
                              r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                          .hasMatch(value)) {
                        // should contain at least one upper case
                        // should contain at least one lower case
                        // should contain at least one digit
                        // should contain at least one Special charact
                        // Must be at least 8 characters in length
                        String s =
                            "Enter a valid password \n - should contain at least one upper case \n - should contain at least one lower case \n  - should contain at least one digit \n - should contain at least one Special charact\n   - Must be at least 8 characters in length";
                        return s;
                      } else
                        return null;
                    },
                  ),
                  TextFormField(
                    onChanged: (value) {
                      phone = value;
                    },
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 14, vertical: 16),
                      labelText: 'Phone number',
                    ),
                  ),
                  TextFormField(
                    onChanged: (value) {
                      location = value;
                    },
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 14, vertical: 16),
                      labelText: 'Location',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: ElevatedButton(
                        onPressed: () async {
                          //print(e_mail);
                          //print(pass);
                          try {
                            // Validate returns true if the form is valid, or false otherwise.
                            if (formKey.currentState!.validate()) {
                              // If the form is valid, display a snackbar. In the real world,
                              // you'd often call a server or save the information in a database.
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Processing Data')),
                              );
                            }

                            final newUser =
                                await _auth.createUserWithEmailAndPassword(
                                    email: e_mail, password: pass);
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => HomeC()),
                            );
                          } catch (e) {
                            print(e);
                          }
                        },
                        child: const Text('Sign Up')),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Already have an account?"),
                  GestureDetector(
                      child: Text(
                        'Log in',
                        style: TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomePage()),
                        );
                      }),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

// we will be creating a widget for text field
Widget inputFile({label, obscureText = false}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        label,
        style: TextStyle(
            fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black87),
      ),
      SizedBox(
        height: 5,
      ),
      TextField(
        obscureText: obscureText,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            border:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.grey))),
      ),
      SizedBox(
        height: 10,
      )
    ],
  );
}
