import 'package:flutter/material.dart';

class TabMenuItem extends StatefulWidget {
  @override
  _TabMenuItemState createState() => _TabMenuItemState();
}

class _TabMenuItemState extends State<TabMenuItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height:MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.green,
      ),
    );
  }
}
