import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task1jorgegemasherencia/Pages/PlantListPage.dart';
import 'package:task1jorgegemasherencia/PlantList.dart';

void main() => runApp(PlantInfo());

class PlantInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: loadFavorites(),
        builder: (context, AsyncSnapshot<PlantList> snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          return ChangeNotifierProvider<PlantList>(
            builder: (_) => snapshot.data,
            child: MaterialApp(
              home: PlantListPage(),
            ),
          );
        });
  }
}

//class Pr extends StatelessWidget {
//  const Pr({
//    Key key,
//  }) : super(key: key);
//
//  @override
//  Widget build(BuildContext context) {
//    return ChangeNotifierProvider<PlantList>(
//      builder: (_) => Provider.of<PlantList>(context),
//      child: MaterialApp(
//        home: PlantListPage(),
//      ),
//    );
//  }
//}
