import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2.3,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Stack(
            children: <Widget>[
              Positioned(
                  right: 10.0,
                  top: 0.0,
                  child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: new Icon(
                        Icons.close,
                        size: 30.0,
                        color: Colors.white,
                      ))),
              Positioned(
                left: 20.0,
                child: Transform(
                  transform: Matrix4.rotationZ(0.2),
                  child: Opacity(
                    opacity: 0.6,
                    child: new Icon(
                      Icons.class_,
                      size: 40.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Positioned(
                right: 20.0,
                top: 30.0,
                child: Transform(
                  transform: Matrix4.rotationZ(0.5),
                  child: Opacity(
                    opacity: 0.7,
                    child: new Icon(
                      Icons.class_,
                      size: 60.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 130.0,
                top: 110.0,
                child: Transform(
                  transform: Matrix4.rotationZ(2.0),
                  child: Opacity(
                    opacity: 0.4,
                    child: new Icon(
                      Icons.class_,
                      size: 40.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Positioned(
                right: 10.0,
                top: 180.0,
                child: Transform(
                  transform: Matrix4.rotationZ(3.0),
                  child: Opacity(
                    opacity: 0.6,
                    child: new Icon(
                      Icons.class_,
                      size: 40.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Center(
                child: Hero(
                  tag: 'icon',
                  child: new Icon(
                    Icons.class_,
                    size: 200.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text(
                'Book a Book',
                style: new TextStyle(
                    fontSize: 24.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w600),
              )
            ],
          )
        ],
      ),
      decoration: new BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [const Color(0xFFFF900F), const Color(0xFFF46948)],
          // whitish to gray
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6.0, // has the effect of softening the shadow
            // has the effect of extending the shadow
            offset: Offset(
              0, // horizontal, move right 10
              3.0, // vertical, move down 10
            ),
          )
        ],
        borderRadius: new BorderRadius.vertical(
            bottom: new Radius.elliptical(
                MediaQuery.of(context).size.width, 100.0)),
      ),
    );
  }
}
