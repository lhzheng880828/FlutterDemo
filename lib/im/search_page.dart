
import 'package:flutter/material.dart';
import 'package:flutter_app/im/touch_callback.dart';

class SearchPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return SearchState();
  }
}

class SearchState extends State<SearchPage> {

  FocusNode focusNode = new FocusNode();

  _requestFocus(){
    FocusScope.of(context).requestFocus(focusNode);
    return focusNode;
  }

  _getText(String text){
    return TouchCallBack(
        child: Text(text, style: TextStyle(fontSize: 14.0, color: Color(0xff1aad19)),),
        onPressed: (){},
      isfeed: false,
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Stack(
              children: <Widget>[
                TouchCallBack(
                  child: Container(
                    height: 45.0,
                    margin: const EdgeInsets.only(left: 12.0, right: 12.0),
                    child: Icon(
                      Icons.chevron_left,
                      color: Colors.black,
                    ),
                  ),
                  onPressed: () => Navigator.pop(context),
                  isfeed: false,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  height: 45.0,
                  margin: const EdgeInsets.only(left: 50.0, right: 10.0),
                  decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(width: 1.0, color: Colors.green)
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                          child: TextField(
                            focusNode: _requestFocus(),
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.0,
                            ),
                            onChanged: (String text){

                            },
                            decoration: InputDecoration(
                              hintText: '搜索',
                              border: InputBorder.none,
                            ),
                          )
                      ),
                      Container(
                        margin: const EdgeInsets.only(right: 10.0),
                        child: Icon(Icons.mic, color: Color(0xffaaaaaa),),
                      ),
                    ],
                  ),
                ),



              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 50.0),
              child: Text('常用搜索', style: TextStyle(fontSize: 16.0, color: Color(0xffb5b5b5)),),
            ),

            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  _getText('朋友'),
                  _getText('聊天'),
                  _getText('群组'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:30.0, right: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  _getText('Flutter'),
                  _getText('Dart'),
                  _getText('C++'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}