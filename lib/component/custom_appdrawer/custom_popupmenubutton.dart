import 'package:flutter/material.dart';

class CustomPopupMenuButton extends PopupMenuButton{
  CustomPopupMenuButton({Key key ,Widget icon,PopupMenuItemBuilder itemBuilder,PopupMenuItemSelected onSelected})
  :super(key:key,itemBuilder:itemBuilder,onSelected:onSelected,icon:icon);
}