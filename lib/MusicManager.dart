import 'model/Music.dart';
import 'dart:async';

MusicManager musicManager = MusicManager._private();

class MusicManager {
  int _currentIndex = 1;

  var _musicList = List();
  var _listeners = new List();

  MusicManager._private() : super() {
    _initMusic();

    Timer.periodic(Duration(milliseconds: 500), (timer){
      if(_listeners != null) _listeners.forEach((lis){
        //mock music state change , like song period change/ switch song and
        // so on.
        lis();
      });
    });
  }

  _initMusic() {
    for (int i = 0; i < 10; i++) {
      _musicList.add(Music(
          id: i,
          title: "music$i",
          ablumCoverImg:
              "http://psinbrnuw.bkt.clouddn.com/flutter20190606145159.png"));
    }
  }

  getNext() {
    int next = _currentIndex + 1;
    if (next >= _musicList.length) {
      next = _musicList.length - 1;
    }
    return _musicList[next];
  }

  getPre() {
    int pre = _currentIndex - 1;
    if (pre <= 0) {
      pre = 0;
    }
    return _musicList[pre];
  }

  void playNext() {
    _currentIndex++;
  }

  void playPre() {
    _currentIndex--;
  }

  getCurrent() {
    return _musicList[_currentIndex];
  }

  void addListener(listener) {
    _listeners.add(listener);
  }

  void removeListener(listener) {
    _listeners.remove(listener);
  }
}
