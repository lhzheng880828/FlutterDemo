import 'package:flutter/material.dart';

//凸起按钮
class RaiseBtnApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    return new MaterialApp(
      title: 'RaisedButton示例',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('RaiseButton组件示例'),
        ),
        body: new Center(
          child: new RaisedButton(
              onPressed: (){
                //按下时间
              },
          child: new Text('RaisedButton组件'),
          ),
        ),
      ),
    );
  }
}

//列表组件

//1. 基础列表组件,垂直列表
class BaseListView extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    final title = '基础列表示例';

    return MaterialApp(
      title: title,
      home: new Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: new ListView(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.alarm),
              title: Text('Alarm'),
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text('Phone'),
            ),
            ListTile(
              leading: Icon(Icons.airplay),
              title: Text('Airplay'),
            ),
            ListTile(
              leading: Icon(Icons.alarm),
              title: Text('Alarm'),
            ),
            ListTile(
              leading: Icon(Icons.airplay),
              title: Text('Airplay'),
            ),
            ListTile(
              leading: Icon(Icons.airplay),
              title: Text('Airplay'),
            ),
            ListTile(
              leading: Icon(Icons.alarm),
              title: Text('Alarm'),
            ),
          ],
        ),
      ),
    );
  }
}

//2. 基础列表组件,水平列表

class HorizontalList extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    final title = "水平列表示例";
    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Container(
          margin: EdgeInsets.symmetric(vertical: 20.0),
          height: 200.0,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              Container(
                width: 160.0,
                color: Colors.lightBlue,
              ),
              Container(
                width: 160.0,
                color: Colors.green,
              ),
              Container(
                width: 160.0,
                color: Colors.grey,
                child: Column(
                  children: <Widget>[
                    Text(
                        '水平',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 36.0,
                    ),
                    ),
                    Text(
                        '列表',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 36.0,
                    ),
                    ),
                    Text('列表',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40.0,
                    ),
                    ),
                    Icon(Icons.list),
                  ],
                ),
              ),
              Container(
                width: 160.0,
                color: Colors.deepOrange,
              ),
              Container(
                width: 160.0,
                color: Colors.deepPurpleAccent,
              ),
              Container(
                width: 160.0,
                color: Colors.black,
              ),

            ],
          ),
        ),
      ),
    );
  }
}

//3. 长列表组件

class LongList extends StatelessWidget{

  final List<String> items;

  @override
  Widget build(BuildContext context) {
    final title = '长列表示例';

    return MaterialApp(
      title: title,
      home: new Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body:ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index){

              return new ListTile(
                leading: new Icon(Icons.phone),
                title: Text('${items[index]}'),
              );
        })
      ),
    );
  }

  LongList({Key key, @required this.items}):super(key: key);
}

//4. 网格示例
class GridList extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    final title = "网格列表示例";

    return MaterialApp(
      title: title,
      home: new Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: new GridView.count(
          crossAxisCount: 3,
          primary: false,
          childAspectRatio: 5,//单元格宽高比例
          mainAxisSpacing: 20.0,//垂直方向space宽度
          padding: EdgeInsets.all(10.0),
          crossAxisSpacing: 20.0,//水平方向space宽度
          children: <Widget>[
            const Text('第一行第一列'),
            const Text('第一行第二列'),
            const Text('第一行第三列'),
            const Text('第二行第一列'),
            const Text('第二行第二列'),
            const Text('第二行第三列'),
            const Text('第三行第一列'),
            const Text('第三行第二列'),
            const Text('第三行第三列'),
          ],
        ),
      ),
    );
  }
}

class LoginWidget extends StatefulWidget{

  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginWidget>{
  //全局Key用来获取Form表单组件
  GlobalKey<FormState> loginKey = new GlobalKey<FormState>();

  String userName;
  String password;
  void login(){

  }
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Form表单示例',
      home: new Scaffold(
        appBar: AppBar(
          title: Text('Form表单示例'),
        ),
        body: new Column(
          children: <Widget>[
            new Container(
              padding: const EdgeInsets.all(16.0),
              child: new Form(child: new Column(
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: '请输入用户名',
                    ),
                    onSaved: (value){
                      userName = value;
                    },
                    onFieldSubmitted: (value){

                    },
                  ),
                  new TextFormField(
                    decoration: new InputDecoration(
                      labelText: '请输入密码',
                    ),
                    obscureText: true,
                    validator: (value){
                      return value.length<6? "密码长度不够6位": null;
                    },
                    onSaved: (value){
                      password = value;
                    },
                  ),
                  new SizedBox(
                    width: 340.0,
                      height: 42.0,
                    child: new RaisedButton(onPressed: login,
                    child: Text('登录',
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                    ),
                    ),
                  )
                ],
              ),
              key: loginKey,

              ),
            )
          ],
        ),
      ),
    );
  }
}