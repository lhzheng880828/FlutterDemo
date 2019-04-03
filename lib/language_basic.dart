//3.2 变量和基本数据类型
void basicDataTypeTest(){
  var name = '小张';
  if(name == null){
    print("name is null");
  }

  //(1.) 常量和固定值
  final username = '张三';//定义一个常量

  //const类型做四则运算
  const pi = 3.1415926;
  const area = pi*100*100;

  final stars = const ["star1","star2"];
  final buttons = const ['button1', 'button2'];

  //(2.) 基本数据类型
  //Dart基本数据类型包括：Number、String、Boolean、List、Map。
  //*******(2.1) Number
  //Dart的Number有两种类型，int和double类型，int的范围2^63-1 - -2^63
  //整数类型不包含小数点; double类型是64位（双精度）浮点数
  var x = 1;
  var hex = 0xDEADBEEF;

  //如果一个数字包含小数点，那么就是小数类型。
  var y = 1.1;
  var exponents = 1.42e5;

  //从 Dart 2.1 开始，必要的时候 int 字面量会自动转换成 double 类型。
  double z = 1; // 相当于 double z = 1.0.

  //字符串转数字及数字转字符串
  // String -> int
  var one = int.parse('1');
  assert(one == 1);

// String -> double
  var onePointOne = double.parse('1.1');
  assert(onePointOne == 1.1);

// int -> String
  String oneAsString = 1.toString();
  assert(oneAsString == '1');

// double -> String
  String piAsString = 3.14159.toStringAsFixed(2);
  assert(piAsString == '3.14');

  //整型位运算
  assert((3 << 1) == 6); // 0011 << 1 == 0110
  assert((3 >> 1) == 1); // 0011 >> 1 == 0001
  assert((3 | 4) == 7); // 0011 | 0100 == 0111

  //数字类型字面量是编译时常量。 在算术表达式中，只要参与计算的因子是编译时常量，
  // 那么算术表达式的结果也是编译时常量。
  const msPerSecond = 1000;
  const secondsUntilRetry = 5;
  const msUntilRetry = secondsUntilRetry * msPerSecond;

  //*******(2.2) String
  //Dart 字符串是一组 UTF-16 单元序列。 字符串通过单引号或者双引号创建。
  var s1 = 'Single quotes work well for string literals.';
  var s2 = "Double quotes work just as well.";
  var s3 = 'It\'s easy to escape the string delimiter.';
  var s4 = "It's even easier to use the other delimiter.";

  //字符串可以通过 ${expression} 的方式内嵌表达式。 如果表达式是一个标识符，则 {} 可以省略。
  //在 Dart 中通过调用就对象的 toString() 方法来得到对象相应的字符串。
  var s = 'string interpolation';

  assert('Dart has $s, which is very handy.' ==
      'Dart has string interpolation, ' +
          'which is very handy.');
  assert('That deserves all caps. ' +
      '${s.toUpperCase()} is very handy!' ==
      'That deserves all caps. ' +
          'STRING INTERPOLATION is very handy!');

  //字符串拼接，使用+或者字面常量拼接
  var s11 = 'String '
      'concatenation'
      " works even over line breaks.";
  assert(s11 ==
      'String concatenation works even over '
          'line breaks.');

  var s22 = 'The + operator ' + 'works, as well.';
  assert(s22 == 'The + operator works, as well.');

  //使用连续三个单引号或者三个双引号实现多行字符串对象的创建：
  var s111 = '''
You can create
multi-line strings like this one.
''';

  var s222 = """This is also a
multi-line string.""";

  //使用 r 前缀，可以创建 “原始 raw” 字符串：
  var ss = r"In a raw string, even \n isn't special.";
  //参考 Runes 来了解如何在字符串中表达 Unicode 字符。

  //一个编译时常量的字面量字符串中，如果存在插值表达式，表达式内容也是编译时常量，
  // 那么该字符串依旧是编译时常量。 插入的常量值类型可以是 null，数值，字符串或布尔值。

  // const 类型数据
  const aConstNum = 0;
  const aConstBool = true;
  const aConstString = 'a constant string';

// 非 const 类型数据
  var aNum = 0;
  var aBool = true;
  var aString = 'a string';
  const aConstList = [1, 2, 3];

  const validConstString = '$aConstNum $aConstBool $aConstString'; //const 类型数据
// const invalidConstString = '$aNum $aBool $aString $aConstList'; //非 const 类型数据
//更多关于 string 的使用, 参考 字符串和正则表达式.

//*******(2.3) Boolean

  //Dart 使用 bool 类型表示布尔值。 Dart 只有字面量 true and false 是布尔类型， 这两个对象都是编译时常量。
  //Dart 的类型安全意味着不能使用 if (nonbooleanValue) 或者 assert (nonbooleanValue)。 而是应该像下面这样，明确的进行值检查
  // 检查空字符串。
  var fullName = '';
  assert(fullName.isEmpty);

// 检查 0 值。
  var hitPoints = 0;
  assert(hitPoints <= 0);

// 检查 null 值。
  var unicorn;
  assert(unicorn == null);

// 检查 NaN 。
  var iMeantToDoThis = 0 / 0;
  assert(iMeantToDoThis.isNaN);

  //*******(2.4) List
  /*
  几乎每种编程语言中最常见的集合可能是 array 或有序的对象集合。 在 Dart 中的 Array 就是 List 对象， 通常称之为 List 。
  Dart 中的 List 字面量非常像 JavaScript 中的 array 字面量。 下面是一个 Dart List 的示例：
  */
  var list = [1, 2, 3];
  //Lists 的下标索引从 0 开始，第一个元素的索引是 0。 list.length - 1 是最后一个元素的索引。
  assert(list.length == 3);
  assert(list[1] == 2);

  list[1] = 1;
  assert(list[1] == 1);

  //在 List 字面量之前添加 const 关键字，可以定义 List 类型的编译时常量：
  var constantList = const [1, 2, 3];
// constantList[1] = 1; // 取消注释会引起错误。
  //List 类型包含了很多 List 的操作函数。 更多信息参考 泛型 和 集合.
//*******(2.5) Set
//创建字面常量Set
  var halogens = {'fluorine', 'chlorine', 'bromine', 'iodine', 'astatine'};

  //创建空集
  var names = <String>{};
// Set<String> names = {}; // 这样也是可以的。
// var names = {}; // 这样会创建一个 Map ，而不是 Set 。
  //使用 add() 或 addAll() 为已有的 Set 添加元素：
  var elements = <String>{};
  elements.add('fluorine');
  elements.addAll(halogens);
  //使用 .length 来获取 Set 中元素的个数：

  assert(elements.length == 5);

  //在 Set 字面量前增加 const ，来创建一个编译时 Set 常量：
  final constantSet = const {
  'fluorine',
  'chlorine',
  'bromine',
  'iodine',
  'astatine',
  };
// constantSet.add('helium'); // Uncommenting this causes an error.
//更多关于 Set 的内容，参阅 Generic 及 Set。

//*******(2.6) Map
 //定义Map字面量
  var gifts = {
    // Key:    Value
    'first': 'partridge',
    'second': 'turtledoves',
    'fifth': 'golden rings'
  };

  var nobleGases = {
    2: 'helium',
    10: 'neon',
    18: 'argon',
  };

  //提示： Dart 会将 gifts 的类型推断为 Map<String, String>， nobleGases 的类型推断为
  // Map<int, String> 。 如果尝试在上面的 map 中添加错误类型，那么分析器或者运行时会引发错误。
  // 有关更多信息，请阅读类型推断。
  //以上 Map 对象也可以使用 Map 构造函数创建：
  var gifts_1 = Map();
  gifts_1['first'] = 'partridge';
  gifts_1['second'] = 'turtledoves';
  gifts_1['fifth'] = 'golden rings';

  var nobleGases_1 = Map();
  nobleGases_1[2] = 'helium';
  nobleGases_1[10] = 'neon';
  nobleGases_1[18] = 'argon';

  //添加 key-value 对到已有的 Map 中：
  gifts['fourth'] = 'calling birds'; // Add a key-value pair

  //从一个 Map 中获取一个 value：
  assert(gifts['first'] == 'partridge');

  //如果 Map 中不包含所要查找的 key，那么 Map 返回 null：
  assert(gifts['fifth'] == null);

  //使用 .length 函数获取当前 Map 中的 key-value 对数量：
  assert(gifts.length == 2);

  //创建 Map 类型运行时常量，要在 Map 字面量前加上关键字 const。
  final constantMap = const {
    2: 'helium',
    10: 'neon',
    18: 'argon',
  };

// constantMap[2] = 'Helium'; // 取消注释会引起错误。

  //*******(2.7) Rune （略）
  //在 Dart 中， Rune 用来表示字符串中的 UTF-32 编码字符。

  //Unicode 定义了一个全球的书写系统编码， 系统中使用的所有字母，数字和符号都对应唯一的数值编码。
  //由于 Dart 字符串是一系列 UTF-16 编码单元， 因此要在字符串中表示32位 Unicode 值需要特殊语法支持。

  //*******(2.8) Symbol （略）


}

