import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp1/layouts/Article/grid-default.dart';
import 'package:flutterapp1/admm/ViewsModels/homeResponse.dart';
class Home extends StatefulWidget{
//  HomePage({Key key, this.title}) : super(key: key);
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<Home>{
  final _homeResponse = HomeArticle();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<Object>(
          future: _homeResponse.loadHomeArticleStatic(), // a previously-obtained Future<String> or null
          builder: (BuildContext context, AsyncSnapshot<Object> snapshot) {
            if(snapshot.hasData) {
              var items = json.decode(json.encode(snapshot.data));
              return   ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, i) {
                    return ArticleGridDefault(items[i]);
                  });
            }else{
              return Center(child: CircularProgressIndicator());
            }
          }
      ),
    );
  }
}
