import 'package:flutter/material.dart';

class ContainerLayoutDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var container = Container(
      decoration: BoxDecoration(
        color: Colors.orange
      ),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(child: Container(
                width: 150.0,
                height: 150.0,
                decoration: BoxDecoration(
                  border: Border.all(width: 10.0, color: Colors.blueGrey),
                  borderRadius: const BorderRadius.all(const Radius.circular(8.0)),
                ),
                margin: const EdgeInsets.all(4.0),
                child: Image.asset('images/1.png'),
              )),
              Expanded(child: Container(
                width: 150.0,
                height: 150.0,
                decoration: BoxDecoration(
                  border: Border.all(width: 10.0, color: Colors.blueGrey),
                  borderRadius: const BorderRadius.all(const Radius.circular(8.0)),
                ),
                margin: const EdgeInsets.all(4.0),
                child: Image.asset('images/2.png'),
              )),
            ],
          ),

          Row(
            children: <Widget>[
              Expanded(child: Container(
                width: 150.0,
                height: 150.0,
                decoration: BoxDecoration(
                  border: Border.all(width: 10.0, color: Colors.blueGrey),
                  borderRadius: const BorderRadius.all(const Radius.circular(8.0)),
                ),
                margin: const EdgeInsets.all(4.0),
                child: Image.asset('images/3.png'),
              )),
              Expanded(child: Container(
                width: 150.0,
                height: 150.0,
                decoration: BoxDecoration(
                  border: Border.all(width: 10.0, color: Colors.blueGrey),
                  borderRadius: const BorderRadius.all(const Radius.circular(8.0)),
                ),
                margin: const EdgeInsets.all(4.0),
                child: Image.asset('images/4.png'),
              )),
            ],
          ),
        ],
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Container布局示例代码'),
      ),
      body: container,
    );
  }
}

class CenterLayoutDemo extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Center居中布局示例代码'),
      ),
      body: Center(
        child: Text('Hello flutter', style: TextStyle(fontSize: 36.0),),
      ),
    );
  }
}

class PaddingLayoutDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Padding布局示例代码'),
      ),
      body: Center(
        child: Container(
          width: 300.0,
          height: 300.0,
          padding: EdgeInsets.all(60.0),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.green,
              width: 8.0,
            ),
          ),
          child: Container(
            width: 200.0,
            height: 200.0,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Colors.blue,
                width: 8.0,
              ),
            ),
            child: FlutterLogo(),
          ),
        ),
      ),
    );
  }
}

class AlignLayoutDemo extends StatelessWidget {

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Align布局示例代码'),
      ),

      body: Stack(
        children: <Widget>[
          //左上角
          Align(
            alignment: FractionalOffset(0.0, 0.0),
            child: Image.asset('images/1.png', width: 128.0, height: 128.0,),
          ),
          //右上角
          Align(
            alignment: FractionalOffset(1.0, 0.0),
            child: Image.asset('images/2.png', width: 128.0, height: 128.0,),
          ),
          //居中
          Align(
            alignment: FractionalOffset.center,
            child: Image.asset('images/1.png', width: 128.0, height: 128.0,),
          ),
          //左下角
          Align(
            alignment: FractionalOffset.bottomLeft,
            child: Image.asset('images/1.png', width: 128.0, height: 128.0,),
          ),
          //右下角
          Align(
            alignment: FractionalOffset.bottomRight,
            child: Image.asset('images/1.png', width: 128.0, height: 128.0,),
          ),
        ],
      ),
    );
  }
}

class RowLayoutDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('水平布局示例'),
      ),
      body: Row(
        children: <Widget>[
          Expanded(child: Text('左侧文本', textAlign: TextAlign.center,)),
          Expanded(child: Text('中间文本', textAlign: TextAlign.center,)),
          Expanded(child: FittedBox(
            fit: BoxFit.contain,
            child: const FlutterLogo(),
          )),

        ],
      ),
    );
  }
}

class ColumnLayoutDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('垂直布局示例'),
      ),
      body: Column(
        children: <Widget>[
          Text('Flutter'),
          Text('垂直布局'),
          Expanded(child: FittedBox(
            fit: BoxFit.contain,
            child: const FlutterLogo(),
          )),
        ],
      ),
    );
  }
}

class ColumnLayoutDemo2 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('垂直布局示例'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start, //水平方向靠左对齐
        mainAxisSize: MainAxisSize.min, //主轴方向最小化处理
        children: <Widget>[
          Text('Flutter是Google移动UI框架'),
          Text('可以快速在IOS及Android上构建高质量的原生用户界面'),
          Text('Flutter可以和现有的代码一起工作, 在全世界'),
          Text('Flutter正在被越来越多的开发者和组织使用'),
          Text('并且Flutter是开源及免费的'),
          Text('Fluter!', style: TextStyle(fontSize: 36.0),),
        ],
      ),
    );
  }
}

class FittedBoxDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('FittedBox缩放布局示例'),
      ),
      body: Container(
        color: Colors.grey,
        width: 250.0,
        height: 250.0,
        child: FittedBox(
          //fit: BoxFit.contain,
          //fit: BoxFit.cover,
          //fit: BoxFit.fitHeight,
          //fit: BoxFit.fitWidth,
          fit: BoxFit.scaleDown,
          alignment: Alignment.topLeft,
          child: Container(
            color: Colors.deepOrange,
            child: Text('缩放布局'),
          ),
        ),
      ),
    );
  }
}

class StackAlignmentLayoutDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var stack = new Stack(
      //子组件左上角对齐
      alignment: Alignment.topLeft,
      children: <Widget>[
        CircleAvatar(
          backgroundImage: AssetImage('images/1.png'),
          radius: 100.0,
        ),
        Container(
          decoration: BoxDecoration(color: Colors.black38),
          child: Text('我是超级飞侠', style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold, color: Colors.white),),
        ),
      ],
    );
    return Scaffold(
      appBar: AppBar(title: Text('Stack层叠布局示例'),),
      body: Center(
        child: stack,
      ),
    );
  }
}

class StackPositionedDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title: Text('Stack层叠布局示例'),),
      body: Center(
        child: Stack(
          children: <Widget>[
            new Image.asset('images/1.png', width: 300, height: 300,),
            new Positioned(bottom:50.0, right: 50.0, child:Text('hi, flutter', style: TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold, fontFamily: 'serif', color: Colors.black),))
          ],
        ),
      ),
    );
  }
}

class IndexedStackLayoutDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
   var stack = IndexedStack(
     //index: 1,
     index: 0,
     alignment: const FractionalOffset(0.2, 0.2),
     children: <Widget>[
       CircleAvatar(
         backgroundImage: new AssetImage('images/1.png'),
         radius: 100.0,
       ),
       Container(
         decoration: BoxDecoration(
           color: Colors.black38,
         ),
         child: Text('我是超级飞侠', style: TextStyle(fontSize: 22.0, color: Colors.black, fontWeight: FontWeight.bold),),
       ),
     ],
   );
   return Scaffold(
     appBar: AppBar(title: Text('IndexedStack层叠布局示例'),),
     body: Center(
       child: stack,
     ),
   );
  }
}

class OverflowBoxLayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title: Text('OverflowBox溢出父容器显示示例'),),
      body: Container(
        color: Colors.green,
        width: 200.0,
        height: 200.0,
        padding: const EdgeInsets.all(5.0),
        child: OverflowBox(
          alignment: Alignment.topLeft,
          maxWidth: 300.0,
          maxHeight: 500.0,
          child: Container(
            color: Colors.blueGrey,
            width: 400.0,
            height: 400.0,
          ),
        ),
      ),
    );
  }
}

class SizedBoxLayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text('SizedBox设置具体尺寸示例'),),
      body: SizedBox(
        width: 200.0,
        height: 300.0,
        child: const Card(
          child: Text('SizedBox', style: TextStyle(fontSize: 36.0),),
        ),
      ),
    );
  }
}

class ConstrainedBoxDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text('ConstrainedBox限定宽高示例'),),
      body: ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: 150.0,
            minHeight: 150.0,
            maxWidth: 220.0,
            maxHeight: 220.0
          ),
        child: Container(
          width: 300.0,
          height: 300.0,
          color: Colors.green,
        ),
      ),
    );
  }
}

class LimitedBoxLayoutDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text('LimitedBox限定宽高示例'),),
      body: Row(
        children: <Widget>[
          Container(
            color: Colors.grey,
            width: 100.0,
          ),
          LimitedBox(
            maxWidth: 150.0,
            child: Container(
              color: Colors.lightGreen,
              width: 250.0,
            ),
          ),
        ],
      ),
    );
  }
}

class AspectRatioDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text('AspectRatio调整宽高比示例'),),
      body: Container(
        height: 200.0,
        child: AspectRatio(
            aspectRatio: 2,
          child: Container(
            color: Colors.green,
          ),
        ),
      ),
    );
  }
}

class FractionallySizedBoxDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text('FractionallySizedBoxDemo百分比示例'),),
      body: Container(
        color: Colors.blueGrey,
        height: 200.0,
        width: 200.0,
        child: FractionallySizedBox(
          alignment: Alignment.topLeft,
          widthFactor: 0.5,
          heightFactor: 1.5,
          child: Container(
            color: Colors.green,
          ),
        ),
      ),

    );
  }
}