import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:task1jorgegemasherencia/plant.dart';
import 'dart:convert';

class PlantList with ChangeNotifier {
  List<Plant> _favoriteList = [];

  PlantList();
  int count() => _favoriteList.length;
  Plant getPlantByIndex(int index) => _favoriteList[index];
  void addPlant(Plant plant) {
    _favoriteList.add(plant);
    notifyListeners();
    saveFavorites();
  }

  bool find(Plant plant) {
    for (int i = 0; i < _favoriteList.length; ++i) {
      if (_favoriteList[i].plantName == plant.plantName) {
        return true;
      }
    }

    return false;
  }

  int findId(Plant plant) {
    for (int i = 0; i < _favoriteList.length; ++i) {
      if (_favoriteList[i].plantName == plant.plantName) {
        return i;
      }
    }

    return -1;
  }

  void removePlantId(int plantId) {
    _favoriteList.removeAt(plantId);
    notifyListeners();
    saveFavorites();
  }

  List<Plant> getlist() {
    return _favoriteList;
  }

  Future<void> saveFavorites() async {
    Directory dir = await getApplicationDocumentsDirectory();
    File file = File('${dir.path}/favorites.json');
    var json = jsonEncode(_favoriteList);
    await file.writeAsString(json);
  }
}

Future<PlantList> loadFavorites() async {
  //String jsonString = await rootBundle.loadString('assets/favorites.json'); // with this i don't know how to write in the save method the same file.
  Directory dir = await getApplicationDocumentsDirectory();
  File file = File('${dir.path}/favorites.json');
  List json = jsonDecode(await file.readAsString() /*jsonString*/);
  PlantList plantLoaded = PlantList();
  for (var currentElement in json) {
    plantLoaded.addPlant(Plant.fromJSON(currentElement));
  }
  return plantLoaded;
}
