import 'package:country_player_app/model/country.dart';
import 'package:country_player_app/model/player.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  SecondScreen({required this.countryModel, Key? key}) : super(key: key);
  final CountryModel countryModel;
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  void sortByFirstName() {
    setState(() {
      this
          .widget
          .countryModel
          .playerList
          .sort((a, b) => a.name.compareTo(b.name));
    });
  }

  void sortByLastName() {
    setState(() {
      this
          .widget
          .countryModel
          .playerList
          .sort((a, b) => a.name.split(" ")[1].compareTo(b.name.split(" ")[1]));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(this.widget.countryModel.name),
        actions: [
          PopupMenuButton<String>(
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                    value: "first", child: Text("Sort By First Name")),
                PopupMenuItem(value: "last", child: Text("Sort By Last Name")),
              ];
            },
            onSelected: (value) {
              switch (value) {
                case 'first':
                  sortByFirstName();
                  break;
                case 'last':
                  sortByLastName();
                  break;
              }
            },
          ),
        ],
      ),
      body: ListView.separated(
        itemCount: this.widget.countryModel.playerList.length,
        itemBuilder: (context, index) {
          bool isCaptain = this.widget.countryModel.playerList[index].captain;
          return Container(
            height: 50.0,
            alignment: Alignment.center,
            child: Text(
              this.widget.countryModel.playerList[index].name,
              style: TextStyle(
                  fontSize: isCaptain ? 20.0 : 16.0,
                  fontWeight: isCaptain ? FontWeight.w900 : FontWeight.normal),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return Text("");
        },
      ),
    );
  }
}
