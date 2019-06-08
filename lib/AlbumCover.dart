import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app/repository/cached_image.dart';
import 'MusicManager.dart';
import 'model/Music.dart';

class AlbumCover extends StatefulWidget {
  final Music music;

  AlbumCover({Key, key, @required this.music}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _AlbumCoverState();
  }
}

class _AlbumCoverState extends State<AlbumCover> with TickerProviderStateMixin {
  bool _beDragging = false;

  //唱针是否贴近封面
  bool _needleAttachCover = false;

  AnimationController _needleController;

  Animation<double> _needleAnimation;

  double _converTranslateX = 0;

  AnimationController _translateController;

  ///滑动切换音乐效果上一个封面
  Music _previousMusic;

  ///当前播放中的音乐
  Music _currentMusic;

  ///滑动切换音乐效果下一个封面
  Music _nextMusic;

  bool _previousNextDirty = false;

  static const double HEIGHT_SPACE_ALBUM_TOP = 100;

  bool _coverRotating = true;

  @override
  void initState() {
    super.initState();
    bool attachToCover = true;
    _needleController = AnimationController(
        vsync: this,
        value: attachToCover ? 1.0 : 0.0,
        duration: Duration(milliseconds: 500),
        animationBehavior: AnimationBehavior.normal);

    _needleAnimation = Tween<double>(begin: -1 / 12, end: 0)
        .chain(CurveTween(curve: Curves.easeInOut))
        .animate(_needleController);

    _currentMusic = widget.music;

    musicManager.addListener(_onMusicStateChanged);
    _previousMusic = musicManager.getPre();
    _nextMusic = musicManager.getNext();
  }

  void _onMusicStateChanged() {
//    print("_onMusicStateChanged");
    setState(() {
      _coverRotating = _needleAttachCover;
    });

    bool attachToCover = !_beDragging && _translateController == null;
    print("[_onMusicStateChanged]_rotateNeedle $attachToCover");
    _rotateNeedle(attachToCover);
  }

  @override
  void didUpdateWidget(AlbumCover oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (_currentMusic == widget.music) {
      if (_previousNextDirty) {
        print("[didUpdateWidget] will get _previous music");
        _previousNextDirty = false;
        _previousMusic = musicManager.getPre();
        _nextMusic = musicManager.getNext();
        if (mounted) {
          setState(() {});
        }
      }
      return;
    }else {
      print("[didUpdateWidget]_currentMusic != widget.music ");
    }

    _rotateNeedle(false);

    setState(() {
      double offset = 0;
      if (widget.music == _previousMusic) {
        offset = MediaQuery.of(context).size.width;
      } else if (widget.music == _nextMusic) {
        offset = -MediaQuery.of(context).size.width;
      }

      _animateCoverTranslateTo(offset, onCompleted: () {
        _converTranslateX = 0;
        _currentMusic = widget.music;
        _previousNextDirty = false;

        () async {
          _nextMusic = musicManager.getNext();
          _previousMusic = musicManager.getPre();
          if (mounted) {
            setState(() {});
          }
        }();
      });
    });
  }

