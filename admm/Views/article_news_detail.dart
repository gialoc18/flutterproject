import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutterapp1/admm/global.dart';
import 'package:flutterapp1/admm/import.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class ArticleNewsDetail extends StatelessWidget {
  final String itemId;
  ArticleNewsDetail({this.itemId});
  Future<dynamic> getData(String id) async{
    final _res = await http.get(domain+'api/Content/Article/select&itemId='+id);
    return json.decode(_res.body);
  }
  @override
  Widget build(BuildContext context) {
    final dynamic args = ModalRoute.of(context).settings.arguments;
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Chi tiết bài viết'),
      ),
      body: FutureBuilder(
        future: getData(args['itemId']),
        // ignore: missing_return
        builder: (context, snapshot){
          if(snapshot.hasData){
            var items = snapshot.data;
            var _brief = (items['brief'] != null && items['brief'] != '') ? items['brief'] : '';
            _brief = _brief.replaceAll('src="/upload', 'src="http://192.168.1.130/upload');
            var _content = (items['content'] != null && items['content'] != '') ? items['content'] : 'Nội dung đang cập nhật';
            _content = _content.replaceAll('src="/upload', 'src="http://192.168.1.130/upload');
            var _source = items['source'];
            return ListView(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    '${DateFormat('dd/MM/yyyy | HH:mm').format(DateTime.fromMillisecondsSinceEpoch((items['createdTime'] != null) ? items['createdTime']*1000 : ''))}',
                    style: TextStyle(fontSize: 13.0,color: Colors.black45),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10.0),
                  child: Text('${(items['title']!=null) ? items['title'] :''}',
                  style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),
                  ),
                ),
                Html(
                  data: """
                    $_brief
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
                    Navigator.pushNamed(context, '/linkwebview', arguments: {
                      'link': url
                    });
                  },
                ),
                Card(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 15.0),
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.flag),
                        Text('Nguồn: $_source'),
                      ],
                    )
                  )
                )
              ],
            );
          }else{
            return Container(child: Center(child: CircularProgressIndicator()));
          }
        },
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 1.0, color: Color(0xFFeaeaea))
        ),
        padding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              child: InkWell(
                  onTap: (){
                   print(args['itemId']);
                  },
                  child: Icon(Icons.arrow_back_ios)
              ),
            ),
            Container(
              child: InkWell(
                  onTap: (){
                    print(args['itemId']);
                  },
                  child: Icon(Icons.bookmark)
              ),
            ),
            Container(
              child: InkWell(
                onTap: (){
                  print(args['itemId']);
                },
                  child: Icon(Icons.share)
              ),
            ),
          ],
        ),
      )
    );
  }
}