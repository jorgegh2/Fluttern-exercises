import 'package:task1jorgegemasherencia/plant.dart';

class PlantList
{
  List<Plant> _plantList;

  int Count() => _plantList.length;
  Plant GetPlantByIndex(int index) => _plantList[index];
  bool AddPlant(Plant plant) 
  {
    _plantList.add(plant);
  }
}