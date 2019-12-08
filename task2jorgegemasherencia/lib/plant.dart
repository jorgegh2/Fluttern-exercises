import 'dart:convert';
import 'package:flutter/services.dart';


class Plant {

  Plant.fromJSON(Map<String, dynamic> jsonElement)
  {
    basicInfoJson = jsonElement["basicInfo"];
    plantName = basicInfoJson["plantName"];
  
    urlsJson = basicInfoJson["URLs"];
    plantURL = urlsJson["plantURL"];
    plantCircleURL = urlsJson["plantCircleURL"];

    descriptionJson = jsonElement["description"];
    familyDescription = descriptionJson["familyDescription"];
    otherNameDescription = descriptionJson["otherNameDescription"];
    usedPartDescription = descriptionJson["usedPartDescription"];

    boxesJson = jsonElement["boxes"];
    boxDescription = boxesJson["boxDescription"];
    boxNutritionalValue = boxesJson["boxNutritionalValue"];
    boxHealthBenefits = boxesJson["boxHealthBenefits"];
    boxOtherUses = boxesJson["boxOtherUses"];
    boxWarnings = boxesJson["boxWarnings"]; 
  }

  Map<String, dynamic> toJson() =>
  {
    'basicInfo' :  basicInfoJson,
    'description' : descriptionJson,
    'boxes' : boxesJson,
  };

  Map<String, dynamic> basicInfoJson, urlsJson, descriptionJson, boxesJson;
  String plantName;
  String plantURL, plantCircleURL;
  String familyDescription, otherNameDescription, usedPartDescription;
  String boxDescription, boxNutritionalValue, boxHealthBenefits, boxOtherUses, boxWarnings;
}

  Future<List<Plant>> loadPlants() async {
    String jsonString = await rootBundle.loadString('assets/plant_list.json');
    List json = jsonDecode(jsonString);
    List<Plant> plantLoaded = [];
    for(var currentElement in json)
    {
      plantLoaded.add(Plant.fromJSON(currentElement));
    }
    return plantLoaded;
  }