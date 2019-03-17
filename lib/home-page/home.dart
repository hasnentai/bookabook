import 'package:bookabook/home-page/categories-controller.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:shared_preferences/shared_preferences.dart';

CatController catController = CatController();

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
  List _categories;
  void initState() {
    email = widget.email;
    displayName = widget.displayName;
    _fetchCats();
    super.initState();
  }

  //fetch categories
  void _fetchCats() async {
    try {
      List categories = await catController.fetchCat();
      setState(() => _categories = categories);
    } catch (e) {
      print(e);
    }
  }

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

  Widget _categoryBuilder() {
    return _categories == null
        ? Center(
            child: CircularProgressIndicator(),
          )
        : GridView.builder(
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemCount: _categories.length,
            itemBuilder: (BuildContext context, index) {
              return Card(
                child: Center(
                  child: Text(_categories[index]['name']),
                ),
              );
            },
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

  Widget homeBodybuilder(BuildContext context) {
    return _categoryBuilder();
  }
}
