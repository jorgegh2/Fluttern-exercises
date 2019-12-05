import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:task1jorgegemasherencia/Pages/PlantPage.dart';
import 'package:task1jorgegemasherencia/plant.dart';
import 'package:path_provider/path_provider.dart';

class PlantListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: loadPlants(),
        builder: (context, AsyncSnapshot<List<Plant>> snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          List<Plant> _plantList = snapshot.data;
          return ListView.builder(
            itemCount: 2,
            itemBuilder: (context, index) {
              return InkWell(
                child: ListTile(
                  title: Text(_plantList[index].plantName),
                  subtitle: Text("sub text"),
                ),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => PlantPage(_plantList[index]),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
