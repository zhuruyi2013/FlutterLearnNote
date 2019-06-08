import 'package:flutter/material.dart';
import 'AlbumCover.dart';
import 'MusicManager.dart';
import 'model/Music.dart';

void main() => runApp(new MyApp());

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  String weatherUrl = "https://www.tianqiapi.com/api/";


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
//    getHttp();

    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Animation Album"),
        ),
        body: Page(),
      ),
    );
  }
}

class Page extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _PageState();
  }
}

class _PageState extends State<Page> {
  Music music;

  @override
  void initState() {
    super.initState();
    music = musicManager.getCurrent();
    musicManager.addListener(_onPlayerStateChanged);
  }

  void _onPlayerStateChanged() {
    if (music != musicManager.getCurrent()) {
      music = musicManager.getCurrent();
      if (music == null) {
        Navigator.pop(context);
      } else {
        setState(() {});
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlbumCover(music: music);
  }
}


