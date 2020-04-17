
import 'package:flutter/material.dart';
import 'package:flutterapp1/widgets/article/article_list.dart';
class Conference extends StatefulWidget {
  @override
  _ConferenceState createState() => _ConferenceState();
}

class _ConferenceState extends State<Conference> {
  final parentId = '1716095';
  Widget ConferenceDetail(){
    return Text('11111111111');
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ArticleList(
        parentId: parentId,
        orderBy: 'publishTime DESC',
        ratio: '16:9',
//        layoutDetail: ConferenceDetail(),
      ),
    );
  }
}
