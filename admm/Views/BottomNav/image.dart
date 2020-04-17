import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutterapp1/admm.dart';
import 'package:flutterapp1/admm/ViewsModels/imageResponsive.dart';
import 'package:intl/intl.dart';
import 'package:flutterapp1/admm/global.dart';

class ImageApp extends StatefulWidget{
  ImageApp({Key key , this.title}) : super(key : key);
  final String title;
  @override
  _ImageState createState() => new _ImageState();
}
class _ImageState extends State<ImageApp>{
  final _imageResponse = ImageArticle();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: FutureBuilder<Object>(
          future: _imageResponse.loadImageArticleStatic(), // a previously-obtained Future<String> or null
          builder: (BuildContext context, AsyncSnapshot<Object> snapshot) {
            if(snapshot.hasData) {
              var items = json.decode(json.encode(snapshot.data));
              return  ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, i) {
                    return Card(
                      child: InkWell(
                          onTap: (){
                            Navigator.pushNamed(context, '/Article.News.detail', arguments: {
                              'itemId': items[i]['id']
                            });
                          },
                        child: Container(
                          padding: EdgeInsets.all(10.0),
                          child: Column(
                            children: <Widget>[
                              Image.network(domainImg+'${items[i]['image']}'),
                              Container(
                                padding: EdgeInsets.only(top: 10.0),
                                child: Text(
                                  '${(items[i]['title'] != null)? items[i]['title'] : ''}',
                                  style: TextStyle(
                                    fontFamily: 'Arial',
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.lightBlue,
                                  ),
                                ),
                              ),
                              Row(
                                children: <Widget>[

                                  Text(
                                    '${DateFormat('dd/MM/yyyy').format(DateTime.fromMillisecondsSinceEpoch((items[i]['createdTime'] != null) ? items[i]['createdTime']*1000 : ''))}',
                                    style: TextStyle(fontSize: 14.0,color: Colors.black45),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(left: 10.0),
                                    child: Text(
                                      '${(items[i]['category'] != false) ? items[i]['category']['title'] : ''}',
                                      style: TextStyle(fontSize: 16.0,),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  });
            }else{
              return Center(child: CircularProgressIndicator());
            }
          }
      ),
    );
  }
}