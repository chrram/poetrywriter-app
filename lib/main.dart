import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(new MaterialApp(
  title: "test",
  initialRoute: '/',
  routes: <String, WidgetBuilder>{
    // When navigating to the "/" route, build the FirstScreen widget.
    '/': (context) => InputBox(),
    // When navigating to the "/second" route, build the SecondScreen widget.
    '/register': (context) => new InputBox(),
  },
));

class InputBox extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _InputBoxState();
  }
}

class _LoginData {
  String username = '';
  String password = '';
}

class _InputBoxState extends State<InputBox> {
  final _formKey = GlobalKey<FormState>();
  _LoginData _data = new _LoginData();

  void _submit() async {
  this._formKey.currentState!.save();

   final http.Response response = await http.post(
    Uri.parse('http://localhost:8080/token'),
    headers: <String, String>{
      "Content-Type": "application/x-www-form-urlencoded",
      "Accept": "*/*"
    },
    body: {
      'username': _data.username,
      'password': _data.password
    });

    if (response.statusCode == 200) {

    return print('${response.body}');
  } else {
      print('${response.body}');
    throw Exception('Failed to load album');
  }

  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("PoetryWriter"),
      ),
      body: Center(
          child: Form(
              key: this._formKey,
              child: Container(
                height: 400,
                width: 300,
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey),
                  borderRadius: BorderRadius.all(
                      Radius.circular(10.0) //         <--- border radius here
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                        height: 50,
                        child: Text("PoetryWriter",
                            style:
                            const TextStyle(fontWeight: FontWeight.bold))),
                    Container(
                      width: 250.0,
                      child: TextFormField(
                          onSaved: (value) {
                            this._data.username = value!;
                          },
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(20.0),
                              hintText: "Username",
                              border: OutlineInputBorder())),
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Container(
                          width: 250.0,
                          child: TextFormField(
                              onSaved: (value) {
                                this._data.password = value!;
                              },
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(20.0),
                                  hintText: "Password",
                                  border: OutlineInputBorder())),
                        )),
                    Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: ElevatedButton(
                            onPressed: () => {_submit()},
                            style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.zero,
                                shape: RoundedRectangleBorder()),
                            child: Ink(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(colors: [
                                    Colors.blue,
                                    Colors.lightBlueAccent
                                  ]),
                                ),
                                child: Container(
                                  width: 100,
                                  height: 30,
                                  alignment: Alignment.center,
                                  child: Text('Login'),
                                )))),
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("Don't have an account? "),
                          InkWell(
                            onTap: () => {},
                            child: Text("Sign up",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          )
                        ]),
                  ],
                ),
              ))),
    );
  }
}
