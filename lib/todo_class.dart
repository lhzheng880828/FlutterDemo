import 'package:sqflite/sqflite.dart';

class Todo {
  static const columnId = 'id';
  static const columnTitle = 'title';
  static const columnContent = 'content';

  int id;
  String title;
  String content;

  Todo(this.title, this.content, [this.id]);

  Todo.fromMap(Map<String, dynamic> map)
      : id = map[columnId], title = map[columnTitle], content = map[columnContent];

  Map<String, dynamic> toMap() => {
    columnTitle: title,
    columnContent: content,
  };

  @override
  String toString() {
    return 'Todo{id=$id, title=$title, content=$content}';
  }
}

void foo() async {
  const table = 'Todo';
  // getDatabasesPath() 的 sqflite 提供的函数
  var path = await getDatabasesPath() + '/demo.db';
  // 使用 openDatabase 打开数据库
  var database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        var sql ='''
            CREATE TABLE $table ('
            ${Todo.columnId} INTEGER PRIMARY KEY,'
            ${Todo.columnTitle} TEXT,'
            ${Todo.columnContent} TEXT'
            )
            ''';
        // execute 方法可以执行任意的 SQL
        await db.execute(sql);
      }
  );
  // 为了让每次运行的结果都一样，先把数据清掉
  await database.delete(table);

  var todo1 = Todo('Flutter', 'Learn Flutter widgets.');
  var todo2 = Todo('Flutter', 'Learn how to to IO in Flutter.');

  // 插入数据
  await database.insert(table, todo1.toMap());
  await database.insert(table, todo2.toMap());

  List<Map> list = await database.query(table);
  // 重新赋值，这样 todo.id 才不会为 0
  todo1 = Todo.fromMap(list[0]);
  todo2 = Todo.fromMap(list[1]);
  print('query: todo1 = $todo1');
  print('query: todo2 = $todo2');

  todo1.content += ' Come on!';
  todo2.content += ' I\'m tired';
  // 使用事务
  await database.transaction((txn) async {
    // 注意，这里面只能用 txn。直接使用 database 将导致死锁
    await txn.update(table, todo1.toMap(),
        // where 的参数里，我们可以使用 ? 作为占位符，对应的值按顺序放在 whereArgs

        // 注意，whereArgs 的参数类型是 List，这里不能写成 todo1.id.toString()。
        // 不然就变成了用 String 和 int 比较，这样一来就匹配不到待更新的那一行了
        where: '${Todo.columnId} = ?', whereArgs: [todo1.id]);
    await txn.update(table, todo2.toMap(),
        where: '${Todo.columnId} = ?', whereArgs: [todo2.id]);
  });

  list = await database.query(table);
  for (var map in list) {
    var todo = Todo.fromMap(map);
    print('updated: todo = $todo');
  }

  // 最后，别忘了关闭数据库
  await database.close();
}