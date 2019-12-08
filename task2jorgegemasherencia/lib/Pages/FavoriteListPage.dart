import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task1jorgegemasherencia/Pages/PlantListPage.dart';
import 'package:task1jorgegemasherencia/Pages/PlantPage.dart';
import 'package:task1jorgegemasherencia/PlantList.dart';

class FavoriteListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    PlantList favorites = Provider.of<PlantList>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "My Favorites",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 5,
          crossAxisCount: 2,
        ),
        itemCount: favorites.count(),
        itemBuilder: (context, index) {
          return Card(
            shape: Border(),
            child: InkWell(
              child: PlantPreview(
                plantList: favorites.getlist(),
                index: index,
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => PlantPage(favorites.getPlantByIndex(index)),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
