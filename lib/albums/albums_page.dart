import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'albums_model.dart';

Future<List<Albums>> fetchAlbums() async {
  String apiUrl = "https://jsonplaceholder.typicode.com/photos";

  var response = await http.get(apiUrl);
  List<Albums> albums = [];

  if (response.statusCode == 200) {
    var responseData = json.decode(response.body) as List;
    albums = responseData.map((data) => Albums.getData(data)).toList();
    return albums;
  } else {
    return throw Exception('Failed to load Albums');
  }
}

class AlbumsPage extends StatefulWidget {
  @override
  _AlbumsPageState createState() => _AlbumsPageState();
}

class _AlbumsPageState extends State<AlbumsPage> {
  Future<List<Albums>> futureAlbums;

  void initState() {
    super.initState();
    futureAlbums = fetchAlbums();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: futureAlbums,
        builder: (context, item) {
          if (item.hasData) {
            return listViewWidget(item.data);
          }
          return loadingIndicator();
        });
  }

  Widget listViewWidget(List<Albums> albums) {
    return ListView.builder(itemBuilder: (context, data) {
      return Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Colors.purple),
            color: Color(0xff6610f2)),
        child: Column(
          children: <Widget>[
            Image.network(albums[data].url),
            textWidget(albums[data].title)
          ],
        ),
      );
    });
  }

  Widget loadingIndicator() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget textWidget(String text) {
    return Text(
      text,
      style: TextStyle(color: Colors.white),
    );
  }
}
