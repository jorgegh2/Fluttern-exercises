import 'package:flutter/material.dart';
import 'package:task1jorgegemasherencia/Pages/FavoriteListPage.dart';
import 'package:task1jorgegemasherencia/Pages/PlantPage.dart';
import 'package:task1jorgegemasherencia/plant.dart';

class PlantListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          FlatButton(
            shape: CircleBorder(),
            child: Icon(
              Icons.favorite,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => FavoriteListPage(),
                ),
              );
            },
          ),
        ],
        title: Text("Herbs"),
        backgroundColor: Colors.green,
      ),
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
                  child: PlantPreview(
                    plantList: _plantList,
                    index: index,
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
    );
  }
}

class PlantPreview extends StatelessWidget {
  const PlantPreview({
    Key key,
    @required List<Plant> plantList,
    @required int index,
  })  : _plantList = plantList,
        _index = index,
        super(key: key);

  final List<Plant> _plantList;
  final int _index;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Image.asset(_plantList[_index].plantURL),
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
              child: Title(
                titleName: "Family:",
              ),
            ),
            Title(
              titleName: "Used Part:",
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
              child: Subtitle(
                subtitleText: _plantList[_index].familyDescription,
              ),
            ),
            Container(
              width: 80,
              child: Subtitle(
                subtitleText: _plantList[_index].usedPartDescription,
              ),
            ),
          ],
        )
      ],
    );
  }
}

class Subtitle extends StatelessWidget {
  final String subtitleText;
  Subtitle({@required this.subtitleText});

  @override
  Widget build(BuildContext context) {
    return Text(
      //Title 1
      subtitleText,
      style: TextStyle(
        fontSize: 11,
        color: Colors.grey,
      ),
    );
  }
}

class Title extends StatelessWidget {
  String titleName;

  Title({@required this.titleName});

  @override
  Widget build(BuildContext context) {
    return Text(
      titleName,
      style: TextStyle(
        fontSize: 12,
        color: Colors.green,
        fontWeight: FontWeight.bold,
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
