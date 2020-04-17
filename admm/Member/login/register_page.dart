import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp1/admm/Member/login/login_page.dart';

import '../../global.dart';


class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => new _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String img_logo = '/upload/2001276/20200212/Vie_73372.png';
    final logo = Image.network(domainImg+'/upload/2001276/20200212/Vie_73372.png');
  @override
  Widget build(BuildContext context) {
    final name = TextFormField(
      keyboardType: TextInputType.text,
      autofocus: false,
      decoration: InputDecoration(
        labelText: 'Tên đăng nhập',
        hintText: 'Tên đăng nhập',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final email = TextFormField(
      keyboardType: TextInputType.text,
      autofocus: false,
      decoration: InputDecoration(
        labelText: 'Email',
        hintText: 'Email',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final password = TextFormField(
      autofocus: false,
      obscureText: true,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: 'Mật khẩu',
        labelStyle: TextStyle(fontSize: 16.0),
        hintText: 'Mật khẩu',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final configPassword = TextFormField(
      autofocus: false,
      obscureText: true,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: 'Nhập lại mật khẩu',
        labelStyle: TextStyle(fontSize: 16.0),
        hintText: 'Nhập lại mật khẩu',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () {
// Navigator.of(context).pushNamed(LoginPage.tag);
        },
        padding: EdgeInsets.all(12),
        color: Colors.lightBlue,
        child: Text('Đăng ký', style: TextStyle(color: Colors.white, fontSize: 18.0)),
      ),
    );


    final buttonRegister = Row(

      children: <Widget>[
        Expanded(
          child: FlatButton(
            child: Text(
              'Đăng nhập',
              style: TextStyle(color: Colors.black54, fontSize: 16.0,),
            ),
            onPressed: (){
              Navigator.pushNamed(context, '/loginPage');
            },
          ),
        ),
      ],
    );


    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 25.0, right: 25.0),
          children: <Widget>[
            logo,
            SizedBox(height: 16.0),
            name,
            SizedBox(height: 8.0),
            email,
            SizedBox(height: 8.0),
            password,
            SizedBox(height: 8.0),
            configPassword,
            SizedBox(height: 16.0),
            loginButton,
            buttonRegister,

          ],
        ),
      ),
    );
  }
}