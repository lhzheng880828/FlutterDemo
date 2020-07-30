import 'package:flutter/material.dart';
import 'package:flutter_app/im/contact_header.dart';
import 'package:flutter_app/im/contact_item.dart';
import 'package:flutter_app/im/contact_sider_list.dart';
import 'package:flutter_app/im/contact_vo.dart';

class ContactsPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
   return ContactState();
  }


}

class ContactState extends State<ContactsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ContactSiderList(
        items: contactData,
        headerBuilder: (context, index){
          return Container(
            child: ContactHeader(),
          );
        },
        itemBuilder: (context, index){
          return Container(
            color: Colors.white,
            alignment: Alignment.centerLeft,
            child: ContactItem(itemvo: contactData[index],titleName:contactData[index].name, imageName: contactData[index].avatarUrl,),
          );
        },
        sectionBuilder: (context, index){
          return Container(
            height: 32.0,
            padding: const EdgeInsets.only(left: 14.0),
            color: Colors.grey[300],
            alignment: Alignment.centerLeft,
            child: Text(contactData[index].sectionKey,
            style: TextStyle(
              fontSize: 14.0, color: Color(0xff909090)
            ),),
          );
        },
      ),
    );
  }
}