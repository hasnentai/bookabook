import 'package:bookabook/widgets/header.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: SingleChildScrollView(child: registerPageBuilder(context)),
    );
  }
}

Widget registerPageBuilder(BuildContext context) {
  return Column(
    children: <Widget>[
      Header(),
      Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 15.0, 8.0, 15.0),
        child: new Row(
          children: <Widget>[
            new Container(
              child: Icon(
                Icons.add_a_photo,
                color: Colors.white,
                size: 44.0,
              ),
              height: 110.0,
              width: 110.0,
              decoration: new BoxDecoration(
                border: new Border.all(color: Colors.white, width: 4.0),
                borderRadius: new BorderRadius.circular(200.0),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [const Color(0xFFFF900F), const Color(0xFFF46948)],
                  // whitish to gray
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10.0, // has the effect of softening the shadow
                    // has the effect of extending the shadow
                    offset: Offset(
                      0, // horizontal, move right 10
                      8.0, // vertical, move down 10
                    ),
                  )
                ],
              ),
            ),
            Expanded(
                child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: new TextFormField(
                      decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'First Name',
                    hasFloatingPlaceholder: true,
                  )),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: new TextFormField(
                      decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Last Name',
                    hasFloatingPlaceholder: true,
                  )),
                )
              ],
            )),
          ],
        ),
      ),
      Row(
        children: <Widget>[
          Expanded(
              child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: new TextFormField(
                    decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                  hasFloatingPlaceholder: true,
                )),
              ),
              SizedBox(
                height: 15.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: new TextFormField(
                    decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Phone',
                  hasFloatingPlaceholder: true,
                )),
              )
            ],
          )),
        ],
      ),
      new Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: new Container(
                height: 70.0,
                width: 70.0,
                decoration: new BoxDecoration(
                  borderRadius: new BorderRadius.circular(200.0),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [const Color(0xFFFF900F), const Color(0xFFF46948)],
                    // whitish to gray
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius:
                          10.0, // has the effect of softening the shadow
                      // has the effect of extending the shadow
                      offset: Offset(
                        0, // horizontal, move right 10
                        8.0, // vertical, move down 10
                      ),
                    )
                  ],
                ),
                child: RotatedBox(
                    quarterTurns: 2,
                    child: Icon(
                      Icons.keyboard_backspace,
                      color: Colors.white,
                      size: 30.0,
                    ))),
          )
        ],
      )
    ],
  );
}
