import 'package:flutter/material.dart';
import 'package:task1jorgegemasherencia/Pages/FavoriteListPage.dart';
import 'package:task1jorgegemasherencia/Pages/PlantPage.dart';
import 'package:task1jorgegemasherencia/plant.dart';

class PlantListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: loadPlants(),
        builder: (context, AsyncSnapshot<List<Plant>> snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          List<Plant> _plantList = snapshot.data;
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 5,
              crossAxisCount: 2,
            ),
            itemCount: _plantList.length,
            itemBuilder: (context, index) {
              return Card(
                shape: Border(),
                child: InkWell(
                  child: Column(
                    children: <Widget>[
                      Image.asset(_plantList[index].plantURL),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: 5,
                          ),
                          Container(
                            width: 80,
                            child: Text(
                              //Title 1
                              "Family:",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Text(
                            //Title 2
                            "Used Part:",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: 5,
                          ),
                          Container(
                            width: 80,
                            child: Text(
                              //Title 1
                              _plantList[index].familyDescription,
                              style: TextStyle(
                                fontSize: 11,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          Container(
                            width: 80,
                            child: Text(
                              //Title 2
                              _plantList[index].usedPartDescription,
                              style: TextStyle(
                                fontSize: 11,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => PlantPage(_plantList[index]),
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.favorite),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => FavoriteListPage(),
            ),
          );
        },
      ),
    );
  }
}

/*ListTile(
                    contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    title: Column(
                      children: <Widget>[
                        Image.asset(_plantList[index].plantURL, fit: BoxFit.cover),
                        Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(left: 5, top: 5),
                              child: Text(
                                "Family:",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 40,
                            ),
                            Text(
                              "Used Part:",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    subtitle: Text("sub text"),
                  ),*/

/*Column(
                    children: <Widget>[
                      Image.asset(_plantList[index].plantURL),
                    ],
                  ),*/
