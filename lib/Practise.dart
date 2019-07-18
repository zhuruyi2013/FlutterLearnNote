import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';

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
//              Text(
//                "Hello world",
//                textAlign: TextAlign.center,
//              ),
//              Text(
//                "Hello world! I'm Jack. " * 4,
//                maxLines: 1,
//                overflow: TextOverflow.ellipsis,
//              ),
//              Text(
//                "Hello world",
//                textScaleFactor: 1.5,
//              ),
//              Text(
//                "Hello world " * 6, //字符串重复六次
//                textAlign: TextAlign.center,
//              ),
//              Text(
//                "Hello world",
//                style: TextStyle(
//                    color: Colors.blue,
//                    fontSize: 18.0,
//                    height: 1.2,
//                    fontFamily: "Courier",
//                    background: new Paint()..color = Colors.yellow,
//                    decoration: TextDecoration.underline,
//                    decorationStyle: TextDecorationStyle.dashed),
//              ),
//              Text.rich(TextSpan(children: [
//                TextSpan(text: "Home: "),
//                TextSpan(
//                  text: "https://flutterchina.club",
//                  style: TextStyle(color: Colors.blue),
////                        recognizer: _tapRecognizer
//                ),
//              ])),
//              DefaultTextStyle(
//                //1.设置文本默认样式
//                style: TextStyle(
//                  color: Colors.red,
//                  fontSize: 20.0,
//                ),
//                textAlign: TextAlign.start,
//                child: Column(
//                  crossAxisAlignment: CrossAxisAlignment.start,
//                  children: <Widget>[
//                    Text("hello world"),
//                    Text("I am Jack"),
//                    Text(
//                      "I am Jack",
//                      style: TextStyle(
//                          inherit: false, //2.不继承默认样式
//                          color: Colors.grey),
//                    ),
//                  ],
//                ),
//              ),
              RaisedButton(
                child: Text("normal"),
                onPressed: () => {},
              ),
              FlatButton(
                child: Text("normal"),
                onPressed: () => {},
              ),
              OutlineButton(
                child: Text("normal"),
                onPressed: () => {},
              ),
              IconButton(
                icon: Icon(Icons.send),
                onPressed: () => {},
              ),
              FlatButton(
                child: Text("Submit"),
                color: Colors.blue,
                highlightColor: Colors.blue[700],
                colorBrightness: Brightness.dark,
                textColor: Colors.white,
                padding: EdgeInsets.all(10),
                shape: RoundedRectangleBorder(
                    borderRadius : BorderRadius.circular(20)
                ),
                splashColor: Colors.grey,
                onPressed: (){},
              ),
//              Image(
//                image: AssetImage("images/photo.jpg"),
//                width: 100,
//              ),
//              Image(
//                image: NetworkImage(
//                    "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4"),
//                width: 100.0,
//              ),
//              Image.network(
//                "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
//                width: 100,
//              ),
//              Image(
//                image: AssetImage("images/photo.jpg"),
//                width: 100,
//                color: Colors.blue,
//                colorBlendMode: BlendMode.difference,
//              ),
//              Image(
//                image: AssetImage("images/photo.jpg"),
//                width: 100.0,
//                height: 200.0,
//                repeat: ImageRepeat.repeatY ,
//              )
            ],
          ),
        ),
      ),
    );
  }
}
