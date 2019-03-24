import 'dart:async';

import 'package:bookabook/models/product.dart';
import 'package:bookabook/screens/home-page/categories-controller.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:cached_network_image/cached_network_image.dart';

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
  final List<Category> _categories = <Category>[];
  List _products = [];
  List _masterData = [];

  bool isError = false;

  void initState() {
    email = widget.email;
    displayName = widget.displayName;
    // _fetchProducts();
    fetchCats();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> fetchCats() async {
    final List<Category> categories = await catController.fetchCats();
    if (categories != null) {
      setState(() => _categories.addAll(categories));
    } else {
      setState(() => isError = true);
    }
  }

  // Future<void> _fetchProducts() async {
  //   List products = await catController.fetchProducts();
  //   setState(() => _products = products);
  //   print(_products);
  //   await uniqueList(_products);
  // }

  uniqueList(List list) async {
    print('called');
    final List unique = [];
    for (var i = 0; i < list.length; i++) {
      if (!unique.contains(list[i]['categories'][0]['name'])) {
        unique.add(list[i]['categories'][0]['name']);
      }
      // print(list[i]['categories'][0]['name']);
    }

    // setState(() {
    //   if (_categories == null) {
    //     _categories = unique;
    //   } else {
    //     _categories.addAll(unique);
    //   }
    // });
    finalComp();
  }

  finalComp() async {
    List masterData = [];
    final List temp = [];
    for (int i = 0; i < _categories.length; i++) {
      for (int j = 0; j < _products.length; j++) {
        if (_categories[i] == _products[j]['categories'][0]['name']) {
          temp.add(_products[j]);
        }

        // print(temp);
      }

      Map jsonMap = {_categories[i]: temp};
      // print(jsonMap);
      masterData.add(jsonMap);
      // print(masterData);
      // temp.clear();
    }

    setState(() {
      if (_masterData.isEmpty) {
        _masterData = masterData;
      } else {
        _masterData.addAll(masterData);
      }
    });
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
        Column(
          children: _categories.map<Widget>((item) {
            return ListTile(
              title: Text(item.name),
            );
          }).toList(),
        ),
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
        body: StreamBuilder<Object>(
            stream: catController.fetchProducts(),
            builder: (context, snapshot) {
              if (snapshot.hasError) setState(() => isError = true);

              if (!snapshot.hasData)
                return Center(child: CircularProgressIndicator());
              return homeBodybuilder(context, snapshot.data);
            }));
  }

  Widget homeBodybuilder(BuildContext context, List<Product> data) {
    if (isError) {
      return Center(
        child: Text('Database Error'),
      );
    } else {
      return ListView.builder(
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) {
          return _buildCarousel(context, index, data);
        },
      );
    }
  }

  Widget _buildCarousel(context, index, List<Product> data) {
    // var cat = _categories[index];
    // print(_masterData[index][cat].length);
    // List data = _masterData[index][cat];
    String imgUrl =
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTJftYqJsvhphX6OOjKMjbwllPKR70rAjXcpsP3tQ8XM7-tqRm4';
    return CarouselSlider(
        height: 250,
        items: data.map((item) {
          // if (item['images'].isNotEmpty) {
          //   imgUrl = item['images'][0]['src'];
          // }
          return Card(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                FittedBox(
                  fit: BoxFit.fitHeight,
                  child: FadeInImage(
                    height: 150,
                    width: 200,
                    image: item.images.isEmpty
                        ? CachedNetworkImageProvider(imgUrl)
                        : CachedNetworkImageProvider(item.images[0]['src']),
                    // fit: BoxFit.cover,
                    placeholder: AssetImage('res/placeholder.jpg'),
                  ),
                ),
                ListTile(
                  title: Text(
                    item.name,
                    softWrap: true,
                  ),
                )
              ],
            ),
          );
        }).toList());
  }
}
