class Albums {
  int id;
  String title;
  String url;
  String thumbnail;

  Albums({this.id, this.title, this.url, this.thumbnail});

  factory Albums.getData(Map<String, dynamic> json) {
    return Albums(
        id: json["id"],
        title: json["title"],
        url: json["url"],
        thumbnail: json["thumbnail"]);
  }
}
