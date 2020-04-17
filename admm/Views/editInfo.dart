import 'package:flutter/material.dart';
import 'package:flutterapp1/admm/ViewsModels/edit_info_model.dart';
import 'package:flutterapp1/admm/import.dart';
import 'package:flutterapp1/admm/widget/form_group.dart';

import '../global.dart';
class EditInfomation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<EditInfoModel>(
      create: (_) => EditInfoModel(),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: EditInfoState(),
      ),
    );
  }
}

class EditInfoState extends StatefulWidget {
  @override
  _EditInfomationState createState() => _EditInfomationState();
}

class _EditInfomationState extends State<EditInfoState> {
  final _fullNameController = new TextEditingController();
  //final _phoneController = new TextEditingController()
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _EditInfomationState();
  }
  @override
  Widget build(BuildContext context) {
    final _model = EditInfoModel.of(context);
    return Scaffold(
      appBar: AppBar(

        title: Text('Chỉnh sửa thông tin'),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
          child: Column(
//            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: Column(
                  children: <Widget>[
                    Image.network(domainImg +'/upload/2001276/20200207/logo3_544dd.png'),
                    Text(
                        'Hội nghị quốc phòng - quân sự Asean', style: TextStyle(fontSize: 24,),textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),

              Container(
                padding: EdgeInsets.only(top:20,bottom: 20),
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Hồ sơ của tôi",style: TextStyle(fontSize: 14,color: Colors.black)),
                    SizedBox(height: 5,),
                    Text("Quản lý hồ sơ thông tin hồ sơ để bảo mật tài khoản ",style: TextStyle(fontSize: 14,color: Colors.black),),
                    FormGroup('Họ và tên',
                      required: true,
                      child: StreamBuilder(
                        stream: _model.fullNameStream,
                        builder: (_, snapshot){
                          return TextFormField(
                            keyboardType: TextInputType.text,
                            controller: _fullNameController,
                            onChanged: (value){
                              _model.fullName = value;
                            },
                            decoration: _inputDecoration(
                              hintText: "Họ và tên",
                              //errorText: snapshot.hasError?snapshot.error:null,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
          ],
          ),
      )
    );
  }
  InputDecoration _inputDecoration({String hintText, String errorText}){
    return InputDecoration(
      hintText: hintText,
      errorText: errorText,
      contentPadding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        borderSide: BorderSide(color: Color(0xFFCCCCCC), width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        borderSide: BorderSide(color: Colors.blue, width: 1),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        borderSide: BorderSide(color: Colors.red, width: 1),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        borderSide: BorderSide(color: Colors.red, width: 1),
      ),
    );
  }

}
