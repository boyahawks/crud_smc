import 'dart:convert';
import 'package:http/http.dart';

class Api {
  static var basicUrl = "https://trmobileapi.gadingemerald.com/tr/test/";

  // node js
  // GET

  // POST

  static Future connectionApi(
      String typeConnect, valFormData, String url) async {
    var getUrl = basicUrl + url;
    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    if (typeConnect == "post") {
      final url = Uri.parse(getUrl);
      final response =
          await post(url, body: jsonEncode(valFormData), headers: headers);
      return response;
    } else {
      final url = Uri.parse(getUrl);
      final response = await get(url, headers: headers);
      return response;
    }
  }
}
