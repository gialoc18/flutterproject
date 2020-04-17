import 'dart:math';

import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flappy_search_bar/scaled_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp1/widgets/article/article_list.dart';
class SearchApp extends StatefulWidget{
  SearchApp({Key key , this.title}) : super(key : key);
  final String title;
  @override
  _SearchAppState createState() => new _SearchAppState();
}
class _SearchAppState extends State<SearchApp>{
  final SearchBarController<Post> _searchBarController = SearchBarController();
  bool isReplay = false;

  Future<List<Post>> _getALlPosts(String text) async {
    await Future.delayed(Duration(seconds: text.length == 4 ? 10 : 1));
    if (isReplay) return [Post("Replaying !", "Replaying body")];
    if (text.length == 5) throw Error();
    if (text.length == 6) return [];
    List<Post> posts = [];

    var random = new Random();
    for (int i = 0; i < 10; i++) {
      posts.add(Post("$text $i", "body random number : ${random.nextInt(100)}"));
    }
    return posts;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tìm kiếm'),
      ),
      body: SafeArea(
        child: SearchBar<Post>(
          searchBarPadding: EdgeInsets.symmetric(horizontal: 10),
          headerPadding: EdgeInsets.symmetric(horizontal: 10),
          listPadding: EdgeInsets.symmetric(horizontal: 10),
          onSearch: _getALlPosts,
          searchBarController: _searchBarController,
//          placeHolder: Text("Nhập thông tin tìm kiêm"),
          cancellationWidget: Text("Cancel"),
          emptyWidget: Text('empty'),
          indexedScaledTileBuilder: (int index) => ScaledTile.count(1, 1),
          onCancelled: () {
            print("Cancelled triggered");
          },
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          crossAxisCount: 1,
          onItemFound: (Post post, int index) {
              return Container(
                color: Colors.lightBlue,
                child: ListTile(
                  title: Text(post.title),
                  isThreeLine: true,
                  subtitle: Text(post.body),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Detail()));
                  },
                ),
              );
          },
        ),
      ),
    );
  }
}
class Detail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.of(context).pop(),
            ),
            Text("Detail"),
          ],
        ),
      ),
    );
  }
}
class Post {
  final String title;
  final String body;

  Post(this.title, this.body);
}
