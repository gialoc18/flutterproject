
import 'package:flutter/material.dart';
import 'package:flutterapp1/widgets/article/article_list.dart';
class NewpaperInfo extends StatefulWidget {
  @override
  _NewpaperInfoState createState() => _NewpaperInfoState();
}

class _NewpaperInfoState extends State<NewpaperInfo> {
  final parentId = '1716092';
  Widget NewpaperInfoDetail(){
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
