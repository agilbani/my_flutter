import 'package:flutter/material.dart';
import 'package:snaplist/snaplist.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:oktoast/oktoast.dart';
import 'package:flutter/services.dart';

class ListPage extends StatefulWidget {
  @override
  State createState() => new _MyListPage();
}

class _MyListPage extends State<ListPage> {
  List<String> urls = [
    "https://image.tmdb.org/t/p/w370_and_h556_bestv2/2uNW4WbgBXL25BAbXGLnLqX71Sw.jpg",
    "https://image.tmdb.org/t/p/w370_and_h556_bestv2/lNkDYKmrVem1J0aAfCnQlJOCKnT.jpg",
    "https://image.tmdb.org/t/p/w370_and_h556_bestv2/wrFpXMNBRj2PBiN4Z5kix51XaIZ.jpg",
    "https://image.tmdb.org/t/p/w370_and_h556_bestv2/r6pPUVUKU5eIpYj4oEzidk5ZibB.jpg",
    "https://image.tmdb.org/t/p/w370_and_h556_bestv2/x1txcDXkcM65gl7w20PwYSxAYah.jpg",
    "https://image.tmdb.org/t/p/w370_and_h556_bestv2/ptSrT1JwZFWGhjSpYUtJaasQrh.jpg",
    "https://image.tmdb.org/t/p/w370_and_h556_bestv2/wMq9kQXTeQCHUZOG4fAe5cAxyUA.jpg",
    "https://image.tmdb.org/t/p/w370_and_h556_bestv2/7WsyChQLEftFiDOVTGkv3hFpyyt.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.blueAccent[400]
    ));
    // TODO: implement build
    return OKToast(
      child: MaterialApp(
        home: Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  children: <Widget>[
                    view(),
                    menu(),
                    search(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget search(){
    return Container(
      margin: EdgeInsets.all(15.0),
      child: Column(        
        children: <Widget>[
          Text('WHERE DO YOU WANT TO GO ?', style: TextStyle(color: Colors.blueAccent[400], fontSize: 35,
          fontWeight: FontWeight.w600),),
          Container(
            margin: EdgeInsets.only(top: 10.0),
            child: Material(             
              elevation: 3,            
              borderRadius: new BorderRadius.circular(5.0),          
              color: Colors.white,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 40,
                child: InkWell(                                    
                  onTap: (){},
                  child: Container(    
                    alignment: Alignment.centerRight,   
                    margin: EdgeInsets.only(right: 8.0),             
                    child: new Icon(Icons.search),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget menu(){
    return Container(
      margin: EdgeInsets.all(15.0),
      width: MediaQuery.of(context).size.width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            width: 70,
            height: 70,
            child: new Image.asset('assets/btn-ferry.png', fit: BoxFit.fill,),
          ),
          Container(
            width: 70,
            height: 70,
            child: new Image.asset('assets/btn-eticket.png', fit: BoxFit.fill,),
          ),
          Container(
            width: 70,
            height: 70,
            child: new Image.asset('assets/btn-attraction.png', fit: BoxFit.fill,),
          ),
          Container(
            width: 70,
            height: 70,
            child: new Image.asset('assets/perintis.png', fit: BoxFit.fill,),
          ),
        ],
      ),
    );
  }

  Widget view() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 200.0,
      child: new Swiper(
      // loop: true,
      autoplay: true, 
      autoplayDisableOnInteraction: true, 
      onTap: (int i){
        showToast('index ke '+i.toString(), position: ToastPosition.bottom);
        // Scaffold.of(context).showSnackBar(new SnackBar(
        //   content: new Text("index ke "+i.toString()),
        // ));
      },
      // itemBuilder: (BuildContext context,int index){      
      //   return new Image.network(urls[index],fit: BoxFit.fill,);
      // },
      itemBuilder: (context, index) {
        return new Container(
          color: Colors.grey,
          child: new Image.network(urls[index],fit: BoxFit.fill,),
        );
      },
        itemCount: urls.length
      ),
    );
  }

  void loadMore() {
    setState(() {
      urls = new List.from(urls)..addAll(urls);
    });
  }
}