//3.3 函数
//Dart函数也是一种对象，类型为Function,可以作为参数传递
//返回值类型可以省略
var _nobleGases  = const [1, 2, 3];
bool isNoble(int atomicNumber) {
  return _nobleGases[atomicNumber] != null;
}

//如果函数中只有一句表达式，可以使用简写语法：
bool isNoble1(int atomicNumber) => _nobleGases[atomicNumber] != null;

//=> expr 语法是 { return expr; } 的简写。 => 符号 有时也被称为 箭头 语法。

//******(3.3.1)可选参数及默认参数

//************(3.3.1.1)命名可选参数
//调用函数时，可以使用指定命名参数 paramName: value。 例如：
//enableFlags(bold: true, hidden: false);

//定义函数是，使用 {param1, param2, …} 来指定命名参数：
/// Sets the [bold] and [hidden] flags ...
void enableFlags({bool bold, bool hidden}) {

}

//为了易于阅读，可以使用 @required 注释表示参数是 required 性质的命名参数，
// 该方式可以在任何 Dart 代码中使用（不仅仅是Flutter）。

//const Scrollbar({Key key, @required Widget child})

//************(3.3.1.2)位置可选参数
//将参数放到 [] 中来标记参数是可选的：
String say(String from, String msg, [String device]) {
  var result = '$from says $msg';
  if (device != null) {
    result = '$result with a $device';
  }
  return result;
}

