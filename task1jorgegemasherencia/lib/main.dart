import 'package:flutter/material.dart';
import 'package:task1jorgegemasherencia/Pages/PlantListPage.dart';
import 'package:task1jorgegemasherencia/plant.dart';

void main() => runApp(PlantInfo());

class PlantInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[200],
        body: PlantListPage(),
      ),
    );
  }
}
