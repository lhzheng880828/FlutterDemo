import 'package:flutter/material.dart';
import 'package:flutter_app/im/LoadingPage.dart';
import 'package:flutter_app/im/im_main_ui.dart';
import 'package:flutter_app/im/search_page.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class ImApp extends StatelessWidget {

  final ThemeData mDefaultTheme = ThemeData(
    primaryColor: Colors.green,
    scaffoldBackgroundColor: Color(0xffebebeb),
    cardColor: Colors.green
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '聊天室',
      theme: mDefaultTheme,
      routes: <String, WidgetBuilder>{
        "app": (BuildContext context) => im_main_ui(),
        "/friends":(_) => new WebviewScaffold(
          url: "https://flutter.io/",
          appBar: AppBar(title: Text('Flutter官网'),),
          withZoom: true,
          withLocalStorage: true,
        ),
        "search": (BuildContext context)=> SearchPage(),
      },
      home: LoadingPage(),

    );
  }
}