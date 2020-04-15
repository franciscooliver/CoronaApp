import 'package:flutter/material.dart';

class NavigatorApp {
  NavigatorApp.push(context, page) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => page));
  }

  NavigatorApp.pop(context){
    Navigator.pop(context);
  }
}
