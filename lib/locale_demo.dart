import 'package:flutter/material.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static const String _title = 'LocaleDemo Sample';

  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      supportedLocales: [
        const Locale('en', 'US'), // 美国英语
        const Locale('zh', 'CN'), // 中文简体
      ],

      localizationsDelegates: [
        // 本地化的代理类
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      home: Scaffold(
          appBar: AppBar(
            title: Text("WrapDemo"),
          ),
          body: des
      ),
    );
  }

  Widget des = null;
}

