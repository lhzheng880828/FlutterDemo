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


class RouteWidget extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'MaterialApp示例',
      home: NavHomePage(),
      routes: {
        '/first': (BuildContext context) =>FirstPage(),
        '/second': (BuildContext context) =>SecondPage(),
      },
      initialRoute: '/first',//初始路由为first页面
    );
  }
}

class NavHomePage extends StatefulWidget{


  @override
  State createState() {

    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<NavHomePage>{


  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: AppBar(
        title: Text('MaterialApp示例'),
      ),
      body: Center(
        child: Text(
            '主页',
        style: TextStyle(fontSize: 28.0),),
      ),
    );
  }
}

class FirstPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('这是第一页'),
      ),
      body: Center(
        child: RaisedButton(onPressed: (){
          Navigator.pushNamed(context, '/second');
            },
          child: Text('这是第一页',
          style: TextStyle(fontSize: 28.0),),
            ),

      ),
    );
  }
}

class SecondPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('这是第二页'),
      ),
      body: Center(
        child: RaisedButton(onPressed: (){
          Navigator.pushNamed(context, '/first');
        },
          child: Text('这是第二页',
            style: TextStyle(fontSize: 28.0),),
        ),

      ),
    );
  }
}


class AppBarLayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('AppBar应用按钮示例代码'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), tooltip: '搜索', onPressed: (){}),
          IconButton(icon: Icon(Icons.add), tooltip: '添加', onPressed: (){}),

        ],
      ),
    );
  }
}


class BottomNavBarDemo extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _BottomNavBarState();
  }

  BottomNavBarDemo({Key key}):super(key: key);

}

class _BottomNavBarState extends State<BottomNavBarDemo>{

  int _selectedIndex = 1; //当前选中项索引

  final _widgetOptions = [
    Text('Index 0: 信息'),
    Text('Index 1: 通讯录'),
    Text('Index 2:发现'),
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('BottomNavigationBar示例代码'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex), //居中显示选中文本
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.chat), title: Text('信息')),
            BottomNavigationBarItem(icon: Icon(Icons.contacts), title: Text('通讯录')),
            BottomNavigationBarItem(icon: Icon(Icons.account_circle), title: Text('发现')),
          ],
        currentIndex: _selectedIndex,
        fixedColor: Colors.deepPurple,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }
}


class TabBarDemo extends StatelessWidget {

   final List<ItemView> itemList = <ItemView>[
     ItemView('自驾', Icons.directions_car),
     ItemView('自行车', Icons.directions_bike),
     ItemView('轮船', Icons.directions_boat),
     ItemView('公交车', Icons.directions_bus),
     ItemView('火车', Icons.directions_railway),
     ItemView('步行', Icons.directions_walk),
   ];

  final List<Tab> myTabs = <Tab>[
    Tab(text: '选项卡一',),
    Tab(text: '选项卡二',),
    Tab(text: '选项卡三',),

  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: DefaultTabController(
          length: itemList.length,
          child: Scaffold(
            appBar: AppBar(
              bottom: TabBar(
                isScrollable: true,
                  tabs: itemList.map((e) => new Tab(text: e.title,icon: new Icon(e.icon),)).toList(),
              ),
              ),
                body  : TabBarView(
                  children: itemList.map((e) => Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SelectedView(item: e,),
                  )
                  ).toList(),),
            ),

          ),
      );
  }
}

class ItemView {
  var title;
  var icon;

  ItemView(this.title, this.icon);
}

class SelectedView extends StatelessWidget {
  const SelectedView({Key key, this.item}): super(key: key);
  final ItemView item;
  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.display1;
    return new Card(
      color: Colors.white,
      child: new Center(
        child: new Column(
          mainAxisSize: MainAxisSize.min, //垂直方向最小化处理
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Icon(item.icon, size: 128.0,color: textStyle.color,),
            new Text(item.title, style: textStyle,),
          ],
        ),
      ),
    );
  }
}

class DrawerLayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Drawer抽屉组件示例'),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
                accountName: Text('玄微子'),
                accountEmail: Text('xuanweizi@163.com'),
              currentAccountPicture: CircleAvatar(backgroundImage: AssetImage("images/1.png"),
              ),
              onDetailsPressed: (){},
              otherAccountsPictures: <Widget>[
                Container(
                  child: Image.asset("images/code.png"),
                )
              ],
            ),

            ListTile(
              leading: CircleAvatar(child: Icon(Icons.color_lens),),
              title: Text('个性装扮'),
            ),
            ListTile(
              leading: CircleAvatar(child: Icon(Icons.photo),),
              title: Text('我的相册'),
            ),
            ListTile(
              leading: CircleAvatar(child: Icon(Icons.wifi),),
              title: Text('免流量特权'),
            ),

          ],
        ),
      ),
    );
  }
}

class FloatingButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return MaterialApp(
     title: 'FloatingActionButtion示例',
     home: Scaffold(
       appBar: AppBar(
         title: Text('FloatingActionButton 示例'),
       ),
       body: Center(
         child: Text(
           'FloatingActionButton示例',
           style: TextStyle(fontSize: 28.0),
         ),
       ),
       floatingActionButton: new Builder(builder: (BuildContext context){
         return FloatingActionButton(child: const Icon(Icons.add),
             tooltip: '请点击FloatingActionButton',
             foregroundColor: Colors.white,
             backgroundColor: Colors.blue,
             //未点击阴影值
             elevation: 7.0,
             //点击阴影值
             highlightElevation: 14.0,
             onPressed: (){
           Scaffold.of(context).showSnackBar(new SnackBar(content: new Text('你点击了FloatingActionButton')));
             },
           mini: false,
           shape: new CircleBorder(),
           isExtended: false,

         );
       },

       ),
       floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
     ),
   );
  }
}

class PopMenuDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PopMenuButton组件示例',
      home: Scaffold(
        appBar: AppBar(
          title: Text('PopMenuButton组件示例'),
        ),
        body: Center(
          child: FlatButton(onPressed: (){}, child: PopupMenuButton(itemBuilder: (BuildContext context) =>
          <PopupMenuEntry<ConferenceItem>>[
            const PopupMenuItem<ConferenceItem>(value:ConferenceItem.Addmember ,child: Text('添加成员')),
            const PopupMenuItem<ConferenceItem>(value:ConferenceItem.LockConference ,child: Text('锁定会议')),
            const PopupMenuItem<ConferenceItem>(value:ConferenceItem.ModifyLayout ,child: Text('修改布局')),
            const PopupMenuItem<ConferenceItem>(value:ConferenceItem.TurnoffAll ,child: Text('挂断所有')),

          ]
          )),
        ),
      ),
    );
  }
}

enum ConferenceItem {
  Addmember,
  LockConference,
  ModifyLayout,
  TurnoffAll
}

class SimpleDialogDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SimpleDialog示例',
      home: Scaffold(
        appBar: AppBar(
          title: Text('SimpleDialog组件示例'),
        ),
        body: Center(
          child: SimpleDialog(title:const Text('对话框标题'),
          children: <Widget>[
            SimpleDialogOption(
              onPressed: (){},
              child: const Text('第一行信息'),
            ),

            SimpleDialogOption(
              onPressed: (){},
              child: const Text('第二行信息'),
            ),
          SimpleDialogOption(
          onPressed: (){},
      child: const Text('第三行信息'),
    )
          ],),
        ),
      ),
    );
  }
}

class AlertDialogDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AlertDialog组件示例',
      home: Scaffold(
        appBar: AppBar(
          title: Text('AlertDialog组件示例'),
        ),
        body: Center(
          child: AlertDialog(
            title: Text('提示'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text('是否要删除?'),
                  Text('一旦删除数据不可恢复!'),
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(onPressed: (){}, child: Text('确定')),
              FlatButton(onPressed: (){}, child: Text('取消')),
            ],
          ),
        ),
      ),
    );
  }
}

class TextFiledDemo extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    controller.addListener(() {
      print('你输入的内容为: ${controller.text}');
    });
    return new Scaffold(
      body: Center(
        child: Padding(
            padding: const EdgeInsets.all(20.0),
          child: TextField(
            controller: controller,
            maxLength: 30,
            maxLines: 1,
            autocorrect: true,
            autofocus: true,
            obscureText: false,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 26.0, color: Colors.green),
            onChanged: (text){
              print('内容更改时回调$text');
            },
            onSubmitted: (text){
              print('内容提交时回调$text');
            },
            enabled: true,
            decoration: InputDecoration(
              fillColor: Colors.grey.shade200,
              filled: true,
              helperText: '用户名',
              prefixIcon: Icon(Icons.person),
              suffixText: '用户名'
            ),
          ),

        ),
      ),
    );
  }
}

class CardViewDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
   var card = SizedBox(
     height: 250.0,
     child: Card(
       child: Column(
         children: <Widget>[
           ListTile(
             title: Text('深圳市南山区深南大道35号'
               , style: TextStyle(
                 fontWeight: FontWeight.w300
             ),
             ),
             subtitle: Text('创想科技有限公司'),
             leading: Icon(Icons.home, color: Colors.lightBlue,),
           ),
           Divider(),
           ListTile(
             title: Text('深圳市罗湖区沿海大道32号'
               , style: TextStyle(
                   fontWeight: FontWeight.w300
               ),
             ),
             subtitle: Text('一本培训机构'),
             leading: Icon(Icons.school, color: Colors.lightBlue,),
           ),
           Divider(),
         ],
       ),
     ),
   );

   return Scaffold(
     appBar: AppBar(
       title: Text('Card布局示例'),
     ),
     body: Center(
       child: card,
     ),
   );
  }
}

class TableLayoutDemo extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Table表格布局示例代码'),
      ),

      body: Center(
        child: Table(
          columnWidths: const<int, TableColumnWidth>{
            0: FixedColumnWidth(100.0),
            1: FixedColumnWidth(40.0),
            2: FixedColumnWidth(80.0),
            3: FixedColumnWidth(80.0),
          },

          border: TableBorder.all(color: Colors.black38, width: 2.0, style: BorderStyle.solid),
          children: const<TableRow>[
            TableRow(
              children: <Widget>[
                Text('姓名'),
                Text('性别'),
                Text('年龄'),
                Text('身高'),
              ],
            ),
            TableRow(
              children: <Widget>[
                Text('张三'),
                Text('男'),
                Text('26'),
                Text('172'),
              ],
            ),
            TableRow(
              children: <Widget>[
                Text('李四'),
                Text('男'),
                Text('28'),
                Text('178'),
              ],
            ),
          ],
        ),
      ),
    );
  }

}

class TransformDemo extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Transform矩阵转换示例代码'),
      ),
      body: Center(
        child: Container(
          color: Colors.grey,
          child: Transform(transform: Matrix4.rotationZ(0.3), alignment: Alignment.topRight, child: Container(
            padding: const EdgeInsets.all(8.0),
            color: const Color(0xFFE8581C),
            child: const Text('Transform矩阵转换'),
          ),),
        ),
      ),
    );
  }
}


class BaselineDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('Baseline基准线布局示例代码'),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Baseline(
            baseline: 80.0,
            baselineType: TextBaseline.alphabetic,
            child: Text('AaBcCc', style: TextStyle(
              fontSize: 18.0,
              textBaseline: TextBaseline.alphabetic
            ),),
          ),


          Baseline(
            baseline: 80.0,
            baselineType: TextBaseline.alphabetic,
            child:Container(
              width: 40.0,
              height: 40.0,
              color: Colors.greenAccent,
            ),
          ),


          Baseline(
            baseline: 80.0,
            baselineType: TextBaseline.alphabetic,
            child: Text('DdEeFf', style: TextStyle(
                fontSize: 18.0,
                textBaseline: TextBaseline.alphabetic
            ),),
          ),
        ],
      ),
    );
  }
}

class OffstageDemo extends StatefulWidget {

  final String title;

  OffstageDemo({Key key, this.title}):super(key:key);

  @override
  State<StatefulWidget> createState() {
    return _OffstageState();
  }
}


class _OffstageState extends State<OffstageDemo> {

  bool offstage = true;

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text(widget.title),
     ),

     body: Center(
       child: Offstage(offstage: offstage, child: Text('我出来啦', style: TextStyle(fontSize: 36.0),),),
     ),

     floatingActionButton: FloatingActionButton(onPressed: (){
       setState(() {
         offstage = !offstage;
       });
     },
     tooltip: '显示和隐藏',
     child: Icon(Icons.flip),),
   );
  }
}


class WrapLayoutDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wrap按宽高自动换行布局示例'),
      ),
      body: Wrap(
        spacing: 8.0,
        runSpacing: 4.0,
        children: <Widget>[
          Chip(
            label: Text('西门吹雪'),
            avatar: CircleAvatar(
              backgroundColor: Colors.lightGreen.shade800,
              child: Text('西门', style: TextStyle(fontSize: 10.0),),
            ),
          ),
          Chip(
            label: Text('司空摘星'),
            avatar: CircleAvatar(
              backgroundColor: Colors.lightGreen.shade800,
              child: Text('司空', style: TextStyle(fontSize: 10.0),),
            ),
          ),
          Chip(
            label: Text('木晚清'),
            avatar: CircleAvatar(
              backgroundColor: Colors.lightGreen.shade800,
              child: Text('西门', style: TextStyle(fontSize: 10.0),),
            ),
          ),
          Chip(
            label: Text('西门吹雪'),
            avatar: CircleAvatar(
              backgroundColor: Colors.lightGreen.shade800,
              child: Text('西门', style: TextStyle(fontSize: 10.0),),
            ),
          ),
        ],
      ),
    );
  }
}


class WudangDetailDemo extends StatelessWidget {


    @override
  Widget build(BuildContext context) {

      Widget addressContainer = Container(
        padding: const EdgeInsets.all(32.0),
        child: Row(
          children: <Widget>[
            Expanded(child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    '风景地址',
                    style: TextStyle(
                      fontWeight: FontWeight.bold
                    ),
                  ),

                ),
                Text(
                    '湖北十彦市丹江口',
                  style: TextStyle(color: Colors.grey[500]),
                ),
              ],
            )),
            Icon(
              Icons.star,
              color: Colors.red,
            ),
            Text('66'),
          ],
        ),
      );

      Column buildButtonColumn(IconData icon, String label){
        return Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(icon, color: Colors.lightGreen[600],),
            Container(
              margin: const EdgeInsets.only(top: 8.0),
              child: Text(label, style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w400, color: Colors.lightGreen[600]),),
            ),
          ],
        );
      }

      //按钮组部分
      Widget buttonsContainer = Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly, //水平方向均匀排列每个元素
          children: <Widget>[
            buildButtonColumn(Icons.call, '电话'),
            buildButtonColumn(Icons.near_me, '导航'),
            buildButtonColumn(Icons.share, '分享'),
          ],
        ),
      );

      //风景区介绍文本部分
      Widget textContainer = Container(
        padding: const EdgeInsets.all(32.0),
        //文本块一定是用'''来引用起来
        child: Text('''
       　武当山，又名太和山、仙室山。位于中国湖北省西北部丹江口市境内，背倚苍茫千里的神农架原始森林，
       面临碧波万顷的丹江水库，是联合国公布的世界文化遗产地，是中国国家重点风景名胜区、道教名山和武当拳发源地。
       武当山成为著名的仙山福地如同全国其他名山一样，有赖于其特殊的地理环境和自然优势。武当山的地理方位，
       东经110°56′15″-111°15′23″，北纬32°22′30″-32°35′06″。处于中国腹地。这里方圆八百里，高险幽深，飞雪荡雾，
       磅礴处势或飞龙走天际；灵秀处美似玉女下凡来，被誉为"亘古无双胜境，天下第一仙山"
        ''',
        softWrap: true,),
      );

      return Scaffold(
        appBar: AppBar(
          title: Text('武当山分景区', style: TextStyle(color: Colors.white),),),
        body: ListView(
          children: <Widget>[
            Image.asset('images/wudang.jpeg', width: 600.0, height: 240.0,fit: BoxFit.cover,),
            addressContainer,
            buttonsContainer,
            textContainer
          ],
        ),
      );
  }
}

class MyButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        final snackeBar = SnackBar(content: Text('你已按下'));
        Scaffold.of(context).showSnackBar(snackeBar);
      },

      child: Container(
        padding: EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: Theme.of(context).buttonColor,
           borderRadius: BorderRadius.circular(10.0),
        ),
        child: Text('测试按钮'),
      ),
    );
  }
}

class GestureDetectorDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('按下处理Demo'),
      ),
      body: Center(child: MyButton(),),
    );
  }
}

class DismissibleDemo extends StatelessWidget {

