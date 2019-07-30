import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'package:hello_rectangle/home/home.dart';

class AuthLogin extends StatefulWidget {
 @override
 State<StatefulWidget> createState() {
    return _LoginPage();
  }
}

class _LoginPage extends State<AuthLogin> {

  TextEditingController myController = new TextEditingController();
  TextEditingController controllerPassword = new TextEditingController();
  bool isLoading = false;

  Widget view(){
    final mediaWidth = MediaQuery.of(context).size.width;
    final mediaHeight = MediaQuery.of(context).size.height;
    final blockSize = mediaWidth / 100;
    final blockSizeVertical = mediaWidth / 100;
    return Container(
      padding: EdgeInsets.only(left: 20.0, right: 20.0),          
      child: Material(
        elevation: 4,
        borderRadius: new BorderRadius.all(Radius.circular(10.0)),
        child: Container(  
        child: PhysicalModel(             
        color: Colors.transparent,
        // width: blockSize * 80.0,              
        // margin: EdgeInsets.only(left: 20.0, right: 20.0),                
        child: SingleChildScrollView(        
          padding: EdgeInsets.all(10.0),        
          child: Column(                    
            children: <Widget>[
              // image(),
              email(),
              password()
            ],
          ),
          ),
        ),
      ),
      )
    );
  }

  Widget email(){
    return Container(
      child: Container(
        color: Colors.transparent,
        margin: EdgeInsets.only(top: 50.0),
        child: Column(
          children: <Widget>[
            // image(),
            Material(
              elevation: 4.0,   
              borderRadius: new BorderRadius.all(Radius.circular(5.0)),           
              shadowColor: Colors.black,
              child: TextFormField(                    
                controller: myController,
                keyboardType: TextInputType.emailAddress,
                autofocus: false,
                decoration: InputDecoration(        
                  hintText: 'Email',        
                  contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
                ),
              ),
            )
          ]
        ),
      ),
    );
  }

  Widget password(){
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      child: Container(
        // color: Colors.grey[200],
        child: Column(
          children: <Widget>[
            Material(
              elevation: 4.0,
              borderRadius: new BorderRadius.all(Radius.circular(5.0)),  
              shadowColor: Colors.black,
              child: TextFormField(                    
                controller: controllerPassword,
                obscureText: true,
                keyboardType: TextInputType.emailAddress,
                autofocus: false,
                decoration: InputDecoration(        
                  hintText: 'Password',        
                  contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.0),              
              child: RaisedButton(              
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)
                ),
                splashColor: Colors.blueAccent,
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage())); 
                },
                color: Colors.blue[400],
                child: Text('Login', style: TextStyle(color: Colors.white),),
              ),
            ),
            FlatButton(
              child: Text("Don't have an account? Register", 
                style: TextStyle(color: Colors.blue)),
                onPressed: (){},
            )
          ]
        ),
      ),
    );
  }

  Widget image(){     
    return Container(      
      width: 70,
      height: 70,         
      transform: Matrix4.translationValues(0.0, -40.0, 0.0),       
      child: Center(
        child: Image.asset('assets/logo.png'),
      )
    );
  }
    
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Login', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
      ),
      body: Container(
        // color: Colors.grey[400],     
        decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.3, 0.5, 0.7, 0.9],
          colors: [
            Colors.blue[300],
            Colors.blue[400],
            Colors.blue,
            Colors.blue[600],
          ]          
        )
      ),             
        child: Center(                              
          child: Stack(            
            alignment: Alignment.topCenter,            
            children: <Widget>[
              view(),
              image() 
            ],
          )
        )
      ),
    );
  }
}