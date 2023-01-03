import 'dart:convert';

import 'package:http/http.dart' as http;

class Request {
  Future<http.Response> postAPIwithoutAuth(url, body) async {
    return http.post(Uri.parse(url),
        body: json.encode(body),
        headers: {"Content-Type": "application/json"},
        encoding: Encoding.getByName("utf-8"));
  }
}
