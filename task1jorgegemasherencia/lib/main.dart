import 'package:flutter/material.dart';

/*https://dribbble.com/shots/7423743-Laborati-Ginori*/
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        backgroundColor: Colors.grey[300],
        body: Center(
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: <Widget>[
              Positioned(
                top: 50,
                child: Container(
                  width: 375,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 100,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          TextCamp(textBold: "Family:", description: "Rubiaceae",),
                          TextCamp(textBold: "Other Name:", description: "Aromatic madder, Bengal madder, Indian madder, Madderwort, Rubia root, Munjeet",),
                          TextCamp(textBold: "Used Part:", description: "Roots, Leaves, Stems",),
                        ],
                      ),
                    ],
                  ),
                  color: Colors.white,
                ),
              ),
              PlantCircle(),
            ],
          ),
        ),
      ),
    );
  }
}

class TextCamp extends StatelessWidget {
  final String textBold;
  final String description;

  TextCamp({this.textBold,this.description});

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
          /* Stack(
            children: <Widget>[
              Container(
                width: 50,
                height: 50,
                color: Colors.red,
              ),
              Positioned(
                child: Container(
                  width: 20,
                  height: 20,
                  color: Colors.blue,
                ),
                //top: 15,
              )
            ],
          )*/
        ],
      ),
    );
  }
}
