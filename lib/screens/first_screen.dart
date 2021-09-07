import 'dart:convert';

import 'package:country_player_app/model/country.dart';
import 'package:country_player_app/model/player.dart';
import 'package:country_player_app/screens/second_screen.dart';
import 'package:country_player_app/util/processJson.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  List<CountryModel> countryListData = List.empty(growable: true);
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Country Data"),
      ),
      body: FutureBuilder<Response>(
          future: http.get(Uri.parse("http://test.oye.direct/players.json")),
          builder: (context, snap) {
            if (snap.connectionState == ConnectionState.done) {
              var jsonString = snap.data!.body;
              Map<String, dynamic> allCountryData = jsonDecode(jsonString);

              allCountryData.forEach((key, value) {
                List<PlayerModel> playerList = List.empty(growable: true);
                List data = value;
                data.forEach(
                    (element) => playerList.add(PlayerModel.fromJson(element)));
                countryListData.add(CountryModel(key, playerList));
              });

              if (countryListData.isEmpty)
                return Center(
                  child: Text("No data found"),
                );
              countryListData.sort((a, b) => a.name.compareTo(b.name));
              return Center(
                child: ListView.separated(
                  itemCount: countryListData.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SecondScreen(
                                  countryModel: countryListData[index]))),
                      child: Container(
                        height: 50.0,
                        alignment: Alignment.center,
                        child: Text(
                          countryListData[index].name,
                          style: TextStyle(fontSize: 18.0),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider(
                      height: 50.0,
                    );
                  },
                ),
              );
            }
            return Center(child: CircularProgressIndicator());
          }),
    );
  }
}
