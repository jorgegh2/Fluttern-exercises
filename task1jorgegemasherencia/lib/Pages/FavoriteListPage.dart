import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task1jorgegemasherencia/Pages/PlantPage.dart';
import 'package:task1jorgegemasherencia/PlantList.dart';

class FavoriteListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    PlantList favorites = Provider.of<PlantList>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorites"),
      ),
      body: ListView.builder(
        itemCount: 2,
        itemBuilder: (context, index) {
          return InkWell(
            child: ListTile(
              title: Text(favorites.GetPlantByIndex(index).plantName),
              subtitle: Text("sub text"),
            ),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => PlantPage(favorites.GetPlantByIndex(index)),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
