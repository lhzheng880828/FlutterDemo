
import 'package:flutter/material.dart';
import 'package:flutter_app/im/touch_callback.dart';

class ImItem extends StatelessWidget {

  final String title;
  final String imagePath;
  final Icon icon;

  ImItem({Key key, @required this.title, this.imagePath, this.icon}):super(key:key);


  @override
  Widget build(BuildContext context) {
    return TouchCallBack(
        child: Container(
          height: 50.0,
          child: Row(
            children: <Widget>[
              Container(
                child: imagePath!=null?Image.asset(imagePath, width: 32.0, height: 32.0,):
                SizedBox(height: 32.0, width: 32.0,child: icon,),
                margin: const EdgeInsets.only(left: 22.0, right: 20.0),
              ),
              Text(title, style: TextStyle(fontSize: 16.0,color: Color(0xff353535)),),
            ],
          ),
        ),
        onPressed: (){
          switch(title){
            case '好友动态':
              Navigator.pushNamed(context, '/friends');
              break;
            case '联系客服':
              break;
          }

    });
  }
}


