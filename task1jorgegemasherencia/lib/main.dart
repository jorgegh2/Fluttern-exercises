import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[200],
        body: Scrollbar(
          child: ListView(
            children: <Widget>[
              Center(
                child: Stack(
                  alignment: AlignmentDirectional.topCenter,
                  children: <Widget>[
                    BoxInit(),
                    PlantCircle(),
                    SizedBox(
                      height: 310,
                    )
                  ],
                ),
              ),
              TextBox(
                title: "Description",
                text:
                    "Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test",
              ),
              TextBox(
                title: "Nutritional Value",
                text:
                    "jhuddifdjfdjifdjisdfijdifjdjfjfjfjfjfjjfjfjhuddifdjfdjifdjisdfijdifjdjfjfjfjfjfjjfjfjhuddifdjfdjifdjisdfijdifjdjfjfjfjfjfjjfjfjhuddifdjfdjifdjisdfijdifjdjfjfjfjfjfjjfjfjhuddifdjfdjifdjisdfijdifjdjfjfjfjfjfjjfjfjhuddifdjfdjifdjisdfijdifjdjfjfjfjfjfjjfjfjhuddifdjfdjifdjisdfijdifjdjfjfjfjfjfjjfjfjhuddifdjfdjifdjisdfijdifjdjfjfjfjfjfjjfjfjhuddifdjfdjifdjisdfijdifjdjfjfjfjfjfjjfjfjhuddifdjfdjifdjisdfijdifjdjfjfjfjfjfjjfjfjhuddifdjfdjifdjisdfijdifjdjfjfjfjfjfjjfjfjhuddifdjfdjifdjisdfijdifjdjfjfjfjfjfjjfjfjhuddifdjfdjifdjisdfijdifjdjfjfjfjfjfjjfjfjhuddifdjfdjifdjisdfijdifjdjfjfjfjfjfjjfjfjhuddifdjfdjifdjisdfijdifjdjfjfjfjfjfjjfjfjhuddifdjfdjifdjisdfijdifjdjfjfjfjfjfjjfjfjhuddifdjfdjifdjisdfijdifjdjfjfjfjfjfjjfjfjhuddifdjfdjifdjisdfijdifjdjfjfjfjfjfjjfjfjhuddifdjfdjifdjisdfijdifjdjfjfjfjfjfjjfjf",
              ),
            ],
          ),
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
                Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 5),
                      child: Text(
                        widget.title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.green,
                        ),
                      ),
                    ),
                    Icon(Icons.content_copy),
                    SizedBox(width: 10,),
                    VerticalDivider(color: Colors.grey, indent: 10,),
                    SizedBox(width: 10,),
                    Icon(Icons.share),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
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
                        maxLines: show ? 5 : null,
                      ),
                      FlatButton(
                        onPressed: () {
                          setState(() {
                            show = !show;
                          });
                        },
                        child: Text(
                          show ? "more.." : "less..",
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

class BoxInit extends StatelessWidget {
  const BoxInit({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 50,
      child: Container(
        padding: EdgeInsets.all(10),
        width: 375,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(children: <Widget>[Icon(Icons.warning), Icon(Icons.attach_file)],),
            SizedBox(
              height: 100,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextCamp(
                  textBold: "Family:",
                  description: "Rubiaceae",
                ),
                TextCamp(
                  textBold: "Other Name:",
                  description:
                      "Aromatic madder, Bengal madder, Indian madder, Madderwort, Rubia root, Munjeet",
                ),
                TextCamp(
                  textBold: "Used Part:",
                  description: "Roots, Leaves, Stems",
                ),
              ],
            ),
          ],
        ),
        color: Colors.white,
      ),
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
  const PlantCircle({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Container(
            height: 100,
            width: 100,
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
                  width: 92,
                  height: 92,
                  decoration: ShapeDecoration(
                    shape: CircleBorder(),
                    color: Colors.green[200],
                  ),
                 child: Image.asset('assets/CircleImage.jpg'),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Indian Madder",
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
