import 'dart:io';

// Stream 是 async 包里的类
import 'dart:async';
// utf8、LineSplitter 属于 convert 包
import 'dart:convert';

import 'package:http/http.dart' as http;

//异步操作
void foo() async {
  const filepath = "path to your file";
  var file = File(filepath);
  try {
    bool exists = await file.exists();
    if (!exists) {
      await file.create();
    }
  } catch (e) {
    print(e);
  }
}

//同步操作
void fooSync() {
  const filepath = "path to your file";
  var file = File(filepath);
  try {
    bool exists = file.existsSync();
    if (!exists) {
      file.createSync();
    }
  } catch (e) {
    print(e);
  }
}

//test file io

/*void testStringWrite(){
  const filepath = "/sdcard/test.txt";
  var file = File(filepath);
  await file.writeAsString('Hello, Dart IO');
  List<int> toBeWritten = [1, 2, 3];
  await file.writeAsBytes(toBeWritten);

}*/

void fooWriteFile() async {
  const filepath = "/home/linhu/test.txt";
  var file = File(filepath);
  IOSink sink;
  try {
    sink = file.openWrite();
    // 默认的写文件操作会覆盖原有内容；如果要追究内容，用 append 模式
    // sink = file.openWrite(mode: FileMode.append);

    // write() 的参数是一个 Object，他会执行 obj.toString() 把转换后
    // 的 String 写入文件
    sink.write('Hello, Dart');
    //调用 flush 后才会真的把数据写出去
    await sink.flush();
  } catch (e) {
    print(e);
  } finally {
    sink?.close();
  }
}

void fooReadFile() async {
  const filepath = "/home/linhu/test.txt";
  var file = File(filepath);
  try {
    Stream<List<int>> stream = file.openRead();
    var lines = stream
    // 把内容用 utf-8 解码
        .transform(utf8.decoder)
    // 每次返回一行
        .transform(LineSplitter());
    await for (var line in lines) {
      print(line);
    }
  } catch (e) {
    print(e);
  }
}

class Point {
  int x;
  int y;
  String description;

  Point(this.x, this.y, this.description);

  // 为了方便后面演示，也加入一个 toString
  @override
  String toString() {
    return "Point{x=$x, y=$y, desc=$description}";
  }

  // 注意，我们的方法只有一个语句，这个语句定义了一个 map。
  // 使用这种语法的时候，Dart 会自动把这个 map 当做方法的返回值
  Map<String, dynamic> toJson() => {
    'x': x,
    'y': y,
    'desc': description
  };

  Point.fromJson(Map<String, dynamic> map)
      : x = map['x'], y = map['y'], description = map['desc'];
}

void main_test() {
  var point = Point(2, 12, 'Some point');
  var pointJson = json.encode(point);
  print('pointJson = $pointJson');

  // List, Map 都是支持的
  var points = [point, point];
  var pointsJson = json.encode(points);
  print('pointsJson = $pointsJson');

  print('');

  var decoded = json.decode(pointJson);
  print('decoded.runtimeType = ${decoded.runtimeType}');
  var point2 = Point.fromJson(decoded);
  print('point2 = $point2');

  decoded = json.decode(pointsJson);
  print('decoded.runtimeType = ${decoded.runtimeType}');
  var points2 = <Point>[];
  for (var map in decoded) {
    points2.add(Point.fromJson(map));
  }
  print('points2 = $points2');

  fooWriteFile();
  fooReadFile();

}

Future<String> getMessage() async {
  try {
    final response = await http.get('http://www.xxx.com/yyy/zzz');
    if (response.statusCode == 200) {
      return response.body;
    }
  } catch (e) {
    print('getMessage: $e');
  }
  return null;
}

// 执行后打印出：
/*
pointJson = {"x":2,"y":12,"desc":"Some point"}
pointsJson = [{"x":2,"y":12,"desc":"Some point"},{"x":2,"y":12,"desc":"Some point"}]

decoded.runtimeType = _InternalLinkedHashMap<String, dynamic>
point2 = Point{x=2, y=12, desc=Some point}
decoded.runtimeType = List<dynamic>
points2 = [Point{x=2, y=12, desc=Some point}, Point{x=2, y=12, desc=Some point}]
Hello, Dart
*/
