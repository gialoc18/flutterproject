import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:flutterapp1/admm/global.dart';
class IntroduceResponse {
  final _httpClient = http.Client();
  final id = '1716096';
  Future<Object> loadIntroduceArticleStatic() async {
    final response = await _httpClient.get(domain+'api/Content/Category/select&id=${id}');
    if (response.statusCode != 200) throw http.ClientException(
        'Failed to load story with static');
    var items = json.encode(json.decode(response.body));
//    print(items);
    return items;
  }
  void dispose() {
    _httpClient.close();
    dispose();
  }
}
