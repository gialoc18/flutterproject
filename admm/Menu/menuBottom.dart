import 'package:flutter/material.dart';
import 'package:flutterapp1/admm/import.dart';

class MenuBottom extends StatefulWidget {
  @override
  _MenuBottomState createState() => _MenuBottomState();
}

class _MenuBottomState extends State<MenuBottom> {

  int _selectedIndex;
  Widget _currentPage;
  @override
  Widget build(BuildContext context) {
    return  BottomNavigationBar(
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text('Trang chủ'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.videocam),
          title: Text('Video'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.image),
          title: Text('Ảnh'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.bookmark),
          title: Text('Bookmark'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          title: Text('Cài đặt'),

        ),
      ],
      onTap:(index) => _onItemTappedTabBottom(index),
//            currentIndex: _selectedIndex,
    );
  }
  final tabBottoms = [
    Home(),
    Video(),
    ImageApp(),
    Bookmark(),
    SettingApp(),
  ];
  void _onItemTappedTabBottom(int index) {
    setState(() {
      print(_selectedIndex);
      _selectedIndex = index;
      _currentPage = tabBottoms[_selectedIndex];
    });
  }
}
