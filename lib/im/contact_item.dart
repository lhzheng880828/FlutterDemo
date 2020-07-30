import 'package:flutter/material.dart';
import 'package:flutter_app/im/contact_vo.dart';

class ContactItem extends StatelessWidget {
  final ContactVO itemvo;
  final String titleName;
  final String imageName;

  ContactItem({this.itemvo, this.titleName, this.imageName});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
            bottom: BorderSide(
          width: 0.5,
          color: Color(0xffd9d9d9),
        )),
      ),
      height: 52.0,
      child: FlatButton(
          onPressed: () {},
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              imageName == null
                  ? Image.network(
                      'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3103314052,1050255535&fm=26&gp=0.jpg',
                      width: 36.0,
                      height: 36.0,
                      scale: 0.9,
                    )
                  : Image.network(
                      imageName,
                      width: 36.0,
                      height: 36.0,
                    ),
              Container(
                margin: EdgeInsets.only(left: 12.0),
                child: Text(
                  titleName == null ? itemvo.name ?? '暂时' : titleName,
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Color(0xff353535),
                  ),
                  maxLines: 1,
                ),
              ),
            ],
          )),
    );
  }
}
