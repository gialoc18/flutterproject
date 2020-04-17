import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp1/admm/Member/login/forgotPassword_page.dart';
import 'package:flutterapp1/admm/Member/login/register_page.dart';
import 'package:flutterapp1/admm/global.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
var img_logo = '/upload/2001276/20200212/Vie_73372.png';
  @override
  Widget build(BuildContext context) {
    final logo = Image.network(domainImg+'$img_logo');
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

    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () {
        },
        padding: EdgeInsets.all(12),
        color: Colors.lightBlue,
        child: Text('Đăng nhập', style: TextStyle(color: Colors.white, fontSize: 18.0)),
      ),
    );

    final registerButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () {
        },
        padding: EdgeInsets.all(12),
        color: Colors.lightBlue,
        child: Text('Đăng ký', style: TextStyle(color: Colors.white, fontSize: 18.0)),
      ),
    );

    final forgotAndRegister = Row(
      mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FlatButton(
            child: Text(
              'Quên mật khẩu?',
              style: TextStyle(color: Colors.black54, fontSize: 16.0,),
            ),
            onPressed: (){
              Navigator.pushNamed(context, '/forgotPasswordPage');
            },
          ),
        ],
    );

    final dividerLogin = Container(
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Divider(
              thickness: 1,
            ),
          ),
          Text(' or '),
          Expanded(
            child: Divider(
              thickness: 1,
            ),
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
    );

    final createAccountLabel = Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Chưa có tài khoản ',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            width: 5,
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => RegisterPage()));
            },
            child: Text(
              'Đăng ký',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );


    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(horizontal: 25),
          children: <Widget>[
            logo,
            SizedBox(height: 20.0),
            name,
            SizedBox(height: 5.0),
            password,
            SizedBox(height: 5.0),
            loginButton,
            forgotAndRegister,
//            Container(
//              child: Row(
//                mainAxisAlignment: MainAxisAlignment.spaceAround,
//                children: <Widget>[
//                  Expanded(
//                    child: FlatButton(
//                      padding: EdgeInsets.all(13),
//                      shape: RoundedRectangleBorder(
//                        borderRadius: BorderRadius.circular(24),
//                      ),
//                      child:  Text('Đăng nhập',style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w400),),
//                      onPressed: () {
//
//                      },
//                      color: Color(0xFF337ab7),
//                    ),
//                  ),
//                  SizedBox(width: 15,),
//                  Expanded(
//                    child: FlatButton(
//                      padding: EdgeInsets.all(13),
//                      shape: RoundedRectangleBorder(
//                        borderRadius: BorderRadius.circular(24),
//                      ),
//                      child:  Text(
//                        'Đăng ký',
//                        style: TextStyle(
//                          color: Colors.white,
//                            fontSize: 18,fontWeight: FontWeight.w400
//                        ),
//                      ),
//                      onPressed: () {/* ... */},
//                      color: Color(0xFF337ab7),
//                    ),
//                  )
//                ],
//              ),
//            ),
            dividerLogin,
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  createAccountLabel
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}