import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  final String email;
  final String displayName;
  Home(this.email, this.displayName);
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  SharedPreferences prefs;
  String email;
  String displayName;
  void initState() {
    email = widget.email;
    displayName = widget.displayName;
    super.initState();
  }

  // void getUSerData() async {
  //   prefs = await SharedPreferences.getInstance();
  //   try {
  //     email = prefs.getString("email");
  //     displayName = prefs.getString("displayName");
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  Widget navBarBuilder(BuildContext context) {
    return ListView(
      children: <Widget>[
        UserAccountsDrawerHeader(
            accountName: displayName != null ? Text(displayName) : Text(""),
            accountEmail: email != null ? Text(email) : Text(""),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Theme.of(context).platform == TargetPlatform.iOS
                  ? Colors.orange
                  : Colors.white,
              child: Text(
                displayName.split('')[0].toUpperCase(),
                style: TextStyle(fontSize: 40.0),
              ),
            )),
        ListTile(
          title: Text('Logout'),
          onTap: () async {
            prefs = await SharedPreferences.getInstance();
            prefs.clear();
            Navigator.pushReplacementNamed(context, "/myhome");
          },
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        key: _scaffoldKey,
        floatingActionButton: new FloatingActionButton(
          backgroundColor: Color(0xFFFF900F),
          child: Icon(Icons.add),
          onPressed: () {},
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: new BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          fixedColor: Color(0xFFFF900F),
          items: [
            new BottomNavigationBarItem(
                title: new Text(''), icon: new Icon(Icons.home)),
            new BottomNavigationBarItem(
                title: new Text(''), icon: new Icon(Icons.notifications)),
            new BottomNavigationBarItem(
                title: new Text(''), icon: new Icon(Icons.search)),
            new BottomNavigationBarItem(
                title: new Text(''), icon: new Icon(Icons.person))
          ],
        ),
        appBar: new AppBar(
          title: new Text('Home'),
          backgroundColor: Color(0xFFFF900F),
          leading: GestureDetector(
            child: Icon(Icons.menu),
            onTap: () {
              _scaffoldKey.currentState.openDrawer();
            },
          ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: new Icon(Icons.send),
            ),
          ],
          centerTitle: false,
        ),
        drawer: Drawer(child: navBarBuilder(context)),
        body: homeBodybuilder(context));
  }
}

Widget homeBodybuilder(BuildContext context) {
  return new Container(
      child: new Column(
    children: <Widget>[
      new SizedBox(
          height: MediaQuery.of(context).size.height / 4,
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
          )),
    ],
  ));
}
