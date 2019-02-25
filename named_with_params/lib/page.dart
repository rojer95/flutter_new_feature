import 'package:flutter/material.dart';

class Page extends StatelessWidget{
  Page({this.arguments});
  final Map arguments;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Text("hi this is next page, id is ${arguments != null ? arguments['id'] : '0'}"),
      ),
    );
  }
}