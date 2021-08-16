import 'package:flutter/material.dart';

class Feed extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FeedState();
  }
}

class _FeedState extends State<Feed> {

  // todo : get the feed of poems based on the date..

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text("PoetryWriter"),
        ),
        body: Text("Feed goes here"));
  }
}
