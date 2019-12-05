import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task1jorgegemasherencia/Pages/PlantListPage.dart';
import 'package:task1jorgegemasherencia/PlantList.dart';
import 'package:task1jorgegemasherencia/plant.dart';

void main() => runApp(PlantInfo());

class PlantInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureProvider<List<Plant>>( //<ListPlant>
      builder: (_) => loadPlants(),//load favorites 
      initialData: null,
      child: MaterialApp(
      home: PlantListPage(),
    )
    );
  }
}
