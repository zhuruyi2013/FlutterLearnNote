import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  static const String _title = 'Flutter Code Sample';

  @override
  State<StatefulWidget> createState() {
    return _MyState();
  }


}

class _MyState extends State<MyApp> {

  //定义一个controller
  TextEditingController _unameController=new TextEditingController();

  TextEditingController _selectionController = new TextEditingController();

  @override
  void initState() {
    super.initState();
    _selectionController.text="hello world!";
    _selectionController.selection=TextSelection(
        baseOffset: 2,
        extentOffset: _selectionController.text.length
    );

    _unameController.addListener((){
      print("controller =" + _unameController.text);
    });
  }

  @override
  void didUpdateWidget(MyApp oldWidget) {
    super.didUpdateWidget(oldWidget);
    setState(() {

    });
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Practise"),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              TextField(
                controller: _selectionController,
                autofocus: true,
                decoration: InputDecoration(
                    labelText: "用户名",
                    hintText: "用户名或邮箱",
                    prefixIcon: Icon(Icons.person)
                ),
                onChanged: (v){
                  print(v);
                },
              ),
              TextField(
                decoration: InputDecoration(
                    labelText: "密码",
                    hintText: "您的登录密码",
                    prefixIcon: Icon(Icons.lock)
                ),
                obscureText: true,
                onChanged: _onPwdChange,
                onEditingComplete: _onNameComplete,
              ),
            ],
          ),
        ),
      ),
    );
  }


  void _onPwdChange(String value) {
    print("value=" + value);
  }

  void _onNameComplete() {

  }

}
