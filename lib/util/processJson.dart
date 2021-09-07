import 'dart:convert';

import 'package:country_player_app/model/country.dart';
import 'package:country_player_app/model/player.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

List<CountryModel> processData(AsyncSnapshot<Response> snap) {
  List<CountryModel> countryListData = List.empty(growable: true);
  var jsonString = snap.data!.body;
  Map<String, dynamic> allCountryData = jsonDecode(jsonString);

  allCountryData.forEach((key, value) {
    List<PlayerModel> playerList = List.empty(growable: true);
    List data = value;
    data.forEach((element) => playerList.add(PlayerModel.fromJson(element)));
    countryListData.add(CountryModel(key, playerList));
  });
  countryListData.sort((a, b) => a.name.compareTo(b.name));
  return countryListData;
}