//下面是不使用可选参数调用上面方法 的示例：

//assert(say('Bob', 'Howdy') == 'Bob says Howdy');

//下面是使用可选参数调用上面方法的示例：
/*
assert(say('Bob', 'Howdy', 'smoke signal') ==
'Bob says Howdy with a smoke signal');
*/

//************(3.3.1.3)默认参数值
//在定义方法的时候，可以使用 = 来定义可选参数的默认值。 默认值只能是编译时常量。 如果没有提供默认值，则默认值为 null。

//下面是设置可选参数默认值示例：
/// 设置 [bold] 和 [hidden] 标志 ...
//void enableFlags({bool bold = false, bool hidden = false}) {...}

// bold 值为 true; hidden 值为 false.
//enableFlags(bold: true);


//下面示例演示了如何为位置参数设置默认值：

String say1(String from, String msg,
    [String device = 'carrier pigeon', String mood]) {
  var result = '$from says $msg';
  if (device != null) {
    result = '$result with a $device';
  }
  if (mood != null) {
    result = '$result (in a $mood mood)';
  }
  return result;
}

testSay1(){
  assert(say('Bob', 'Howdy') == 'Bob says Howdy with a carrier pigeon');
}

//list 或 map 可以作为默认值传递。 下面的示例定义了一个方法 doStuff()， 并分别指定参数 list 和 gifts 的默认值。

void doStuff(
    {List<int> list = const [1, 2, 3],
      Map<String, String> gifts = const {
        'first': 'paper',
        'second': 'cotton',
        'third': 'leather'
      }}) {
  print('list:  $list');
  print('gifts: $gifts');
}

//************(3.3.1. 4)main函数
//任何应用都必须有一个顶级 main() 函数，作为应用服务的入口。 main() 函数返回值为空，参数为一个可选的 List<String> 。

//下面是 web 应用的 main() 函数：
/*
void main() {
  querySelector('#sample_text_id')
    ..text = 'Click me!'
    ..onClick.listen(reverseText);
}
*/

/*
提示：
以上代码中的 .. 语法为 级联调用 （cascade）。 使用级联调用， 可以简化在一个对象上执行的多个操作。
*/

//下面是一个命令行应用的 main() 方法，并且使用了输入参数：
// 这样运行应用： dart args.dart 1 test
/*void main(List<String> arguments) {
  print(arguments);

  assert(arguments.length == 2);
  assert(int.parse(arguments[0]) == 1);
  assert(arguments[1] == 'test');
}*/
//使用 args library 可以定义和解析命令行参数。

//************(3.3.1.5)函数是一等公民
//一个函数可以作为另一个函数的参数。 例如：
void printElement(int element) {
  print(element);
}

testFunAsParams(){
  var list = [1, 2, 3];

// 将 printElement 函数作为参数传递。
  list.forEach(printElement);
}

//同样可以将一个函数赋值给一个变量，例如：

void testFunAsVariable(){
  var loudify = (msg) => '!!! ${msg.toUpperCase()} !!!';
  assert(loudify('hello') == '!!! HELLO !!!');
}

