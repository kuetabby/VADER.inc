import 'package:flutter/material.dart';
import 'package:monsters_inc/app.dart';

void main() => runApp(Main());

class Main extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(125),
              child: AppBar(
                title: Text('VADER inc'),
                flexibleSpace: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Color(0xff0096ff), Color(0xff6610f2)],
                          begin: FractionalOffset.topLeft,
                          end: FractionalOffset.bottomRight)),
                ),
                bottom: TabBar(
                  tabs: <Widget>[
                    Tab(
                      icon: Icon(Icons.android),
                      text: "Monsters",
                    ),
                    Tab(
                      icon: Icon(Icons.image),
                      text: "Albums",
                    )
                  ],
                ),
              ),
            ),
            body: App()),
      ),
    );
  }
}
