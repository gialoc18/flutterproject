import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:flutterapp1/admm/global.dart';
class ImageArticle {
  List datas = List();
  final _httpClient = http.Client();
  Future<Object> loadImageArticleStatic() async {
    final response = await _httpClient.get(domain+'api/Content/Article/selectAll?type=Article.PhotoAlbum');
    if (response.statusCode != 200) throw http.ClientException(
        'Failed to load story with static');
    var items = json.encode(json.decode(response.body)['items']);
    json.decode(items).forEach((key, value) {
      //print('$key : có giá trị $value');

      datas.add(value);
    });
    return datas;
  }
  void dispose() {
    _httpClient.close();
    dispose();
  }
}
