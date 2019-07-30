import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'dart:convert';
import 'detail.dart';

Future<List<User>> fetchUsersFromGitHub() async {
    //final response = await http.get('https://api.github.com/users');
    final response = await http.get('http://mhs.stmikayani.ac.id/aghil/katalog/getAll.php');
    print(response.body);
    List responseJson = json.decode(response.body.toString());
    List<User> userList = createUserList(responseJson);
    return userList;
  }


List<User> createUserList(List data){
  List<User> list = new List();
  for (int i = 0; i < data.length; i++) {
    String title = data[i]["name"];
    String id = data[i]["id"];
    String imgs = data[i]["img"];
    User user = new User(
        name: title,
        ids: id,
        img: imgs);
    list.add(user);
  }
  return list;
}

class User {

  String name;
  int id;
  String title;
  String ids;
  String img;

  User({this.img, this.name,this.ids});
  factory User.fromJson(Map<String, dynamic> json) => _itemFromJson(json);



  @override
    String toString() {
      // TODO: implement toString
      return '${this.name}, ${this.ids}, ${this.img}';
    }
}

User _itemFromJson(Map<String, dynamic> json) {
	
    return User(
	
      ids: json['ids'] as String,
	
      name: json['name'] as String,
	
      img: json['primgice'] as String,
	
    );
	
  }

class ExpansionTileSample extends StatefulWidget {
  static String tag = 'home-page'; 
  
  @override
  State createState() => new Home();
}

class Home extends State<ExpansionTileSample> {  
  String names = '';
  String email = '';

  @override
  void initState(){
    super.initState();
    _loadData();
  }

  _loadData() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      names = preferences.getString('nama') ?? 'kosong';
    });
  }

  @override
  Widget build(BuildContext context) { 
    final mediaWidth = MediaQuery.of(context).size.width;
    final mediaHeight = MediaQuery.of(context).size.height;
    final blockSize = mediaWidth / 100;
    final blockSizeVertical = mediaWidth / 100;
    
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('List'),
          centerTitle: true,
        ),        
        body: new Container(        
        child: new FutureBuilder<List<User>>(
        future: fetchUsersFromGitHub(),
        builder: (context, snapshot){
            if (snapshot.hasData){
            return new ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context,index){
                return new Column(                           
                    children: <Widget>[
                    new Center(
                      child: Container(
                        padding: const EdgeInsets.all(5.0),
                        width: mediaWidth,
                        height: blockSizeVertical*40.0,
                        child: Card(
                          child: new InkWell(
                            splashColor: Colors.transparent,
                            onTap: (){
                              Navigator.of(context, rootNavigator: true).pushReplacement(
                                MaterialPageRoute(builder: (context) => new Detail(data: snapshot.data[index],)));
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) => Detail(data: snapshot.data[index],),
                              //   ),
                              // );)                              
                            },
                            child: Row(
                              children: <Widget>[
                              new Image.network(snapshot.data[index].img, 
                              fit: BoxFit.fill,),
                              new Text(snapshot.data[index].name),
                              ],
                            ),
                          ),
                          elevation: 3.0,
                        ),
                      ),
                    )
                  ],
                );
                },
              );
            } else if (snapshot.hasError){
                return new Text("${snapshot.error}");
              } return Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        )
      ),
    );
  }
}

void main() {
  runApp(ExpansionTileSample());
}