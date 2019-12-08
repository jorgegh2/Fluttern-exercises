import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task1jorgegemasherencia/PlantList.dart';
import 'package:task1jorgegemasherencia/plant.dart';

class PlantPage extends StatelessWidget {
  final Plant plant;
  PlantPage(this.plant);

  @override
  Widget build(BuildContext context) {
    PlantList favorites = Provider.of<PlantList>(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        textTheme: TextTheme(
          title: TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
        backgroundColor: Colors.white,
        title: Text(
          plant.plantName,
        ),
      ),
      backgroundColor: Colors.grey[200],
      body: Scrollbar(
        child: ListView(
          children: <Widget>[
            Stack(
              overflow: Overflow.visible,
              alignment: AlignmentDirectional.bottomEnd,
              children: <Widget>[
                AspectRatio(
                  aspectRatio: 3 / 2,
                  child: Image.asset(
                    plant.plantURL,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  right: 25,
                  bottom: -25,
                  child: Container(
                    width: 52,
                    height: 52,
                    decoration: ShapeDecoration(
                      shape: CircleBorder(),
                      color: Colors.green,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: 50,
                          height: 50,
                          decoration: ShapeDecoration(
                            shape: CircleBorder(),
                            color: Colors.white,
                          ),
                          child: FlatButton(
                            padding: EdgeInsets.only(left: 0), //Don't know why but without it the icon is not centered.
                            shape: CircleBorder(),
                            child:
                                (favorites.find(plant))
                                    ? Icon(Icons.favorite, color: Colors.red,)
                                    : Icon(Icons.favorite_border),
                            onPressed: () {
                              if (!favorites
                                  .find(plant)) {
                                favorites.addPlant(plant);
                              }
                              else{
                                favorites.removePlantId(favorites.findId(plant));
                              }

                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 25),
            Center(
              child: Stack(
                alignment: AlignmentDirectional.topCenter,
                children: <Widget>[
                  BoxInit(plant),
                  PlantCircle(
                    plantName: plant.plantName,
                    imagePath: plant.plantCircleURL,
                  ),
                  SizedBox(
                    height: 310,
                  )
                ],
              ),
            ),
            TextBox(
              title: "Description",
              text: plant.boxDescription,
            ),
            TextBox(
              title: "Nutritional Value",
              text: plant.boxNutritionalValue,
            ),
            TextBox(
              title: "Health Benefits",
              text: plant.boxHealthBenefits,
            ),
            TextBox(
              title: "Other Uses",
              text: plant.boxOtherUses,
            ),
            TextBox(
              title: "Warnings",
              text: plant.boxWarnings,
            )
          ],
        ),
      ),
    );
  }
}

class TextBox extends StatefulWidget {
  final String title;
  final String text;
  TextBox({@required this.title, @required this.text});

  @override
  State<StatefulWidget> createState() => _TextBoxState();
}

class _TextBoxState extends State<TextBox> {
  bool show = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.only(top: 10),
            width: 375,
            color: Colors.grey[350],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                //Box Header
                Row(
                  children: <Widget>[
                    BoxTitle(widget: widget),
                    Spacer(),
                    BoxIcons(),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                //Box info:
                Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.only(left: 1),
                  width: 373,
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        widget.text,
                        maxLines: show ? null : 10,
                      ),
                      FlatButton(
                        onPressed: () {
                          setState(() {
                            show = !show;
                          });
                        },
                        child: Text(
                          show ? "less.." : "more..",
                          style: TextStyle(color: Colors.green),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BoxTitle extends StatelessWidget {
  const BoxTitle({
    Key key,
    @required this.widget,
  }) : super(key: key);

  final TextBox widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 5),
      child: Text(
        widget.title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
          color: Colors.green,
        ),
      ),
    );
  }
}

class BoxIcons extends StatelessWidget {
  const BoxIcons({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(Icons.content_copy),
        SizedBox(
          width: 10,
        ),
        Container(
          color: Colors.grey,
          width: 1,
          height: 20,
        ),
        SizedBox(
          width: 10,
        ),
        Icon(Icons.share),
        SizedBox(
          width: 10,
        ),
      ],
    );
  }
}

class BoxInit extends StatelessWidget {
  final Plant plant;
  BoxInit(this.plant);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 61,
      child: Container(
        width: 376,
        color: Colors.grey,
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10),
              width: 375,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  BoxInitIcons(),
                  SizedBox(
                    height: 65,
                  ),
                  BoxInitDescription(plant: plant),
                ],
              ),
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}

class BoxInitIcons extends StatelessWidget {
  const BoxInitIcons({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(Icons.warning),
        Spacer(),
        Icon(Icons.attach_file)
      ],
    );
  }
}

class BoxInitDescription extends StatelessWidget {
  const BoxInitDescription({
    Key key,
    @required this.plant,
  }) : super(key: key);

  final Plant plant;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TextCamp(
          textBold: "Family:",
          description: plant.familyDescription,
        ),
        TextCamp(
          textBold: "Other Name:",
          description: plant.otherNameDescription,
        ),
        TextCamp(
          textBold: "Used Part:",
          description: plant.usedPartDescription,
        ),
      ],
    );
  }
}

class TextCamp extends StatelessWidget {
  final String textBold;
  final String description;

  TextCamp({this.textBold, this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 10,
        ),
        Text(
          textBold,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(description),
      ],
    );
  }
}

class PlantCircle extends StatelessWidget {
  final String imagePath;
  final String plantName;

  PlantCircle({@required this.plantName, @required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Container(
            height: 128,
            width: 128,
            decoration: ShapeDecoration(
              shape: CircleBorder(),
              color: Colors.green[300],
            ),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 5,
                ),
                Container(
                  width: 122,
                  height: 122,
                  decoration: ShapeDecoration(
                    shape: CircleBorder(),
                    color: Colors.green[200],
                  ),
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 2),
                        width: 115,
                        height: 115,
                        decoration: ShapeDecoration(
                          shape: CircleBorder(),
                          image: DecorationImage(
                            image: AssetImage(imagePath),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            plantName,
            style: TextStyle(
              color: Colors.green[600],
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
