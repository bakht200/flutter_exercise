// To parse this JSON data, do
//
//     final verticalimage = verticalimageFromJson(jsonString);

import 'dart:convert';

List<Verticalimage> verticalimageFromJson(String str) =>
    List<Verticalimage>.from(
        json.decode(str).map((x) => Verticalimage.fromJson(x)));

String verticalimageToJson(List<Verticalimage> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Verticalimage {
  Verticalimage({
    this.id,
    this.author,
    this.width,
    this.height,
    this.url,
    this.downloadUrl,
  });

  String? id;
  String? author;
  int? width;
  int? height;
  String? url;
  String? downloadUrl;

  factory Verticalimage.fromJson(Map<String, dynamic> json) => Verticalimage(
        id: json["id"],
        author: json["author"],
        width: json["width"],
        height: json["height"],
        url: json["url"],
        downloadUrl: json["download_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "author": author,
        "width": width,
        "height": height,
        "url": url,
        "download_url": downloadUrl,
      };
}
