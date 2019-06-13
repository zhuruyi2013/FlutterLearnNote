import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CustomWidget(),
    );
  }
}

class CustomWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          title: Text("App Bar"),
            pinned: true,
            floating: false,
            snap: false,
            expandedHeight: 150.0,
            flexibleSpace: const FlexibleSpaceBar(
              title: Text(''),
            ),
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.add_circle),
                tooltip: 'Add new entry',
                onPressed: () {
                  /* ... */
                },
              ),
            ]),
//        SliverGrid(
//          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
//            maxCrossAxisExtent: 200.0,
//            mainAxisSpacing: 10.0,
//            crossAxisSpacing: 10.0,
//            childAspectRatio: 4.0,
//          ),
//          delegate: SliverChildBuilderDelegate(
//            (BuildContext context, int index) {
//              return Container(
//                alignment: Alignment.center,
//                color: Colors.teal[100 * (index % 9)],
//                child: Text('grid item $index'),
//              );
//            },
//            childCount: 20,
//          ),
//        ),
        SliverFixedExtentList(
          itemExtent: 50.0,
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Container(
                alignment: Alignment.center,
                color: Colors.lightBlue[100 * (index % 9)],
                child: Text('list item $index'),
              );
            },
          ),
        ),
      ],
    );
  }
}
