import 'package:json_annotation/json_annotation.dart';

class PlayerModel {
  PlayerModel(this.name, this.captain);

  String name;
  bool captain;

  factory PlayerModel.fromJson(Map<String, dynamic> json) =>
      PlayerModel(json['name'], json['captain'] ?? false);

  @override
  String toString() {
    return name + " : cap? - $captain";
  }
}
