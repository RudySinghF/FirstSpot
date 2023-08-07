import "dart:convert";
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import "package:http/http.dart" as http;
import "package:logger/logger.dart";

class NetworkHandler {
  String baseUrl = "https://node-api-vercel-q3ziyzylo-rudysinghf.vercel.app";
  var log = Logger();
  FlutterSecureStorage storage = FlutterSecureStorage();

  Future get(String url) async {
    String? token = await storage.read(key: "token");
    url = formatter(url);
    var response =
        await http.get(Uri.parse(url), headers: {"Authorization": "$token"});
    if (response.statusCode == 200 || response.statusCode == 201) {
      log.i(response.body);
      return json.decode(response.body);
    }
    log.i(response.body);
    log.i(response.statusCode);
  }

  Future getquery(String url) async {
    url = formatter(url);
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200 || response.statusCode == 201) {
      log.i(response.body);

      return json.decode(response.body);
    }
    log.i(response.body);
    log.i(response.statusCode);
  }

  Future<http.Response> post(String url, Map<String, Object> body) async {
    url = formatter(url);
    var response = await http.post(Uri.parse(url),
        headers: {"Content-type": "application/json"}, body: json.encode(body));
    return response;
  }

  String formatter(String url) {
    return baseUrl + url;
  }

  Future<http.Response> patch(String url, Map<String, String> body) async {
    url = formatter(url);
    log.d(body);
    var response = await http.patch(
      Uri.parse(url),
      headers: {"Content-type": "application/json"},
      body: json.encode(body),
    );
    return response;
  }
}
