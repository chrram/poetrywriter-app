import 'package:flutter/material.dart';

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

class Poetrywriter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        body: HomeScreen(),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: Center(
          child: Container(
              height: 400,
              width: 300,
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.grey),
                borderRadius: BorderRadius.all(
                    Radius.circular(5.0) //         <--- border radius here
                ),
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    ElevatedButton(
                        onPressed: () =>
                        {Navigator.of(context).pushNamed("/login")},
                        child: Text("Login")),
                    ElevatedButton(onPressed: () => {}, child: Text("Register"))
                  ])),
        ));
  }
}

class InputBox extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _InputBoxState();
  }
}

class _InputBoxState extends State<InputBox> {
  String _username = "Input your username here";
  String _password = "Input your password here";

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Center(
          child: Form(
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
                  children: <Widget>[
                    Text("Poetrywriter"),
                    TextFormField(decoration: InputDecoration(hintText: "Username")),
                    TextFormField(decoration: InputDecoration(hintText: "Password")),
                    Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: ElevatedButton(
                            onPressed: () => {},
                            style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.zero,
                                shape: RoundedRectangleBorder(
                                    )),
                            child: Ink(
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        colors: [Colors.red, Colors.yellow]),
                                    ),
                                child: Container(
                                  width:100,
                                  height: 30,
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Login'
                                  ),
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
