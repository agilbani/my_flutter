import 'package:flutter/material.dart';
import 'package:snaplist/snaplist.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class ListPage extends StatefulWidget {
  @override
  _MyListPage createState() => new _MyListPage();
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
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('List', style: TextStyle(color: Colors.white, fontSize: 20),),
        backgroundColor: Colors.blueAccent,
      ),
      body: view(),
    );
  }

  Widget view() {
    final Size cardSize = Size(200.0, 200.0);
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 300.0,
      child: new Swiper(
      // loop: true,
      autoplay: true, 
      autoplayDisableOnInteraction: true, 
      onTap: (int i){
        Scaffold.of(context).showSnackBar(new SnackBar(
          content: new Text("index ke "+i.toString()),
        ));
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
       layout: SwiperLayout.CUSTOM,
        customLayoutOption: new CustomLayoutOption(
            startIndex: -1,
            stateCount: 3
        ).addRotate([
          -45.0/180,
          0.0,
          45.0/180
        ]).addTranslate([
          new Offset(-370.0, -40.0),
          new Offset(0.0, 0.0),
          new Offset(370.0, -40.0)
        ]),
        itemWidth: 300.0,
        itemHeight: 300.0,
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

