import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget DrawerList(){
  return Container(
    child: Column(),
  );
}

Widget ItemList() {
  return InkWell(
    child: Padding(
      padding: EdgeInsets.all(8),
      child: Row(children: [Expanded(child: Text('hola'))]),
    ),
  );
}