import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("PointerDemo"),
          ),
          body: des),
    );
  }

  Widget des = PointerWidget();
}

class PointerWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PointerState();
  }
}

class _PointerState extends State<PointerWidget> {
  //定义一个状态，保存当前指针位置
  PointerEvent _event;

  @override
  Widget build(BuildContext context) {
//    return Listener(
//      child: Container(
//        alignment: Alignment.center,
//        color: Colors.blue,
//        width: 400.0,
//        height: 300.0,
//        child: Text(_event?.toString()??"",style: TextStyle(color: Colors.white)),
//      ),
//      onPointerDown: (PointerDownEvent event) => setState(()=>_event=event),
//      onPointerMove: (PointerMoveEvent event) => setState(()=>_event=event),
//      onPointerUp: (PointerUpEvent event) => setState(()=>_event=event),
//    );

//      return Listener(
//          child: ConstrainedBox(
//            constraints: BoxConstraints.tight(Size(300.0, 150.0)),
//            child: Center(child: Text("Box A")),
//          ),
//          behavior: HitTestBehavior.opaque,
//          onPointerDown: (event) => print("down A")
//      );

    return Stack(
      children: <Widget>[
        Listener(
          child: ConstrainedBox(
            constraints: BoxConstraints.tight(Size(300.0, 200.0)),
            child: DecoratedBox(decoration: BoxDecoration(color: Colors.blue)),
          ),
          onPointerDown: (event) => print("down0"),
        ),
        Listener(
          child: ConstrainedBox(
            constraints: BoxConstraints.tight(Size(200.0, 100.0)),
            child: Center(
              child: DecoratedBox(
                  decoration: BoxDecoration(color: Colors.red),
                  child: Text("左上角200*100范围内非文本区域点击")),
            ),
          ),
          onPointerDown: (event) => print("down1"),
          behavior: HitTestBehavior.translucent, //放开此行注释后可以"点透"
        )
      ],
    );
  }
}
