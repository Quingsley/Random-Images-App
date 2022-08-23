import 'dart:math';

class ImageModel {
  var url = '';
  var likes = 0;
  var link = '';
  var counter = 0 + Random().nextInt(10 - 0);
  ImageModel(this.url);
  ImageModel.fromJson(var parsedJson) {
    url = parsedJson[counter]['urls']['regular'];
    likes = parsedJson[counter]["likes"];
    link = parsedJson[counter]['links']['html'];
  }
  @override
  String toString() {
    return '$likes';
  }
}
