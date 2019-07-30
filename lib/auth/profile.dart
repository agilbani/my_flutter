import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'package:hello_rectangle/LoginScreen.dart';

class ProfilePage extends StatefulWidget {
 @override
 State<StatefulWidget> createState() {
    return _ProfileState();
  }
}

class _ProfileState extends State<ProfilePage> {

  String nama = '';

  @override
  void initState(){
    super.initState();
    onDoneLoading();
  }  

  Widget view(){
    return Container(
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        child: Column(          
          children: <Widget>[
            name(),
            button()
          ],
        ),
      ),
    );
  }

  Widget name(){
    return Container(
      child: Text(nama, style: TextStyle(fontSize: 20.0, color: Colors.black),),
    );
  }

  Widget button(){
    final mediaWidth = MediaQuery.of(context).size.width;
    final mediaHeight = MediaQuery.of(context).size.height;
    final blockSize = mediaWidth / 100;
    final blockSizeVertical = mediaWidth / 100;
    return SizedBox(
      width: blockSize * 40.0,           
        child: RaisedButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0)
          ),          
          onPressed: (){
            removeLogin();
          },
          color: Colors.redAccent,
          child: Text('Logout', style: TextStyle(color: Colors.white, fontSize: 15.0),),
        ),
    );
  }

  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return Scaffold(
        appBar: AppBar(
          title: Text('Profile'),
          backgroundColor: Colors.blueAccent,
        ),
        body: view(),
      );
    }

  onDoneLoading() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final namas = preferences.getString("nama");
    setState(() {
      nama = namas;
    });
  }

  removeLogin() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.remove('nama');
    await preferences.remove('token');
    await preferences.remove('email');
    Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
  }

}
