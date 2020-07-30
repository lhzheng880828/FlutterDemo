import 'package:flutter/material.dart';
import 'package:flutter_app/im/contact_item.dart';

class ContactHeader extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ContactItem(titleName:'新加好友', imageName:'images/1.png'),
        ContactItem(titleName:'公共聊天室', imageName:'images/1.png'),
      ],
    );
  }
}