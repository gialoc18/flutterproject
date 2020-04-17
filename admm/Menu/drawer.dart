import 'dart:convert';
import 'dart:math';
import 'package:flutterapp1/admm.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp1/admm/ViewsModels/menuReponse.dart';
import 'package:flutterapp1/admm/ViewsModels/menuResponse2.dart';
import 'package:flutterapp1/widgets/article/article_list.dart';
class DrawerMenu extends StatefulWidget{
  @override
  _DrawerMenuState createState() => _DrawerMenuState();
}
class _DrawerMenuState extends State<DrawerMenu> {
  final _menuResponse = MenuResponse2();
  @override
  Widget build(BuildContext context) {
    List<Item>  generateItems(params) {
      return List.generate(params.length, (int index) {
        return Item(
          id: '${(params[index]['id']!=null)?params[index]['id']:''}',
          title: '${(params[index]['title']!=null)?params[index]['title']:''}',
          parentId: '${(params[index]['parentId']!=null)?params[index]['parentId']:'0'}',
          mobileImage: '${(params[index]['mobileImage']!=null)?params[index]['mobileImage']:''}',
          closures: '${(params[index]['closures']!=null)?params[index]['closures']:''}',
          level: '${(params[index]['level']!=null)?params[index]['level']:0}',
          totalChilds: '${(params[index]['totalChilds']!=null)?params[index]['totalChilds']:''}',
            expandedValue:'${(params[index]!=null)?params[index]:''}',
          items: '${(params[index]['items']!=null)?params[index]['items']:''}',
        );
      });
    }

    Widget _buildPanel(params) {
      List<Item> _data = generateItems(params);
   //List<dynamic> _data = params;
      dynamic  _data2 = [];
      return ExpansionPanelList.radio(
        initialOpenPanelValue: 2,
        expansionCallback: (int index, bool isExpanded) {
          var menu2 = _data[index].items;
          print(menu2);
//          json.decode(menu2).forEach((item) => _data2[item.key] = item.value);
//          print(_data2);
        },
        children: _data.map<ExpansionPanelRadio>((Item item) {

          int widthLeft =  int.parse(item.level) * 10;
          return ExpansionPanelRadio(
              value: item.id,
              headerBuilder: (BuildContext context, bool isExpanded) {
                return ListTile(
                  title: Row(
                    children: <Widget>[
                      SizedBox(
                        width: widthLeft.toDouble(),
                      ),
                      Expanded(
                        child: Text(
                          '${(item.level!=null && int.parse(item.level) == 1)?item.title:item.title}',
                          style: (int.parse(item.level) == 1)?TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w600
                          ):TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400
                          ),
                        ),
                      ),

                    ],
                  ),
                  onTap: (){
                    setState(() {
                      if(item.parentId !=null && item.parentId == '0'){
                        if(item.title != null && item.title == 'Trang chủ'){
                          Navigator.pushNamed(context, '/');
                        }
                        Navigator.pushNamed(context, '/');
                        print('${item.title}');
                      }
                      else{
                        ArticleList(
                          parentId: item.id,
                        );
                      }
                      print('${item.parentId}');
                    });

                  },
                );
              },
              body: ExpansionPanelList.radio(
                initialOpenPanelValue: 2,
                expansionCallback: (int index, bool isExpanded) {
                },
                children: _data2.map<ExpansionPanelRadio>((item) {
                  int widthLeft =  int.parse(item.level) * 10;
                  return ExpansionPanelRadio(
                      value: item.id,
                      headerBuilder: (BuildContext context, bool isExpanded) {
                        return ListTile(
                          title: Row(
                            children: <Widget>[
                              SizedBox(
                                width: widthLeft.toDouble(),
                              ),
                              Expanded(
                                child: Text(
                                  '${(item.level!=null && int.parse(item.level) == 1)?item.title:item.title}',
                                  style: (int.parse(item.level) == 1)?TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600
                                  ):TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400
                                  ),
                                ),
                              ),

                            ],
                          ),
                          onTap: (){
                            setState(() {
                              if(item.parentId !=null && item.parentId == '0'){
                                if(item.title != null && item.title == 'Trang chủ'){
                                  Navigator.pushNamed(context, '/');
                                }
                                Navigator.pushNamed(context, '/');
                                print('${item.title}');
                              }
                              else{
                                ArticleList(
                                  parentId: item.id,
                                );
                              }
                              print('${item.parentId}');
                            });

                          },
                        );
                      },
                      body: ListTile(
                          title: Text('${item.items}'),
                          onTap: () {
                            setState(() {
                              _data.removeWhere((currentItem) => item == currentItem);
                            });
                          }
                      )
                  );
                }).toList(),
              )
//              ListTile(
//                  title: Text('${item.expandedValue}'),
//                  onTap: () {
//                    setState(() {
//                      _data.removeWhere((currentItem) => item == currentItem);
//                    });
//                  }
//              )
          );
        }).toList(),
      );
    }


    return Drawer(
      child:  Container(
        child: FutureBuilder<Object>(
            future: _menuResponse.loadMenuResponse2Static(), // a previously-obtained Future<String> or null
            builder: (BuildContext context, AsyncSnapshot<Object> snapshot) {
              if(snapshot.hasData) {
                var items = json.decode(json.encode(snapshot.data));
                return SingleChildScrollView(
                  child: Container(
                    child: _buildPanel(items),
                  ),
                );
              }else{
                return Center(child: CircularProgressIndicator());
              }
            }
        ),
      ),
    );
  }
}

// stores ExpansionPanel state information
class Item {
  String id;
  String title;
  String parentId;
  String mobileImage;
  String closures;
  String level;
  String totalChilds;
  bool isExpanded;
  String expandedValue;
  String items;
  Item({
    this.id,
    this.title,
    this.parentId,
    this.mobileImage,
    this.closures,
    this.level,
    this.totalChilds,
    this.isExpanded = false,
    this.expandedValue,
    this.items,
  });
//  factory Item.fromJson(Map<String, dynamic> itemjson)=> Item(
//      id: itemjson["id"],
//      title: itemjson["title"],
//      parentId: itemjson["parentId"],
//      mobileImage: itemjson["mobileImage"],
//      closures: itemjson["closures"],
//      level: itemjson["level"],
//      totalChilds: itemjson["totalChilds"],
//      isExpanded: itemjson["isExpanded"],
//      expandedValue: itemjson["expandedValue"],
//      items: itemjson["items"],
//  );
}


