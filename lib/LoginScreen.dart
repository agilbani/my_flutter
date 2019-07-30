import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'dart:async';
import 'dart:convert';

import 'HomeScreen.dart';

// void main() {
//   runApp(MaterialApp(
//     title: 'belajar',
//     home: Login(),
//   ));
// }

class Login extends StatefulWidget {
  static String tag = 'login-page';
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isInAsyncCall = false;

  TextEditingController myController = new TextEditingController();
  TextEditingController controllerPassword = new TextEditingController();
  bool isLoading = false;

  @override
    void dispose() {
      // TODO: implement dispose
      myController.dispose();
      controllerPassword.dispose();
      super.dispose();
    }

    Future<dynamic> onLogin() async{
      print(myController);
      final JsonDecoder jsonDecoder = new JsonDecoder();
      try{
        final response = await http.post("http://aplus.dev.marlinbooking.co.id/api/auth", body: {
          "email": myController.text,
          "password": controllerPassword.text
        });
        if(response.statusCode < 200 || response.statusCode > 300){
          setState(() {
            isLoading = false;
          });
          throw new Exception('Gagal menghubungkan ke server');
        } else {
          var datauser = jsonDecoder.convert(response.body);          
          if(datauser["success"] != true){
            setState(() {
            _isInAsyncCall = false;
            showDialog(
                context: context,
                builder: (_) =>
                new AlertDialog(
                  content: new Text("Username atau password salah"),
                ));
            });
          } else {
            SharedPreferences preferences = await SharedPreferences.getInstance();
            setState(() {
              preferences.setString('token', datauser["payload"]["token"]);
              preferences.setString('nama', datauser["payload"]["name"]);
              preferences.setString('email', datauser["payload"]["email"]);
            });
            setState(() {
              isLoading = false;
            });
            Navigator.push(context, MaterialPageRoute(builder: (context) => ExpansionTileSample()));  
          }
        }
      } catch(e){
        print(e);
      }
      // if (myController.text == 'qwerty' && controllerPassword.text == '12345'){
      //   new Future.delayed(new Duration(seconds: 3),(){
      //     setState(() {
      //       isLoading = false;
      //     });
      //     Navigator.push(context, MaterialPageRoute(builder: (context) => ExpansionTileSample()));
      //   });        
      // }
    }

  @override
  Widget build(BuildContext context) {
    Widget email(){
      return Container(
        margin: new EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            TextFormField(      
              controller: myController,
              keyboardType: TextInputType.emailAddress,
              autofocus: false,
              decoration: InputDecoration(        
                hintText: 'Email',        
                contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
              ),
            ),
          ]
        )
      );
    }

    Widget password(){
      return Container(
        margin: new EdgeInsets.fromLTRB(15.0, 0, 15.0, 10.0),
        child: Column(
          children: <Widget>[
            TextFormField(      
              obscureText: true,
              keyboardType: TextInputType.emailAddress,
              autofocus: false,
              controller: controllerPassword,
              decoration: InputDecoration(        
                hintText: 'Password',        
                contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                onPressed: () {
                  setState(() {
                    isLoading = true;
                  });
                  onLogin();
                },
                padding: EdgeInsets.all(12),
                color: Colors.lightBlueAccent,
                child: Text('Log In', style: TextStyle(color: Colors.white)),
              ),
            ),
            FlatButton(
              child: Text(
                'Forgot password?',
                style: TextStyle(color: Colors.black54),
              ),
              onPressed: () {},
            )
          ]
        )
      );
    }

    Widget loading(){
      isLoading ? new Center(
        child: new CircularProgressIndicator(),
      ) : null;
    }

    Widget _view(){
      return Container(
        child: SingleChildScrollView(
          child: Column(                                
            children: <Widget>[
              Image.network(            
              'http://home.bt.com/images/the-20-best-views-in-the-uk-revealed-136417214455702601-170411144310.jpg',            
              fit: BoxFit.fill,
              ),
            email(),
            password(),
            // loading()
            ], 
          ), 
        ),            
      );  
    }
    
    
    return 
      new Scaffold(
          appBar: AppBar(
            title: Text('Belajar'),
            backgroundColor: Colors.blueAccent,
          ),
          body: ModalProgressHUD(child: _view(), inAsyncCall: isLoading,)       
        );
  }
}