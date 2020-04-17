
import 'package:flutter/material.dart';
import 'package:flutterapp1/widgets/article/article_list.dart';
class VietNam extends StatefulWidget {
  @override
  _VietNamState createState() => _VietNamState();
}

class _VietNamState extends State<VietNam> {
  final parentId = '1716093';
  Widget VietNamDetail(){
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
