import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:monsters_inc/monsters/monsters_model.dart';

Future<List<Monsters>> fetchMonsters() async {
  String apiUrl = "https://jsonplaceholder.typicode.com/users";

  var response = await http.get(apiUrl);
  List<Monsters> monsters = [];

  if (response.statusCode == 200) {
    var responseData = json.decode(response.body) as List;
    monsters = responseData.map((data) => Monsters.getData(data)).toList();
    return monsters;
  } else {
    return throw Exception('Failed to load Users');
  }
}

class MonstersPage extends StatefulWidget {
  @override
  _MonstersPageState createState() => _MonstersPageState();
}

class _MonstersPageState extends State<MonstersPage> {
  Future<List<Monsters>> futureMonsters;

  void initState() {
    super.initState();
    futureMonsters = fetchMonsters();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: futureMonsters,
      builder: (context, item) {
        if (item.hasData) {
          return listViewWidget(item.data);
        }
        return loadingIndicator();
      },
    );
  }

  Widget listViewWidget(List<Monsters> users) {
    return ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, data) {
          return Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
                color: Colors.lightBlue[200],
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: Colors.purple,
                )),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Image.network(
                    "https://robohash.org/${users[data].id}?set=set2"),
                Text("Name: ${users[data].name}"),
                Text("Email: ${users[data].email}")
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
}
