
import 'package:flutter/material.dart';
import 'package:flutterapp1/widgets/article/article_list.dart';
class Asean extends StatefulWidget {
  @override
  _AseanState createState() => _AseanState();
}

class _AseanState extends State<Asean> {
  final parentId = '1716094';
  Widget AseanDetail(){
    return Text('11111111111');
}
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ArticleList(
        parentId: parentId,
        orderBy: 'publishTime DESC',
        ratio: '16:9',
//        layoutDetail: AseanDetail(),
      ),
    );
  }
}
