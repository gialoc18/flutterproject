import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:flutterapp1/admm/ViewsModels/videoResponsive.dart';
import 'package:intl/intl.dart';

import '../../global.dart';
class Video extends StatefulWidget{
  Video({Key key , this.title}) : super(key : key);
  final String title;
  @override
  _VideoState createState() => new _VideoState();
}
class _VideoState extends State<Video>{
  final _videoResponse = VideoArticle();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Container(
      child: FutureBuilder<Object>(
          future: _videoResponse.loadVideoArticleStatic(), // a previously-obtained Future<String> or null
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
                              Stack(
                                children: <Widget>[
                                  Image.network(domainImg+'${items[i]['image']}'),
                                  Positioned(
                                    top: 60,
                                    left: 120,
                                    height: 40,
                                    width: 50,
                                    child: Card(
                                      color: Colors.white70,
                                      child: IconButton(onPressed: null, icon: Icon(Icons.play_arrow)),
                                    ),
                                  ),
                                ],
                              ),
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