import 'package:flutter/material.dart';

import 'package:hello_rectangle/HomeScreen.dart';
import 'package:hello_rectangle/home/home.dart';

// void main() => runApp(Detail());

class Detail extends StatelessWidget {
  final User data;
  // final String name;
  // final String img;
  Detail({Key key, @required this.data}) : super(key: key);
    
  @override
  Widget build(BuildContext context) {
    print(data);
    final mediaWidth = MediaQuery.of(context).size.width;
    final mediaHeight = MediaQuery.of(context).size.height;
    final blockSize = mediaWidth / 100;
    final blockSizeVertical = mediaWidth / 100;

  Widget image(){
    return Container(
      child: Column(
        children: <Widget>[
          Image.network(            
            data.img, width: mediaWidth, height: blockSizeVertical*60.0,            
            fit: BoxFit.fill,
          ),
        ],
      ),
    );
  }

  Widget title(){
    return Container(
      margin: EdgeInsets.only(top: 15.0, left: 15.0),      
      child: Row(
        children: <Widget>[
          new Text(data.name, style: TextStyle(fontSize: 20, color: Colors.lime),)
        ],
      ),
    );
  }

  Widget render(){
    return Container(      
      child: SingleChildScrollView(        
        child: Column( 
          children: <Widget>[            
            image(),
            title()     
          ],
        ),
      ),
    );  
  }

    return Scaffold(
      appBar: AppBar(
        title: Text('Detail'),
      ),
      body: WillPopScope(
        onWillPop: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage())); 
        },
        child: render(),
      )
    );
  }
}