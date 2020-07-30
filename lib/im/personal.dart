import 'package:flutter/material.dart';
import 'package:flutter_app/im/im_item.dart';
import 'package:flutter_app/im/touch_callback.dart';

class Personal extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(top: 20.0),
            color: Colors.white,
            height: 80.0,
            child: TouchCallBack(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(left: 12.0, right: 15.0),
                      child: Image.asset('images/1.png', width: 70.0, height: 70.0,),
                    ),
                    Expanded(child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('一休',style: TextStyle(fontSize: 18.0, color: Color(0xff353535)),),
                        Text('帐号yixiu',style: TextStyle(fontSize: 14.0, color: Color(0xffa9a9a9)),),
                      ],
                    )),
                    Container(
                      margin: const EdgeInsets.only(left: 12.0, right: 15.0),
                      child: Image.asset('images/code.png', width: 25.0, height: 25.0,),
                    ),
                  ],
                ),
                onPressed: (){

                }),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20.0),
            color: Colors.white,
            child: ImItem(title: '好友动态',imagePath: 'images/1.png',),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20.0),
            color: Colors.white,
            child: Column(
              children: <Widget>[
                ImItem(title: '消息管理', imagePath: 'images/1.png',),
                Padding(padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  child: Divider(
                    height: 0.5,
                    color: Color(0xffd9d9d9),
                  ),
                ),
                ImItem(title: '我的相册', imagePath: 'images/1.png',),
                Padding(padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  child: Divider(
                    height: 0.5,
                    color: Color(0xffd9d9d9),
                  ),
                ),
                ImItem(title: '我的文件', imagePath: 'images/1.png',),
                Padding(padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  child: Divider(
                    height: 0.5,
                    color: Color(0xffd9d9d9),
                  ),
                ),
                ImItem(title: '联系客服', imagePath: 'images/1.png',),
                Padding(padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  child: Divider(
                    height: 0.5,
                    color: Color(0xffd9d9d9),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20.0),
            color: Colors.white,
            child: ImItem(title: '清理缓存',imagePath: 'images/1.png',),
          ),
        ],
      ),
    );
  }
}