import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'SecondRoute.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _auth = FirebaseAuth.instance;

  String email;

  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Color(0xff292824),
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                SizedBox(
                  height: 200,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    onChanged: (value) {
                      email = value;
                    },
                    decoration: InputDecoration(
                      fillColor: Color(0xff2cf598),
                      filled: true,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(40.0)),
                      ),
                      labelText: 'Email',
                      hintText: 'Your email',
                      hintStyle: TextStyle(
                        color: Colors.grey.withOpacity(0.7),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 70,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    onChanged: (value) {
                      password = value;
                    },
                    decoration: InputDecoration(
                      fillColor: Color(0xff2cf598),
                      filled: true,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(40.0)),
                      ),
                      labelText: 'Password',
                      hintText: 'Your password',
                      hintStyle: TextStyle(
                        color: Colors.grey.withOpacity(0.7),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 70,
                ),
                Container(
                  height: 40,
                  width: double.infinity,
                  child: ElevatedButton(
                    child: Text('login'),
                    onPressed: () async {
                      if (email != null && password != null) {
                        try {
                          var newUser = await _auth.signInWithEmailAndPassword(
                              email: email, password: password);
                          if (newUser != null) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SecondRoute(),
                              ),
                            );
                          }
                        } catch (e) {
                          print(e);
                        }
                      } else {
                        Fluttertoast.showToast(
                            msg: "Please enter your both email and password",
                            toastLength: Toast.LENGTH_LONG,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.black,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
