import 'package:flutter/material.dart';
import 'package:task1jorgegemasherencia/plant.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

class PlantList with ChangeNotifier
{
  List<Plant> _plantList = [];

  PlantList();
  int Count() => _plantList.length;
  Plant GetPlantByIndex(int index) => _plantList[index];
  bool AddPlant(Plant plant) 
  {
    _plantList.add(plant);
    notifyListeners();
  }
  bool Find(Plant plant)
  {
    for(int i = 0; i < _plantList.length; ++i)
    {
      if(_plantList[i].plantName == plant.plantName)
      {
        return true;
      }
    }

    return false;
  }

  int FindId(Plant plant)
  {
     for(int i = 0; i < _plantList.length; ++i)
    {
      if(_plantList[i].plantName == plant.plantName)
      {
        return i;
      }
    }

    return -1;
  }

  void RemovePlantId(int plantId)
  {
    _plantList.removeAt(plantId);
    notifyListeners();
  }
}

Future<PlantList> loadFavorites() async {
    String jsonString = await rootBundle.loadString('assets/favorites.json');
    List json = jsonDecode(jsonString);
    PlantList plantLoaded = PlantList();
    for(var currentElement in json)
    {
      plantLoaded.AddPlant(Plant.fromJSON(currentElement));
    }
    return plantLoaded;
  }