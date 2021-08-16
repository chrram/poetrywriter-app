
import 'package:flutter/material.dart';
import 'login.dart';
import 'feed.dart';

void main() => runApp(new MaterialApp(
  title: "test",
  initialRoute: '/',
  routes: <String, WidgetBuilder>{
    // When navigating to the "/" route, build the FirstScreen widget.
    '/': (context) => Login(),
    // When navigating to the "/second" route, build the SecondScreen widget.
    '/feed': (context) => new Feed(),
  },
));
