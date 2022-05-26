import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/foundation.dart';

class NetworkHelper {
  NetworkHelper({required this.url});

  final String url;

  Future fetchData() async {
    var response = await http.get(
      Uri.parse(url),
    );
    if (response.statusCode == 200) {
      String data = response.body;

      var decodedData = jsonDecode(data);

      return decodedData;
    } else {
      if (kDebugMode) {
        print(
          response.statusCode,
        );
      }
    }
  }
}
