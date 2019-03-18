import 'dart:async';
import 'dart:convert';

import 'package:bookabook/constants.dart';
import 'package:http/http.dart' as http;

Constants consts = Constants();

//consumer_key=ck_34efa34549443c3706b49f8525947961737748e5
//consumer_secret=cs_5a3a24bff0ed2e8c66c8d685cb73680090a44f75
class CatController {
  Future<dynamic> fetchCat() async {
    final http.Response response = await http.get(consts.url +
        "/wc/v3/products/categories?" +
        consts.ck +
        "&" +
        consts.cs);
    return json.decode(response.body);
  }
}
