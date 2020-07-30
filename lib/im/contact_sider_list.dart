import 'package:flutter/material.dart';
import 'package:flutter_app/im/contact_vo.dart';

class ContactSiderList extends StatefulWidget {
  
  final List<ContactVO> items;
  final IndexedWidgetBuilder headerBuilder;
  final IndexedWidgetBuilder itemBuilder;
  final IndexedWidgetBuilder sectionBuilder;


  ContactSiderList({ Key key,
      this.items, this.headerBuilder, this.itemBuilder, this.sectionBuilder}):super(key:key);

  @override
  State<StatefulWidget> createState() {
    return ContactState();
  }
  
  }

  class ContactState extends State<ContactSiderList>{

  final ScrollController _scrollController = ScrollController();

  bool _onNotification(ScrollNotification notification){
    return true;
  }

  _isShowHeaderView(index){
    if(index == 0 && widget.headerBuilder!=null){
      return Offstage(
        offstage: false,
        child: widget.headerBuilder(context, index),
      );
    }
    return Container();
  }

  _shouldShowHeader(int position) {
    if(position <=0){
      return false;
    }
    if(position!=0 &&
    widget.items[position].sectionKey!= widget.items[position-1].sectionKey){
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          NotificationListener(
            onNotification: _onNotification,
              child: ListView.builder(
                controller: _scrollController,
                  physics: AlwaysScrollableScrollPhysics(),
                  itemCount: widget.items.length,
                  itemBuilder: (context, index){
                  return Container(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      children: <Widget>[
                        _isShowHeaderView(index),
                        Offstage(
                          offstage: _shouldShowHeader(index),
                          child: widget.sectionBuilder(context, index),
                        ),
                        Column(
                          children: <Widget>[
                            widget.itemBuilder(context, index),
                          ],
                        )
                      ],
                    ),
                  );
                  }
              ),
          ),
        ],
      ),
    );
  }
  }