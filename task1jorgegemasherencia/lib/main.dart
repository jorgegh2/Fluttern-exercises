import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task1jorgegemasherencia/Pages/PlantListPage.dart';
import 'package:task1jorgegemasherencia/PlantList.dart';

void main() => runApp(PlantInfo());

class PlantInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureProvider<PlantList>( 
      builder: (_) => loadFavorites(), 
      initialData: null,
      child: MaterialApp(
      home: PlantListPage(),
    )
    );
  }
}
