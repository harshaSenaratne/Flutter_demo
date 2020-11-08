import 'package:flutter/material.dart';

class CustomAppBar extends AppBar {
  CustomAppBar({Key key, Color backgroundColor, Widget title, List<Widget> actions})
      : super(key: key, title: title, actions: actions,backgroundColor:backgroundColor);
}
