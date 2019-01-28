import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Raleway'),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: StackBuilder()),
    );
    // This trailing comma makes auto-formatting nicer for build methods.
  }
}

Widget StackBuilder() {
  return new Stack(
    children: <Widget>[
      Container(
        height: double.infinity,
        width: double.infinity,
        decoration: new BoxDecoration(
            image: new DecorationImage(
                image: new AssetImage('res/images/loginbg.png'),
                fit: BoxFit.cover)),
      ),
      Opacity(
        opacity: 0.94,
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: new BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [const Color(0xFFFF900F), const Color(0xFFF46948)],
              // whitish to gray
            ),
          ),
        ),
      ),
      new Container(
        child: CoulmnBuilder(),
      )
    ],
  );
}

Widget CoulmnBuilder() {
  return Center(
    child: new Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Icon(
              Icons.class_,
              size: 200.0,
              color: Colors.white,
            ),
            new Text(
              'Book a Book',
              style: new TextStyle(
                  color: Colors.white,
                  fontSize: 24.0,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
        new Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[],
            ),
            Divider(),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Expanded(child: ButtonBuilder('Login Here'))
              ],
            ),
          ],
        )
      ],
    ),
  );
}

Widget ButtonBuilder(String name) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: new Container(
      decoration: new BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 6.0, // has the effect of softening the shadow
          // has the effect of extending the shadow
          offset: Offset(
            0, // horizontal, move right 10
            3.0, // vertical, move down 10
          ),
        )
      ], color: Colors.white, borderRadius: new BorderRadius.circular(35.0)),
      child: Padding(
        padding: const EdgeInsets.all(22.0),
        child: new Text(
          name,
          textAlign: TextAlign.center,
          style: new TextStyle(fontSize: 20.0, color: Color(0xFFF46948)),
        ),
      ),
    ),
  );
}

Widget Divider() {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
    child: new Row(
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: new Container(
              height: 1.0,
              color: Colors.white,
            ),
          ),
        ),
        new Text(
          'OR',
          style: new TextStyle(color: Colors.white, fontSize: 18.0),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: new Container(
              height: 1.0,
              color: Colors.white,
            ),
          ),
        ),
      ],
    ),
  );
}
