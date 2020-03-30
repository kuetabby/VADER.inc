import 'package:flutter/material.dart';
import 'package:monsters_inc/albums/albums_page.dart';
import 'package:monsters_inc/monsters/monsters_page.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TabBarView(
        children: <Widget>[MonstersPage(), AlbumsPage()],
      ),
    );
  }
}
