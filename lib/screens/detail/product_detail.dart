import 'dart:async';
import 'package:flutter_html/flutter_html.dart';
import 'package:bookabook/models/product.dart';
import 'package:bookabook/screens/detail/product_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class Details extends StatefulWidget {
  @override
  _DetailsState createState() => _DetailsState();
}

ProductController controller = ProductController();

class _DetailsState extends State<Details> {
  Product product;
  @override
  void initState() {
    fetchProd();
    super.initState();
  }

  Future<void> fetchProd() async {
    var _product = await controller.fetchProduct('46749');
    if (_product != null) {
      setState(() {
        product = _product;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFF900F),
        title: product == null ? Text('') : Text(product.name),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height / 2.5,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // new Stack(children: <Widget>[]),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Card(
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7)),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(7),
                              child: CachedNetworkImage(
                                  fit: BoxFit.fitHeight,
                                  height: 150,
                                  imageUrl: product == null
                                      ? ''
                                      : product.images[0]['src']),
                            ),
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Wrap(
                          children: <Widget>[
                            // Text(product.shortDescription ?? ''),
                          ],
                        ),
                        // Text('R' + product.price.toString())
                      ],
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
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all()),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Html(
                  data:  product.description ?? '',
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
