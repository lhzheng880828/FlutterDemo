import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoActIndicatorDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('CupertionActIndicator示例'),
      ),
      body: Center(
        child: CupertinoActivityIndicator(
          radius: 60.0, //值越大加载的图形越大
        ),
      ),
    );

  }

}

class CupertinoAlertDialogDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CupertinoAlertDialogDemo 示例'),
      ),
      body: Center(
        child: CupertinoAlertDialog(
          title: Text('提示信息'),
          content: ListBody(
            children: <Widget>[
              Text('是否删除'),
              Text('一旦删除不可恢复数据!'),
            ],
          ),
          actions: <Widget>[
            CupertinoDialogAction(child: Text('确定'), onPressed: (){},),
            CupertinoDialogAction(child: Text('取消'), onPressed: (){},),
          ],
        ),
      ),
    );
  }
}

class CupertinoButtonDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text('CupertinoButtonDemo'),
     ),

     body: Center(
       child: CupertinoButton(child: Text('CupertinoButton'),
           onPressed: (){},
         color: Colors.blue,
           ),
     ),
   );
  }
}


class CupertinoNavDemo extends StatefulWidget {

   @override
  State<StatefulWidget> createState() {
    return _MyNavPageState();
  }

}

class _MyNavPageState extends State<CupertinoNavDemo>{

  @override
  Widget build(BuildContext context) {
   return CupertinoTabScaffold(
       tabBar: CupertinoTabBar(
           items: [
             BottomNavigationBarItem(icon: Icon(CupertinoIcons.home), title: Text('主页')),
             BottomNavigationBarItem(icon: Icon(CupertinoIcons.conversation_bubble), title: Text('聊天')),
           ],
         backgroundColor: CupertinoColors.lightBackgroundGray,
       ),
       tabBuilder: (context, index) {
         return CupertinoTabView(
           builder: (context){
             switch (index){
               case 0:
                 return HomePage();
                 break;
               case 1:
                 return ChatPage();
                 break;
               default:
                 break;
             }
           },
         );
       }
   );
  }
}


class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('主页'),
      ),
        child: Center(
          child: Text('主页', style: Theme.of(context).textTheme.button,),
        )
    );
  }
}

class ChatPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text('聊天面板'),
          trailing: Icon(CupertinoIcons.add),
          leading: Icon(CupertinoIcons.back),
        ),
        child: Center(
          child: Text('聊天面板', style: Theme.of(context).textTheme.button,),
        )
    );
  }
}