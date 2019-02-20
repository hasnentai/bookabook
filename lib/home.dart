import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      floatingActionButton: new FloatingActionButton(
         backgroundColor: Color(0xFFFF900F),
          child: Icon(Icons.add),
         onPressed: (){
         },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      
       bottomNavigationBar: new BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        fixedColor: Color(0xFFFF900F),
           items: [
             new BottomNavigationBarItem(
            title: new Text(''),
             icon: new Icon(Icons.home)
          ),
          new BottomNavigationBarItem(
            title: new Text(''),
             icon: new Icon(Icons.notifications)
          ),
          new BottomNavigationBarItem(
            title: new Text(''),
             icon: new Icon(Icons.search)
          ),
          new BottomNavigationBarItem(
            title: new Text(''),
             icon: new Icon(Icons.person)
          )
           ],
       ),
      appBar: new AppBar(
         title: new Text('Home'),
         backgroundColor: Color(0xFFFF900F),
        leading: new Icon(Icons.menu),
         actions: <Widget>[
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: new Icon(Icons.send),
           ),
         ],
           centerTitle: false,
      ),
       body: homeBodybuilder(context)
    );
  }
}

Widget homeBodybuilder(BuildContext context){
  return new Container(
   child: new Column(
      children: <Widget>[
        new SizedBox(
            height: MediaQuery.of(context).size.height/4,
            width: MediaQuery.of(context).size.width,
            child: new Carousel(
              images: [
                new AssetImage('res/images/loginbg.png'),
                new AssetImage('res/images/loginbg.png'),
                new AssetImage('res/images/loginbg.png'),
              ],
               dotSize: 5.0,
               dotSpacing: 15.0,
               indicatorBgPadding: 12.0,
            )
        ), 
              
      ],
    )
  );
}