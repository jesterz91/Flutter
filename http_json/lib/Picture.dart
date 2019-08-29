class Photo {
  String author;
  String download_url;
  int height;
  String id;
  String url;
  int width;

  Photo({this.author, this.download_url, this.height, this.id, this.url, this.width});

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      author: json['author'],
      download_url: json['download_url'],
      height: json['height'],
      id: json['id'],
      url: json['url'],
      width: json['width'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['author'] = this.author;
    data['download_url'] = this.download_url;
    data['height'] = this.height;
    data['id'] = this.id;
    data['url'] = this.url;
    data['width'] = this.width;
    return data;
  }

  @override
  String toString() => "image : $download_url";

}