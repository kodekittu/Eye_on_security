
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:new_app/homePage.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';
import 'package:http/http.dart' as http;

import 'main.dart';

class SigninPage extends StatefulWidget {

  @override
  _SigninPageState createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  bool isLoading  = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: 360,
            child: RotatedBox(
              quarterTurns: 2,
              child: WaveWidget(
                config: CustomConfig(
                    gradients: [
                        [Colors.deepPurple, Colors.deepPurple.shade800],
                        [Colors.indigo.shade800, Colors.purple.shade200],
                    ],
                    durations: [19440, 10800],
                    heightPercentages: [0.20, 0.25],
                    blur: MaskFilter.blur(BlurStyle.solid, 10),
                    gradientBegin: Alignment.bottomLeft,
                    gradientEnd: Alignment.topRight,
                ),
                waveAmplitude: 0,
                size: Size(
                    double.infinity,
                    double.infinity,
                ),
              ),
            ),
          ),
          ListView(
            children: <Widget>[
              Container(
                height: 500,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset("assets/images/logo.png", height: 180, width: 180,),
                    ),
                    Text("Login", textAlign: TextAlign.center, style: TextStyle(
                      color: Colors.white70,
                      fontWeight: FontWeight.bold,
                      fontSize: 28.0
                    )),
                    Card(
                      margin: EdgeInsets.only(left: 30, right:30, top:30),
                      elevation: 11,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(40))),
                      child: TextField(
                        controller: usernameController,
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person, color: Colors.black26,),
                          hintText: "Username",
                          hintStyle: TextStyle(color: Colors.black26),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.all(Radius.circular(40.0)),
                          ),
                          contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0)
                        ),
                      ),
                    ),
                    Card(
                      margin: EdgeInsets.only(left: 30, right:30, top:20),
                      elevation: 11,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(40))),
                      child: TextField(
                        controller: passwordController,
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock, color: Colors.black26,),
                          hintText: "Password",
                          hintStyle: TextStyle(
                            color: Colors.black26,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.all(Radius.circular(40.0)),
                          ),
                          contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0)
                        ),
                      ),
                    ),
                    isLoading == false ? Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(30.0),
                      child: RaisedButton(
                        padding: EdgeInsets.symmetric(vertical: 16.0),
                        color: Colors.pink,
                        onPressed: (){
                          logIn(usernameController.text, passwordController.text);
                        },
                        elevation: 11,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(40.0))),
                        child: Text("Login", style: TextStyle(
                          color: Colors.white70
                        )),
                      ),
                    )
                    : CircularProgressIndicator(backgroundColor: Colors.tealAccent,),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Dont have an account?"),
                  FlatButton(
                    child: Text("Sign up", style: TextStyle(fontWeight: FontWeight.bold),),
                    textColor: Colors.tealAccent,
                    onPressed: (){
                      Navigator.pushNamed(context, '/signup');
                    },
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  Future<http.Response> logIn(String username, String password)
  async {
    final url = 'https://newsjone.com/UserRegistration/Login.php?email=$username&password=$password';
    setState(() {
      isLoading = true;
    });
    try {
      final response = await http.post(url, headers: {"Content-Type": "application/json"});

      print("${response.statusCode}");
      print("${response.body}");

     String res = response.body;

      if(res == "success"){
        await Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (BuildContext context) => HomePage()),
                (Route<dynamic> route) => false);
      }else{
        showToast(res);
        setState(() {
          isLoading = false;
        });
      }
    } catch (error) {
      setState(() {
        isLoading = false;
      });
      showToast(error.toString());
      print(error);
    }
  }
}
