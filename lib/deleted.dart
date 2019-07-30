// import 'package:flutter/material.dart';
// import 'LoginScreen.dart';
// import 'HomeScreen.dart';

// void main() {
//   runApp(MaterialApp(
//     title: 'belajar',
//     home: Login(),
//   ));
// } 

// class MyApp extends State<MyCustomForm> {

//   final myController = TextEditingController();
//   final controllerPassword = TextEditingController();

//   @override
//     void dispose() {
//       // TODO: implement dispose
//       myController.dispose();
//       controllerPassword.dispose();
//       super.dispose();
//     }

//     Function onLogin(){
//       if (myController.text == 'qwerty' && controllerPassword.text == '12345'){
//         Navigator.push(context, MaterialPageRoute(builder: (context) => ExpansionTileSample()));
//       }
//     }

//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//           appBar: AppBar(
//             title: Text('Welcome noob !'),
//             backgroundColor: Colors.blueGrey,
//           ),
//           body: Container(
//             child: SingleChildScrollView(
//               child: Column(
//                 children: <Widget>[
//                   Image.network(            
//                   'http://home.bt.com/images/the-20-best-views-in-the-uk-revealed-136417214455702601-170411144310.jpg',            
//                   fit: BoxFit.fill,),
//                 Padding(
//                   padding: const EdgeInsets.fromLTRB(8.0,15.0,8.0,8.0),
//                   child: TextFormField(          
//                     controller: myController,      
//                     decoration: InputDecoration(
//                       hintText: 'Username',      
//                       border: OutlineInputBorder(borderRadius: BorderRadius.circular(35.0))                                   
//                     ),                
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: TextFormField(        
//                     obscureText: true,    
//                     controller: controllerPassword,      
//                     decoration: InputDecoration(                                          
//                       hintText: 'Password',
//                       //contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
//                       border: OutlineInputBorder(borderRadius: BorderRadius.circular(35.0))
//                     ),
//                   ),
//                 ),
//                 Container(
//                   margin: const EdgeInsets.only(top:10.0),
//                   child: Container(
//                     width: 140.0,
//                     child: new RaisedButton(                                    
//                       child: const Text('Button',
//                       style: TextStyle(color: Colors.white),
//                       ),
//                       color: Theme.of(context).accentColor,
//                       elevation: 4,
//                       splashColor: Colors.greenAccent,
//                       onPressed: () {
//                         onLogin();
//                       }, 
//                     ),
//                   ),
//                 )
//                 ], 
//               ), 
//             ),
//           ),
//         );
//   }
// }

// // Define a Custom Form Widget
// class MyCustomForm extends StatefulWidget {
//   @override
//   MyApp createState() => MyApp();
// }


