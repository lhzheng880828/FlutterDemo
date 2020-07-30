import 'package:flutter/material.dart';
import 'package:flutter_app/im/contacts.dart';
import 'package:flutter_app/im/message_page.dart';
import 'package:flutter_app/im/personal.dart';

class im_main_ui extends StatefulWidget {

   @override
  State<StatefulWidget> createState() {
    return AppState();
  }

}

class AppState extends State<im_main_ui> {

  var _currentIndex = 0;

  //聊天页面

  //好友页面

  //个人页面

  //根据当前索引返回不同的页面
  currentPage(){
    switch(_currentIndex){

      case 0:
        return MessagePage();
      case 1:
        return ContactsPage();
      case 2:
        return Personal();

      default:
        break;
    }
  }

  //渲染某个菜单项,传入菜单标题,图片路径或图标
  _popupMenuItem(String title, {String imagePath, IconData icon}){
    return PopupMenuItem(
        child: Row(
          children: <Widget>[
            imagePath != null? Image.asset(imagePath, width: 32.0, height: 32.0,)
                : SizedBox(
              width: 32.0,
              height: 32.0,
              child: Icon(icon, color: Colors.white,),
            ),
            Container(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                title,
                style: TextStyle(
                  color: Colors.white
                ),
              ),
            ),
          ],
        ),

    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('即时通讯'),
        actions: <Widget>[
          GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, 'search');
            },
            child: Icon(Icons.search),
          ),
          Padding(
              padding: const EdgeInsets.only(left: 30.0, right: 30.0),
            child: GestureDetector(
              onTap: (){
                showMenu(
                    context: context,
                    position: RelativeRect.fromLTRB(500.0, 76.0, 10.0, 0.0),
                    items: <PopupMenuEntry>[
                      _popupMenuItem('发起会话', imagePath: 'images/1.png'),
                      _popupMenuItem('添加好友', imagePath: 'images/1.png'),
                      _popupMenuItem('联系客服', imagePath: 'images/1.png'),
                    ],
                );
              },
              child: Icon(Icons.add),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: ((index){
          setState(() {
            _currentIndex = index;
          });
        }),
        items: [
          BottomNavigationBarItem(
            icon: _currentIndex == 0
              ? Image.asset('images/1.png', width: 32.0, height: 28.0,)
              : Image.asset('images/2.png', width: 32.0, height: 28.0,),
            title: Text('聊天',style: TextStyle(color: _currentIndex==0?Color(0xff46c01b): Color(0xff999999)),),
          ),
          BottomNavigationBarItem(
            icon: _currentIndex == 1
                ? Image.asset('images/1.png', width: 32.0, height: 28.0,)
                : Image.asset('images/2.png', width: 32.0, height: 28.0,),
            title: Text('好友',style: TextStyle(color: _currentIndex==1?Color(0xff46c01b): Color(0xff999999)),),
          ),
          BottomNavigationBarItem(
            icon: _currentIndex == 2
                ? Image.asset('images/1.png', width: 32.0, height: 28.0,)
                : Image.asset('images/2.png', width: 32.0, height: 28.0,),
            title: Text('我的',style: TextStyle(color: _currentIndex==2?Color(0xff46c01b): Color(0xff999999)),),
          ),
        ],
      ),
      body: currentPage(),
    );
  }
}