import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: registerPageBuilder(context),
    );
  }
}

Widget registerPageBuilder(BuildContext context) {
  return new Stack(
    children: <Widget>[headerbuilder(context)],
  );
}

Widget headerbuilder(BuildContext context) {
  return new Container(
    height: 200.0,
    decoration: new BoxDecoration(
      color: Colors.orange,
      boxShadow: [new BoxShadow(blurRadius: 40.0)],
      borderRadius: new BorderRadius.vertical(
          bottom:
              new Radius.elliptical(MediaQuery.of(context).size.width, 100.0)),
    ),
  );
}