  //构建30条列表数据
  List<String> items = new List<String>.generate(30, (index) => "列表项${index+1}");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('滑动删除示例'),
      ),
      //构建列表
      body: ListView.builder(
          itemBuilder: (context, index){
            //提取被删除的项
            final item = items[index];
            //返回一个可以被删除的列表项
            return Dismissible(
              key: Key(item),
              child: ListTile(title: Text('$item'),),
              onDismissed: (direction){
                items.removeAt(index);
                Scaffold.of(context).showSnackBar(SnackBar(content: Text('$item被删除了')));
              },
            );
          }
      ),
    );
  }
}

class OpacityDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Opacity不透明示例'),
      ),
      body: Center(
        child: Opacity(
            opacity: 0.3,
            child: Container(
              width: 250.0,
              height: 100.0,
              decoration: BoxDecoration(
                color: Colors.black
              ),

              child: Text(
                '不透明度为0.3',
                    style: TextStyle(
                  color: Colors.white,
                      fontSize: 28.0,
              ),
              ),
        ),
        ),
      ),
    );
  }
}

class DecoratedBoxDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Opacity不透明示例'),
      ),

      body: Center(
        child: Container(
          width: 300.0,
          height: 300.0,
          decoration: BoxDecoration(
            color: Colors.grey,
            image: DecorationImage(
                image: ExactAssetImage('images/1.png'),
              fit: BoxFit.cover
            ),
            border: Border.all(color: Colors.grey, width: 4.0),
            borderRadius: BorderRadius.circular(36.0),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.black,
                blurRadius: 8.0,
                spreadRadius: 8.0,
                offset: Offset(-1.0, 1.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LinearGradientDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text('渐变色示例'),
     ),
     body: Center(
       child: DecoratedBox(
           decoration: BoxDecoration(
             gradient: LinearGradient(
                 colors: <Color>[
                   Colors.red,
                   Colors.green,
                   Colors.blue,
                   Colors.grey
                 ],
               begin: const FractionalOffset(0.1, 0.1),
               end: const FractionalOffset(1.0, 1.0),
             ),
           ),
         child: Container(
           width: 280.0,
           height: 280.0,
           child: Center(
             child: Text(
               'LinearGradient线性渐变效果',
               style: TextStyle(
               color: Colors.black,
                 fontSize: 28.0,
             ),
             ),
           ),
         ),
       ),
     ),
   );
  }
}

class RadialGradientDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('环形渐变色示例'),
      ),
      body: Center(
        child: DecoratedBox(
          decoration: BoxDecoration(
            gradient: RadialGradient(
              colors: <Color>[
                Colors.red,
                Colors.green,
                Colors.blue,
                Colors.grey
              ],
              center: const Alignment(-0.0, -0.0),
              radius: 0.5,
            ),
          ),
          child: Container(
            width: 280.0,
            height: 280.0,
            child: Center(
              child: Text(
                'RadialGradient渐变效果',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 28.0,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class RotatedBoxDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('RotatedBox旋转盒子示例'),),
      body: Center(
        child: RotatedBox(
          quarterTurns: 3,
          child: Text(
            'RotatedBox旋转盒子',
            style: TextStyle(
              fontSize: 38.0,
            ),
          ),
        ),
      ),
    );
  }
}

class ClipOvalDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ClipOvalDemo'),),
      body: Center(
        child: ClipOval(
          child: SizedBox(
            width: 200.0,
            height: 200.0,
            child: Image.asset('images/1.png', fit: BoxFit.fill,),
          ),
        ),
        /**/
      ),
    );
  }
}

class ClipRRectDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ClipRRectDemo'),),
      body: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
          child: SizedBox(
            width: 200.0,
            height: 200.0,
            child: Image.asset('images/wudang.jpeg', fit: BoxFit.fill,),
          ),
        ),
        /**/
      ),
    );
  }
}


class HeroFirstPage extends StatelessWidget {
  
    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('HeroAnimationDemoPage1'),),
      body: GestureDetector(
        child: Hero(
          tag: 'First Pic',
            child: Image.network('https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2817961048,4273609054&fm=26&gp=0.jpg'),
        ),
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (_){
            return HeroSecondPage();
          }));
        },
      ),
    );
  }
}

class HeroSecondPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('HeroAnimationDemoPage2'),),
      body: GestureDetector(
        child: Hero(
          tag: 'Second Pic',
          child: Image.network('https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=1157851848,3507953463&fm=26&gp=0.jpg'),
        ),
        onTap: (){
          Navigator.pop(context);
        },
      ),
    );
  }
}