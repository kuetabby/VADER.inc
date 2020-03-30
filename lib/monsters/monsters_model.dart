class Monsters {
  String id;
  String name;
  String email;

  Monsters({this.id, this.name, this.email});

  factory Monsters.getData(Map<String, dynamic> json) {
    return Monsters(
        id: json["id"].toString(), name: json["name"], email: json["email"]);
  }
}
