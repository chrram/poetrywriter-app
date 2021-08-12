import 'package:flutter/material.dart';

void main() => runApp(new Poetrywriter());

class Poetrywriter extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
          appBar: AppBar(
              title: Text("Login")
          ),
          body: InputBox(),
      )
    );
  }

}

class InputBox extends StatefulWidget {
  @override
    State<StatefulWidget> createState(){
    return _InputBoxState();
  }
}

class _InputBoxState extends State<InputBox> {

  @override
  Widget build(BuildContext context){
    return Card(child: Text("Login here."));
  }

}
