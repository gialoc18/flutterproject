import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:flutterapp1/admm/global.dart';
class MenuResponse2{
  final _httpClient = http.Client();
  Future<Object> loadMenuResponse2Static() async {
    final response = await _httpClient.get('http://192.168.1.130/admm1/api/Content/Category/getTree');
    if (response.statusCode != 200) throw http.ClientException(
        'Failed to load story with static');
    var items = json.decode(response.body);
    return items;
  }
  void dispose() {
    http.Client().close();
    dispose();
  }
}
