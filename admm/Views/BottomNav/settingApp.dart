import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp1/admm/import.dart';

class SettingApp extends StatefulWidget{
  SettingApp({Key key , this.title}) : super(key : key);
  final String title;
  @override
  _SettingAppState createState() => new _SettingAppState();
}
class _SettingAppState extends State<SettingApp>{
  @override
  Widget build(BuildContext context) {
    String language = 'Tiếng Anh';
    String _name = 'Đặng Văn Phúc';
    String _email = 'phucdv@vhv.vn';
    // TODO: implement build
    return ListView(
      padding: EdgeInsets.only(bottom: 30.0),
      children: <Widget>[
        SizedBox(
          child: Container(
            color:  Color(0xFFeaeaea),
//            decoration: BoxDecoration(
//             borderRadius: BorderRadius.all(Radius.elliptical(0, 15)),
//            ),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 20.0,
                ),
                CircleAvatar(
//                          radius: 28.0,
                  minRadius:24,
                  maxRadius:30,
                  backgroundImage: NetworkImage('http://192.168.1.130/App/Corporate/images/no-avatar.png'),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex:3,
                        child: CircleAvatar(
//                          radius: 28.0,
                          minRadius:24,
                          maxRadius:30,
                          backgroundImage: NetworkImage('http://192.168.1.130/App/Corporate/images/no-avatar.png'),
                        ),
                      ),
                      Expanded(
                        flex: 12,
                        child: Container(
                            child: ListTile(
                              title: Text('$_name',
                                style: TextStyle(
                                  fontSize: 18,fontWeight: FontWeight.w600
                                ),
                              ),
                              subtitle: Text('$_email',
                                style: TextStyle(
                                    fontSize: 16,
                              ),
                              ),
                            )
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Expanded(
                        child: FlatButton(
                          padding: EdgeInsets.all(13),
                          child:  Text('Đăng nhập',style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w500),),
                          onPressed: () {
                            Navigator.pushNamed(context, '/loginPage');
                          },
                          color: Color(0xFF337ab7),
                        ),
                      ),
                      SizedBox(width: 15,),
                      Expanded(
                        child: FlatButton(
                          padding: EdgeInsets.all(13),
                          child:  Text(
                            'Đăng ký',
                            style: TextStyle(
                            fontSize: 18,fontWeight: FontWeight.w400
                            ),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, '/registerPage');
                          },
                          color: Color(0xFFffffff),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),

        ),
        SizedBox(
          height: 10.0,
        ),

        Container(
          padding: EdgeInsets.all(10.0),
          child: Text('Cấu hình'.toUpperCase(),
            style:TextStyle(
              color: Color(0xFF777777),
              fontSize: 16.0,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.all(10.0),
          child: InkWell(
            onTap: () {
            },
            child: Row(
              children: <Widget>[
                Icon(Icons.language,size: 18,),
                Text(
                  'Chuyển ngôn ngữ $language ',
                  style: TextStyle(
                    color: Color(0xFF777777),
                    fontSize: 16,
                  ),
                ),
                Image.network('http://192.168.1.130/App/Corporate/images/Language/en.jpg')
              ],
            )
          ),
        ),
        Container(
          padding: EdgeInsets.all(10.0),
          child: Text('Tài khoản'.toUpperCase(),
            style:TextStyle(
                color: Color(0xFF777777),
                fontSize: 16.0,
                fontWeight: FontWeight.bold
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.all(10.0),
          child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/editInfo');
              },
              child: Row(
                children: <Widget>[
                  Icon(Icons.info_outline,size: 18,),
                  Text(
                    ' Cập nhật thông tin',
                    style: TextStyle(
                      color: Color(0xFF777777),
                      fontSize: 16,
                    ),
                  ),

                ],
              )
          ),
        ),
        Container(
          padding: EdgeInsets.all(10.0),
          child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/changePassword');
              },
              child: Row(
                children: <Widget>[
                  Icon(Icons.vpn_key,size: 18,),
                  Text(
                    ' Đổi mật khẩu',
                    style: TextStyle(
                      color: Color(0xFF777777),
                      fontSize: 16,
                    ),
                  ),
                ],
              )
          ),
        ),
        Container(
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
              width: 0.5,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xFFcccccc)),
            borderRadius: BorderRadius.all(Radius.circular(6)),
          ),
          margin: EdgeInsets.all(10),
          child: MaterialButton(
            elevation: 5.0,
            padding: EdgeInsets.symmetric(vertical: 10,horizontal: 16),
            child: Text("Đăng xuất",style: TextStyle(color: Color(0xFF777777),fontSize: 18.0),),
            onPressed: (){

            },
          ),
        ),
      ],
    );
  }
}