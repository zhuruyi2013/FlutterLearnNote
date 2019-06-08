import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import 'Setting.dart';

void main() => runApp(new MyApp(setting: SettingModel()));

class MyApp extends StatelessWidget {
  final SettingModel setting;

  const MyApp({Key key, @required this.setting}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScopedModel<SettingModel>(
      model: setting,
      child: new MaterialApp(
        title: 'ScopeModel Demo',
        theme: new ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: new MyHomePage(title: 'ScopeModel Demo'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
              ScopedModelDescendant<SettingModel>(
                  builder: (context, child, model) {
                return new Text(
                  model.count.toString(),
                  style: Theme.of(context).textTheme.display1,
                );
              }),
            ],
          ),
        ),
        floatingActionButton: ScopedModelDescendant<SettingModel>(
            builder: (context, child, model) {
          return new FloatingActionButton(
            onPressed: model.increaseCount,
            tooltip: 'Increment',
            child: new Icon(Icons.add),
          );
        }));
  }
}
