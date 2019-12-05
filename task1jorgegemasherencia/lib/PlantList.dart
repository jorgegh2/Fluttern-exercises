import 'package:task1jorgegemasherencia/plant.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

class PlantList
{
  List<Plant> _plantList = [];

  PlantList();
  int Count() => _plantList.length;
  Plant GetPlantByIndex(int index) => _plantList[index];
  bool AddPlant(Plant plant) 
  {
    _plantList.add(plant);
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
}

Future<PlantList> loadFavorites() async {
    String jsonString = await rootBundle.loadString('assets/test.json');
    List json = jsonDecode(jsonString);
    PlantList plantLoaded = PlantList();
    for(var currentElement in json)
    {
      plantLoaded.AddPlant(Plant.fromJSON(currentElement));
    }
    return plantLoaded;
  }