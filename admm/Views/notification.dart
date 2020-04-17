import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutterapp1/admm/ViewsModels/notificationResponse.dart';
import 'package:flutterapp1/admm/import.dart';
class Notifications extends StatefulWidget{
  Notifications({Key key , this.title}) : super(key : key);
  final String title;

  @override
  _NotificationState createState() => new _NotificationState();
}
class _NotificationState extends State<Notifications>{
  final _notificationReponse = NotificationResponse();
  @override
  Widget build(BuildContext context) {
    String _notiName = 'Push sự kiện';
    String _notiDate = '20/02/2020';
    // TODO: implement build
    return  Scaffold(
      appBar: AppBar(title: Text("Thông báo")),
      body :  Container(
        child: FutureBuilder<Object>(
            future: _notificationReponse.loadNotificationResponseStatic(), // a previously-obtained Future<String> or null
            builder: (BuildContext context, AsyncSnapshot<Object> snapshot) {
              if(snapshot.hasData) {
                var items = json.decode(json.encode(snapshot.data));
                return  ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (context, i) {
                      return Text('11');
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
                                title: Text('$_notiName'),
                                subtitle: Text('$_notiDate'),
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
              }
            }
        ),
      ),
    );
  }
}