import 'package:flutter/material.dart';

class FormGroup extends StatelessWidget{
  final String title;
  final Widget child;
  final String errorText;
  final bool required;

  const FormGroup(this.title,{
    this.required: false,
    this.errorText: '',
    this.child,
  });
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _label(),
          _errorText(),
          this.child,
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
  Widget _errorText(){
    if(errorText != ''){
      return Column(
        children: <Widget>[
          SizedBox(height: 5,),
          Semantics(
            container: true,
            liveRegion: true,
            child: Text(
              errorText,
              style: TextStyle(fontSize: 12, color: ThemeData.light().errorColor),
              textAlign: TextAlign.left,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
          SizedBox(height: 5,),
        ],
      );
    }else{
      return SizedBox(height: 5,);
    }
  }
  Widget _label(){
    if(required == true){
      return RichText(
        text: TextSpan(
            text: this.title,
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14.0,
                color: Colors.black87
            ),
            children: <TextSpan>[
              TextSpan(
                text: ' (*)',
                style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 16.0,
                    color: Colors.red
                ),
              )
            ]
        ),
      );
    }else{
      return Text(
        this.title.toString(),
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14.0,
            color: Colors.black87
        ),
      );
    }
  }
}