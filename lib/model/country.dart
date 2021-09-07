import 'package:country_player_app/model/player.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable(explicitToJson: true)
class CountryModel {
  CountryModel(this.name, this.playerList);

  String name;
  List<PlayerModel> playerList;

  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$UserFromJson()` constructor.
  /// The constructor is named after the source class, in this case, User.
  factory CountryModel.decodedJson(String name, List playerList) {
    var playerData = playerList
        .map<dynamic>((e) => PlayerModel.fromJson(e as Map<String, dynamic>));
    return CountryModel(name, playerData as List<PlayerModel>);
  }

  @override
  String toString() {
    return name + " : size - " + playerList.length.toString();
  }
}
