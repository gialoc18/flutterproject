import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutterapp1/admm/ViewsModels/introduceResponse.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Introduce extends StatelessWidget{
  final _introduceResponse = IntroduceResponse();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: _introduceResponse.loadIntroduceArticleStatic(),
        builder: (BuildContext context, AsyncSnapshot<Object> snapshot) {
          if(snapshot.hasData){
            final String content = '''${json.decode(snapshot.data)['content'].toString()}''';
            var items = json.decode(snapshot.data);
            var _content = (items['content'] != null && items['content'] != '') ? items['content'] : 'Giới thiệu đang cập nhật';
            _content = _content.replaceAll('src="/upload', 'src="http://192.168.1.130/upload');
            return  Container(
                  child:ListView(
                    children: <Widget>[
                      Html(
                        data: """
                    $_content
                  """,
                        padding: EdgeInsets.all(10.0),
                        backgroundColor: Colors.white70,
                        defaultTextStyle: TextStyle(fontFamily: 'serif',fontSize: 16),
                        linkStyle: const TextStyle(
                          color: Colors.redAccent,
                        ),
                        onLinkTap: (url) {
                        },
                      ),
                    ],
                  ),
                );
          }
          else{
            return Center(child: CircularProgressIndicator());
          }
        }
      ),
    );
  }

}
