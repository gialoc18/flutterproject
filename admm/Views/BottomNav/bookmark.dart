import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutterapp1/admm.dart';
import 'package:flutterapp1/admm/ViewsModels/bookmarkResponse.dart';
class Bookmark extends StatefulWidget{
  Bookmark({Key key , this.title}) : super(key : key);
  final String title;
  @override
  _BookmarkState createState() => new _BookmarkState();
}
class _BookmarkState extends State<Bookmark>{
  var  _bookmarkName = 'thông tin 1';
  var  _bookmarkDate = '20/02/2020';
  @override
  Widget build(BuildContext context) {
    final _bookmarkReponse = BookmarkResponse();
    // TODO: implement build
    return  Container(
      child: FutureBuilder<Object>(
          future: _bookmarkReponse.loadBookmarkResponseStatic(), // a previously-obtained Future<String> or null
          builder: (BuildContext context, AsyncSnapshot<Object> snapshot) {
            if(snapshot.hasData) {
              var items = json.decode(json.encode(snapshot.data));
              return  ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, i) {
                    return Text('Không có dữ liệu');
                  });
            }else{
              return  ListView(
                children: <Widget>[
                  Card(
                    child:  Row(
                      children: <Widget>[
                        Expanded(
                            flex: 2,
                            child: Container(
                              padding: EdgeInsets.only(left: 5.0),
                              child: Image.asset('images/no-avatar.png'),
                            )
                        ),
                        Expanded(
                            flex: 8,
                            child: ListTile(
                              title: Text('$_bookmarkName'),
                              subtitle: Text('$_bookmarkDate'),
                            )
                        ),
                        Expanded(
                          flex: 2,
                          child:  IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: (){
                              }
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              );
              return Center(child: CircularProgressIndicator());
            }
          }
      ),
    );
  }
}