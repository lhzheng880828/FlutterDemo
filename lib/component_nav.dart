import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('导航页面示例'),
      ),
      body: Center(
        child: RaisedButton(
            onPressed: (){

              Navigator.push(context, MaterialPageRoute(builder: (context)=>(SecondScreen())));
        },
        child: Text('查看页面详情'),
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('导航页面示例'),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: (){
            Navigator.pop(context);
          },
          child: Text('返回页面'),
        ),
      ),

    );
  }
}

class Product {
  final String tilte;
  final String description;

  Product(this.tilte, this.description);
}

//页面跳转发送数据
class ProductList extends StatelessWidget {

  final List<Product> products;

  ProductList({Key key, @required this.products}): super(key:key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('商品列表'),
      ),
      body: ListView.builder(
          itemBuilder: (context, index) {

            return ListTile(
              title: Text(products[index].tilte),
              onTap: (){
                Navigator.push(context,
                MaterialPageRoute(builder: (context)=>
                ProductDetail(product: products[index],)
                ));
              },
            );
      },
      itemCount: products.length,
      ),
    );
  }
}



class ProductDetail extends StatelessWidget {
  final Product product;

  ProductDetail({Key key, @required this.product}): super(key:key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${product.tilte}'),
      ),
      body: Padding(padding: EdgeInsets.all(16.0),
      child: Text('${product.description}'),),
    );
  }
}


//页面跳转返回数据
class FirstPageNav extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('页面跳转返回数据示例'),),
      body: Center(child: RouteButton(),),
    );
  }
}

class RouteButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return RaisedButton(onPressed: (){

       _navigateToSecondPage(context);
    },
    child: Text('跳转到第二个页面'),);
  }
}

_navigateToSecondPage(BuildContext context) async {
  final result = await Navigator.push(context,
  new MaterialPageRoute(builder: (context)=>SecondPage()));

  Scaffold.of(context).showSnackBar(SnackBar(content: Text('$result')));
}


class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('选择一条数据'),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(padding: EdgeInsets.all(8.0),
            child: RaisedButton(
                onPressed: (){
              Navigator.pop(context, 'hi google');
            },
            child: Text('hi, google'),
            ),
            ),

            Padding(padding: EdgeInsets.all(8.0),
              child: RaisedButton(
                onPressed: (){
                  Navigator.pop(context, 'hi flutter');
                },
                child: Text('hi, flutter'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}