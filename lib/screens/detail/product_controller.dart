import 'dart:async';
import 'dart:convert';

import 'package:bookabook/constants.dart';
import 'package:bookabook/models/product.dart';
import 'package:http/http.dart' as http;

Constants consts = Constants();

class ProductController {
  Future<dynamic> fetchProduct(String productId) async {
    try {
      http.Response response = await http.get(consts.url +
          "/wc/v3/products/" +
          productId +
          "?" +
          consts.ck +
          "&" +
          consts.cs);
      final Map jsondata =
          await json.decode(response.body); 
      Product product = Product.fromJson(jsondata);
      return product;
    } catch (e) {
      return null;
    }
  }
}
