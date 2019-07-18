import 'package:flutter/material.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("ScrollDemo"),
          ),
          body: des
      ),
    );
  }

  Widget des = Scrollbar(
    child: SingleChildScrollView(
      child: Container(
        alignment: Alignment.center,
        width: 400,
        child: Column(
          children: <Widget>[
            Text("11"*8, ),
            Text("1"),
            Text("1"),
            Text("1"),
            Text("1"),
            Text("1"),
            Text("1"),
            Text("1"),
            Text("1"),
            Text("1"),
            Text("1"),
            Text("1"),
            Text("1"),
            Text("1"),
            Text("1"),
            Text("1"),
            Text("1"),
            Text("1"),
            Text("1"),
            Text("1"),
            Text("1"),
            Text("1"),
            Text("1"),
            Text("1"),
            Text("1"),
            Text("1"),
            Text("1"),
            Text("1"),
            Text("1"),
            Text("1"),
            Text("1"),
            Text("1"),
            Text("1"),
            Text("1"),
            Text("1"),
            Text("1"),
            Text("1"),
            Text("1"),
            Text("1"),
            Text("1"),
            Text("1"),
            Text("1"),
            Text("1"),
            Text("1"),
            Text("1"),
            Text("1"),
            Text("1"),
            Text("1"),
          ],
        ),
      ),
    ),
  );
}
