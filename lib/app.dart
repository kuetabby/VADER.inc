import 'package:flutter/material.dart';

import 'albums/albums_page.dart';
import 'monsters/monsters_page.dart';

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