//************(3.3.1.6)匿名函数
void anonymousFunTest(){
  /*匿名函数和命名函数看起来类似— 在括号之间可以定义一些参数或可选参数，参数使用逗号分割。

  后面大括号中的代码为函数体：

  ([[Type] param1[, …]]) {
  codeBlock;
  };
  */

  var list = ['apples', 'bananas', 'oranges'];
  list.forEach((item) {
    print('${list.indexOf(item)}: $item');
  });
  //如果函数只有一条语句， 可以使用箭头简写。
  list.forEach(
          (item) => print('${list.indexOf(item)}: $item'));
}


//************(3.3.1.7)词法作用域
void variableScope(){
  bool topLevel = true;

  void main_1() {
    var insideMain = true;

    void myFunction() {
      var insideFunction = true;

      void nestedFunction() {
        var insideNestedFunction = true;

        assert(topLevel);
        assert(insideMain);
        assert(insideFunction);
        assert(insideNestedFunction);
      }
    }
  }
}
//注意 nestedFunction() 可以访问所有的变量， 一直到顶级作用域变量。

//************(3.3.1.8)词法闭包
/*
闭包 即一个函数对象，即使函数对象的调用在它原始作用域之外， 依然能够访问在它词法作用域内的变量。

函数可以封闭定义到它作用域内的变量。 接下来的示例中， makeAdder() 捕获了变量 addBy。 无论在什么
时候执行返回函数，函数都会使用捕获的 addBy 变量。
*/

void closure(){
  /// 返回一个函数，返回的函数参数与 [addBy] 相加。
  Function makeAdder(num addBy) {
    return (num i) => addBy + i;
  }

  void closureTest() {
    // 创建一个加 2 的函数。
    var add2 = makeAdder(2);

    // 创建一个加 4 的函数。
    var add4 = makeAdder(4);

    assert(add2(3) == 5);
    assert(add4(3) == 7);
  }
}

//************(3.3.1.9)测试函数是否相等
//下面是顶级函数，静态方法和示例方法相等性的测试示例：
void foo() {} // 顶级函数

class A {
  static void bar() {} // 静态方法
  void baz() {} // 示例方法
}

void testFunEquals() {
  var x;

  // 比较顶级函数。
  x = foo;
  assert(foo == x);

  // 比较静态方法。
  x = A.bar;
  assert(A.bar == x);

  // 比较实例方法。
  var v = A(); // A的1号实例
  var w = A(); // A的2号实例
  var y = w;
  x = w.baz;

  // 两个闭包引用的同一实例（2号）,
  // 所以它们相等。
  assert(y.baz == x);

  // 两个闭包引用的非同一个实例，
  // 所以它们不相等。
  assert(v.baz != w.baz);
}

//************(3.3.1.10)返回值
//所有函数都会返回一个值。 如果没有明确指定返回值， 函数体会被隐式的添加 return null; 语句。
testFunReturn(){
  foo() {}

  assert(foo() == null);
}


//3.4 运算符(略)

void testOperator(){
  var a=1;
  var b= 1;
  var c = false;
  a++;
  a + b;
  a = b;
  a == b;
  c ? a : b;
  //a is T;
}

//3.5 控制流语句（略）
//控制流语句和其他语言类似
/*
你可以通过下面任意一种方式来控制 Dart 程序流程：

if and else

for loops

while and do-while loops

break and continue

switch and case

assert

使用 try-catch 和 throw 也可以改变程序流程， 详见 Exceptions。
*/

//for 循环
//进行迭代操作，可以使用标准 for 语句。 例如：

/*var message = StringBuffer('Dart is fun');
for (var i = 0; i < 5; i++) {
message.write('!');
}
*/
//闭包在 Dart 的 for 循环中会捕获循环的 index 索引值， 来避免 JavaScript 中常见的陷阱。 请思考示例代码：

/*var callbacks = [];
for (var i = 0; i < 2; i++) {
callbacks.add(() => print(i));
}
callbacks.forEach((c) => c());
*/
//和期望一样，输出的是 0 和 1。 但是示例中的代码在 JavaScript 中会连续输出两个 2 。

//I如果要迭代一个实现了 Iterable 接口的对象， 可以使用 forEach() 方法， 如果不需要使用当前计数值， 使用 forEach() 是非常棒的选择；
/*
candidates.forEach((candidate) => candidate.interview());
*/

//实现了 Iterable 的类（比如， List 和 Set）同样也支持使用 for-in 进行迭代操作 iteration ：

/*
var collection = [0, 1, 2];
for (var x in collection) {
print(x); // 0 1 2
}
*/

