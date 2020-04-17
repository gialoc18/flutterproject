import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:flutterapp1/admm/global.dart';
class HomeArticle {
  List datas = List();
  final _httpClient = http.Client();
  Future<Object> loadHomeArticleStatic() async {
    if(currentLanguage == 'vi'){
      final response = await _httpClient.get(domain+UrlApiNews);
      if (response.statusCode != 200) throw http.ClientException(
          'Failed to load story with static');
      var items = json.encode(json.decode(response.body)['items']);
      json.decode(items).forEach((key, value) {
        //print('$key : có giá trị $value');

        datas.add(value);
      });
      //print(datas);
      return datas;

    }

  }
  void dispose() {
    _httpClient.close();
    dispose();
  }
}
