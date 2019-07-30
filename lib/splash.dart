import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

import 'HomeScreen.dart';
import 'LoginScreen.dart';
import 'package:hello_rectangle/home/home.dart';

class SplashScreen extends StatefulWidget {
  static String tag = 'login-page';

  @override
  SplashScreenState createState() => new SplashScreenState();
}

class SplashScreenState extends State<SplashScreen>{
  String nama = '';
  
  @override
  void initState(){
    super.initState();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {    
    return Container(    
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: NetworkImage("https://media.istockphoto.com/vectors/welcome-poster-with-brush-strokes-vector-id940891868?k=6&m=940891868&s=612x612&w=0&h=awJY_W7nGybC5pRtygpA3QBoNc2TSG4ZFKdGzMbQfUI="),
            fit: BoxFit.contain
        ),
      ),
      child: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.redAccent),
        ),
      ),
    );
  }

  Future<Timer> _loadData() async{
    return new Timer(Duration(seconds: 3), onDoneLoading);
  }

  onDoneLoading() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String namas = '';
    namas = preferences.getString("nama"); 
    setState(() {
      nama = namas != null ? namas:'';
    });
    if (namas != null){
      Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
    } else {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
    }
  }
}