import 'package:flutter/material.dart';
import '../import.dart';

class ChangePassWord extends StatefulWidget {
  @override
  _ChangePassWordState createState() => _ChangePassWordState();
}

class _ChangePassWordState extends State<ChangePassWord> {
  static bool passwordVisibleOld = true;
  static bool passwordVisibleNew = true;
  static bool passwordVisibleConfluent = true;
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    passwordVisibleOld = true;
    passwordVisibleNew = true;
    passwordVisibleConfluent = true;
  }
  @override
  Widget build(BuildContext context) {
    final TextFormField _txtPasswordOld = new TextFormField(
      keyboardType: TextInputType.text,
      //controller: _userPasswordController,
      obscureText: passwordVisibleOld,
      decoration: InputDecoration(
        labelText: 'Mật khẩu cũ',
        contentPadding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          borderSide: BorderSide(color: Color(0xFFCCCCCC), width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          borderSide: BorderSide(color: Colors.blue, width: 1),
        ),
        suffixIcon: IconButton(
          icon: Icon(
            // Based on passwordVisible state choose the icon
            passwordVisibleOld
                ? Icons.visibility
                : Icons.visibility_off,
            color: Theme.of(context).primaryColorDark,
          ),
          onPressed: () {
            setState(() {
              passwordVisibleOld = !passwordVisibleOld;
            });
          },
        ),
      ),
    );
    final TextFormField _txtPassWordNew = new TextFormField(
      keyboardType: TextInputType.text,
      //controller: _userPasswordController,
      obscureText: passwordVisibleNew,
      decoration: InputDecoration(
        labelText: 'Mật khẩu mới',
        contentPadding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          borderSide: BorderSide(color: Color(0xFFCCCCCC), width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          borderSide: BorderSide(color: Colors.blue, width: 1),
        ),
        suffixIcon: IconButton(
          icon: Icon(
            // Based on passwordVisible state choose the icon
            passwordVisibleNew
                ? Icons.visibility
                : Icons.visibility_off,
            color: Theme.of(context).primaryColorDark,
          ),
          onPressed: () {
            setState(() {
              passwordVisibleNew = !passwordVisibleNew;
            });
          },
        ),
      ),
    );
    final TextFormField _txtPasswordConfluent = new TextFormField(
      keyboardType: TextInputType.text,
      //controller: _userPasswordController,
      obscureText: passwordVisibleConfluent,
      decoration: InputDecoration(
        labelText: 'Nhập lại mật khẩu',
        contentPadding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          borderSide: BorderSide(color: Color(0xFFCCCCCC), width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          borderSide: BorderSide(color: Colors.blue, width: 1),
        ),
        suffixIcon: IconButton(
          icon: Icon(
            // Based on passwordVisible state choose the icon
            passwordVisibleConfluent
                ? Icons.visibility
                : Icons.visibility_off,
            color: Theme.of(context).primaryColorDark,
          ),
          onPressed: () {
            setState(() {
              passwordVisibleConfluent = !passwordVisibleConfluent;
            });
          },

        ),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Thay đổi mật khẩu'),
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
          onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
          },
          child:Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                //Image.network(domainImg +'/upload/2001276/20200207/logo3_544dd.png'),
                Image.asset('images/Vie_73372.png'),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Column(
                    children: <Widget>[
                      _txtPasswordOld,
                      SizedBox(height: 10,),
                      _txtPassWordNew,
                      SizedBox(height: 10,),
                      _txtPasswordConfluent,
                      RaisedButton(
                        onPressed: () {},
                        color: Colors.blue,
                        child: const Text(
                            'Lưu lại',
                            style: TextStyle(fontSize: 16,
                            color: Colors.white),
                        ),
                      ),
                    ],
                  ),

                )
              ],
            ),
        ))
    );
  }
}