  @override
  void dispose() {
    musicManager.removeListener(_onMusicStateChanged);
    print("_needleController dispose");
    _needleController.dispose();
    _translateController?.dispose();
    _translateController = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
//    print("[_AlbumCoverState- build]");
    return Stack(
      children: <Widget>[
        GestureDetector(
          onHorizontalDragStart: (detail) {
            _beDragging = true;
            _rotateNeedle(false);
          },
          onHorizontalDragUpdate: (detail) {
            if (_beDragging) {
              setState(() {
                _converTranslateX += detail.primaryDelta;
              });
            }
          },
          onHorizontalDragEnd: (detail) {

            print("[onHorizontalDragEnd] onHorizontalDragEnd");

            final vThreashold =
                1.0 / (0.050 * MediaQuery.of(context).devicePixelRatio);
            final sameDirection =
                (_converTranslateX > 0 && detail.primaryVelocity > 0) ||
                    (_converTranslateX < 0 && detail.primaryVelocity < 0);

            if (_converTranslateX.abs() >
                    MediaQuery.of(context).size.width / 2 ||
                (sameDirection && detail.primaryVelocity.abs() > vThreashold)) {
              var des = MediaQuery.of(context).size.width;
              if (_converTranslateX < 0) {
                des = -des;
              }

              _animateCoverTranslateTo(des, onCompleted: () {
                setState(() {
                  _converTranslateX = 0;
                  if (des > 0) {
                    print(
                        "[onHorizontalDragEnd] onHorizontalDragEnd, _previousMusic");
                    _currentMusic = _previousMusic;
                    musicManager.playPre();
                  } else {
                    print(
                        "[onHorizontalDragEnd] onHorizontalDragEnd, _nextMusic");
                    _currentMusic = _nextMusic;
                    musicManager.playNext();
                  }

                  _previousNextDirty = true;
                });
              });
            } else {
              print("[onHorizontalDragEnd] onHorizontalDragEnd, "
                  "_animateCoverTranslateTo to 0");
              _animateCoverTranslateTo(0);
            }

            //TODO 这里是模拟正常播放，直接把唱针贴到到黑胶唱片上
//            _rotateNeedle(true);
            _beDragging = false;
          },
          child: Container(
            color: Colors.transparent,
            padding: EdgeInsets.only(
                left: 64, right: 64, top: HEIGHT_SPACE_ALBUM_TOP),
            child: Stack(
              children: <Widget>[
                Transform.scale(
                  scale: 1.035,
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: ClipOval(
                      child: Container(color: Colors.white10),
                    ),
                  ),
                ),
                Transform.translate(
                  offset: Offset(
                      _converTranslateX - MediaQuery.of(context).size.width, 0),
                  child: _RotationCoverImage(
                      rotating: false, music: _previousMusic),
                ),
                Transform.translate(
                  offset: Offset(_converTranslateX, 0),
                  child: _RotationCoverImage(
                      rotating: _coverRotating && !_beDragging,
                      music: _currentMusic),
                ),
                Transform.translate(
                  offset: Offset(
                      _converTranslateX + MediaQuery.of(context).size.width, 0),
                  child:
                      _RotationCoverImage(rotating: false, music: _nextMusic),
                ),
              ],
            ),
          ),
        ),
        ClipRect(
          child: Container(
            child: Align(
              alignment: Alignment(0, -1),
              child: Transform.translate(
                offset: Offset(40, -15),
                child: RotationTransition(
                  turns: _needleAnimation,
                  alignment: //移动旋转的中心点从唱针的中心到顶圆心
                      //44,37 是针尾的圆形的中心点像素坐标, 273,402是playing_page_needle.png的宽高
                      //所以对此计算旋转中心点的偏移,以保重旋转动画的中心在针尾圆形的中点
                      const Alignment(-1 + 44 * 2 / 273, -1 + 37 * 2 / 402),
                  child: Image.asset(
                    "assets/playing_page_needle.png",
                    height: HEIGHT_SPACE_ALBUM_TOP * 1.8,
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  void _rotateNeedle(bool attachToCover) {
    if (_needleAttachCover == attachToCover) {
      return;
    }
    _needleAttachCover = attachToCover;
    if (attachToCover) {
      print("_needleController.forward ${_needleController.value}");
      _needleController.forward(from: _needleController.value);
    } else {
      print("_needleController.reverse ${_needleController.value}");
      _needleController.reverse(from: _needleController.value);
    }
  }

  void _animateCoverTranslateTo(double des, {void onCompleted()}) {
    _translateController?.dispose();
    _translateController = null;
    _translateController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    final animation =
        Tween(begin: _converTranslateX, end: des).animate(_translateController);
    animation.addListener(() {
      setState(() {
        _converTranslateX = animation.value;
      });
    });
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _translateController?.dispose();
        _translateController = null;
        if (onCompleted != null) {
          onCompleted();
        }
      }
    });
    _translateController.forward();
  }
}

class _RotationCoverImage extends StatefulWidget {
  final bool rotating;
  final Music music;

  _RotationCoverImage({Key key, @required this.rotating, @required this.music})
      : assert(rotating != null),
        super(key: key) {
//    print("rotaing =$rotating");
  }

  @override
  State<StatefulWidget> createState() {
    return _RotationCoverImageState();
  }
}

class _RotationCoverImageState extends State<_RotationCoverImage>
    with TickerProviderStateMixin {
  //album cover rotation
  double rotation = 0;

  //album cover rotation animation
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this,
        duration: Duration(seconds: 20),
        animationBehavior: AnimationBehavior.normal)
      ..addListener(() {
        setState(() {
          rotation = controller.value * 2 * pi;
//          print("[initState]$this calc rotaion = $rotation");
        });
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed && controller.value == 1) {
          controller.forward(from: 0);
        }
      });

//    if (widget.rotating) {
//      controller.forward(from: controller.value);
//    }
  }

  @override
  void didUpdateWidget(_RotationCoverImage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.rotating) {
//      print(
//          "[didUpdateWidget]$this widget.rotaing true, call controller.forward(from: "
//          "${controller.value}");
      controller.forward(from: controller.value);
    } else {
//      print("$this controller.stop()");
      controller.stop();
    }

    if (widget.music != oldWidget.music) {
      controller.value = 0;
    }
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ImageProvider image;
    if (widget.music == null || widget.music.ablumCoverImg == null) {
      image = AssetImage("assets/playing_page_disc.png");
    } else {
      image = CachedImage(widget.music.ablumCoverImg);
    }

    return Transform.rotate(
      angle: rotation,
      child: Material(
        elevation: 3,
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(500),
        clipBehavior: Clip.antiAlias,
        child: AspectRatio(
          aspectRatio: 1,
          child: Container(
              foregroundDecoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/playing_page_disc.png"))),
              padding: EdgeInsets.all(30),
              child: Stack(
                children: <Widget>[
//                  ClipOval(
//                    child: Image(
//                      image: image,
//                      fit: BoxFit.cover,
//                    ),
//                  ),
                  Center(
                      child: Text(
                    widget.music.title,
                    style: TextStyle(fontSize: 20),
                  )),
                ],
              )),
        ),
      ),
    );
  }
}
