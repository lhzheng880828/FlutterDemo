import 'package:flutter/material.dart';

import 'echo_client.dart';
import 'echo_server.dart';
import 'message.dart';
import 'flutter_widgets.dart';


HttpEchoServer _server;
HttpEchoClient _client;

//flutter入口，创建一个MyApp
void main() => runApp(MyApp());

/// 这个 widget 作用这个应用的顶层 widget.
///
/// 这个 widget 是无状态的，所以我们继承的是 [StatelessWidget].
/// 对应的，有状态的 widget 可以继承 [StatefulWidget]

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // 我们想使用 material 风格的应用，所以这里用 MaterialApp
    return MaterialApp(
      // 移动设备使用这个 title 来表示我们的应用。具体一点说，在 Android 设备里，我们点击
      // recent 按钮打开最近应用列表的时候，显示的就是这个 title。
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
        primaryColor: Colors.deepOrange,
        accentColor: Colors.orange[600],

      ),
      // 应用的“主页”
      //home: MyHomePage(title: 'Flutter Demo Home Page'),
      //home: MessageListScreen(),
      //home: ImageDemo(),//test for imageview
      //home:ContainerDemo(),//test for textView
      //home: RaiseBtnApp(),
      //home: new BaseListView(),
      //home: new HorizontalList(),
      //home: new LoginWidget(),
      home: new GridList(),
      //home: new LongList(items: new List.generate(500, (index) => 'Item$index')),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
  child: Column(
          // Column is also layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme
                  .of(context)
                  .textTheme
                  .display1,
            ),
            RollingButton(),//RollingButton
          ],
        ),


      /*  child:Container(
        width:200.0,
        height:200.0,
      decoration:BoxDecoration(
      color: Colors.white,
      border: new Border.all(
      color: Colors.grey,
      width: 8.0,
      ),
      borderRadius:
      const BorderRadius.all(const Radius.circular(9.0)),
      ),
      child: Text(
      'Flutterxxx',
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 28.0),
      )
    ),
*/

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }



}

class RollingButton extends StatefulWidget {
  // StatefulWidget 需要实现这个方法，返回一个 State
  @override
  State createState() {
    return _RollingState();
  }
}

// 可能看起来有点恶心，这里的泛型参数居然是 RollingButton
class _RollingState extends State<RollingButton> {

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text('Roll'),
      onPressed: _onPressed,
    );
  }
  void _onPressed() {
    debugPrint('_onPressed');
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            content: Text('AlertDialog'),
          );
        }
    );
  }

}

class MessageList extends StatefulWidget {

  MessageList({Key key}): super(key: key);

  @override
  State createState() {
    return _MessageListState();
  }
}

class _MessageListState extends State<MessageList> with WidgetsBindingObserver {
  final List<Message> messages = [];

  @override
  void initState() {
    super.initState();

    const port = 6060;
    _server = HttpEchoServer(port);
    // initState 不是一个 async 函数，这里我们不能直接 await _server.start(),
    // future.then(...) 跟 await 是等价的
    _server.start().then((_) {
      // 等服务器启动后才创建客户端
      _client = HttpEchoClient(port);
      _client.getHistory().then((list) {
        setState(() {
          messages.addAll(list);
        });
      });
      WidgetsBinding.instance.addObserver(this);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: messages.length,
        itemBuilder: (context, index) {
          final msg = messages[index];
          final subtitle = DateTime.fromMillisecondsSinceEpoch(msg.timestamp)
              .toLocal().toIso8601String();
          return ListTile(
            title: Text(msg.msg),
            subtitle: Text(subtitle),
          );
        }
    );
  }

  void addMessage(Message msg) {
    setState(() {
      messages.add(msg);
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      var server = _server;
      _server = null;
      server?.close();
    }
  }
}


class MessageListScreen extends StatelessWidget {

  final messageListKey = GlobalKey<_MessageListState>(debugLabel: 'messageListKey');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Echo client'),
        ),
        body: MessageList(key: messageListKey),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            // push 一个新的 route 到 Navigator 管理的栈中，以此来打开一个页面
            // Navigator.push 会返回一个 Future<T>，如果你对这里使用的 await
            // 不太熟悉，可以参考
            // https://www.dartlang.org/guides/language/language-tour#asynchrony-support
            final result = await Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => AddMessageScreen())
            );
            if (_client == null) return;
            // 现在，我们不是直接构造一个 Message，而是通过 _client 把消息
            // 发送给服务器
            var msg = await _client.send(result);
            if (msg != null) {
              messageListKey.currentState.addMessage(msg);
            } else {
              debugPrint('fail to send $result');
            }
          },
          tooltip: 'Add message',
          child: Icon(Icons.add),
        )
    );
  }
}


class MessageForm extends StatefulWidget {

  @override
  State createState() {
    return _MessageFormState();
  }

}

class _MessageFormState extends State<MessageForm> {
  final editController = TextEditingController();

  // 对象被从 widget 树里永久移除的时候调用 dispose 方法（可以理解为对象要销毁了）
  // 这里我们需要主动再调用 editController.dispose() 以释放资源
  @override
  void dispose() {
    super.dispose();
    editController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      // 我们让输入框占满一行里除按钮外的所有空间
      padding: EdgeInsets.all(16.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              margin: EdgeInsets.only(right: 8.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Input message',
                  contentPadding: EdgeInsets.all(0.0),
                ),
                style: TextStyle(
                    fontSize: 22.0,
                    color: Colors.black54
                ),
                // 获取文本的关键，这里要设置一个 controller
                controller: editController,
                autofocus: true,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              debugPrint('send: ${editController.text}');
              Navigator.pop(context, editController.text);
            },
            onDoubleTap: () => debugPrint('double tapped'),
            onLongPress: () => debugPrint('long pressed'),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
              decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(5.0)
              ),
              child: Text('Send'),
            ),
          )
        ],
      ),
    );
  }
}


class AddMessageScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add message'),
      ),
      body: MessageForm(),
    );
  }

}

class ImageDemo extends StatelessWidget{


  @override
  Widget build(BuildContext context) {

    return new Center(child: new Image.network('https://cdn.jsdelivr.net/gh/flutterchina/website@1.0/images/intellij/hot-reload.gif',
    fit: BoxFit.fitWidth,
    ));
  }
}

class ContainerDemo extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('文本组件'),
      ),
      body: new Column(
        children: <Widget>[
          new Text('红色+黑色删除线+25号字体',
          style: new TextStyle(
              color: const Color(0xfff000),
          decoration: TextDecoration.lineThrough,
          decorationColor: const Color(0xff000000),
          fontSize: 25.0,
          ),
          ),
          new Text('橙色+下划线+24号字体',
            style: new TextStyle(
              color: const Color(0xffff9900),
              decoration: TextDecoration.underline,
              fontSize: 24.0,
            ),
          ),
          new Text('虚线上划线+23号+斜体',
            style: new TextStyle(
              color: const Color(0xffff9900),
              decoration: TextDecoration.overline,
              decorationStyle: TextDecorationStyle.dashed,
              fontSize: 23.0,
              fontStyle: FontStyle.italic,
            ),
          ),
          new Text('24号+加粗',
            style: new TextStyle(
              color: const Color(0xffff9900),
              fontWeight: FontWeight.bold,
              fontSize: 23.0,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    );
  }
}

class LayoutDemo extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    return Scaffold(appBar: new AppBar(
      title: new Text('图标组件示例'),
    ),
    body: new Icon(Icons.phone,
    color: Colors.green[500],
        size: 80.0,),
    );
  }
}
