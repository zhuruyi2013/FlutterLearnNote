import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_app/DioHelper.dart';
import 'dart:convert';
import 'Weather.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  String weatherUrl = "https://www.tianqiapi.com/api/";


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    getHttp();

    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }

  void getHttp() async {
    try {
//    Response response = await Dio().get(weatherUrl);
      Response response = await DioHelper().requestGet(weatherUrl,
          {"version": "v1", "city":"青岛"});

      Weather w = Weather.fromJson(json.decode(response.toString()));
      print(w.city);
    } catch (e) {
      print(e);
    }
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              'You have clicked the button this many times:',
            ),
            new Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}



