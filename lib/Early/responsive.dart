//https://medium.com/flutter-community/developing-for-multiple-screen-sizes-and-orientations-in-flutter-fragments-in-flutter-a4c51b849434

import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';



typedef Null ItemSelectedCallBack(int value);

class ListWidget extends StatefulWidget {
  final int count;
  final ItemSelectedCallBack onItemSelected;

  ListWidget(this.count,
      this.onItemSelected,);

  @override
  _ListWidgetState createState() => _ListWidgetState();
}


class _ListWidgetState extends State<ListWidget> {

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.count,
      itemBuilder: (context, position) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: InkWell(
              onTap: () {
                widget.onItemSelected(position);
              },
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      position.toString(), style: TextStyle(fontSize: 22.0),),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class DetailWidget extends StatefulWidget {

  final int data;

  DetailWidget(this.data);

  @override
  _DetailWidgetState createState() => _DetailWidgetState();
}

class _DetailWidgetState extends State<DetailWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(widget.data.toString(),
              style: TextStyle(fontSize: 36.0, color: Colors.white),),
          ],
        ),
      ),

    );
  }
}

class MasterDetailPage extends StatefulWidget {
  @override
  State<MasterDetailPage> createState() => _MasterDetailPageState();
}

class _MasterDetailPageState extends State<MasterDetailPage> {
  var selectedValue = 0;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}



