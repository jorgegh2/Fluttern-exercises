import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(
    CollapsableTextApp(),
  );
}

class Semaforo extends StatelessWidget {
  const Semaforo({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text(
            'Semaphore',
          ),
        ),
        body: Center(
          child: Container(
            width: 150,
            height: 300,
            color: Colors.black,
            child: Column(
              children: <Widget>[
                Circle(Colors.red),
                Circle(Colors.yellow),
                Circle(Colors.green),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Circle extends StatelessWidget {
  final Color color;
  Circle(this.color);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: this.color,
        ),
      ),
    );
  }
}

class App extends StatelessWidget {
  const App({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text(
            'Semaphore',
          ),
        ),
        body: Column(
          children: <Widget>[
            Box(2, '20%', Colors.pink),
            Box(3, '30%', Colors.purple),
            Box(5, '50%', Colors.blue[900]),
          ],
        ),
      ),
    );
  }
}

class Box extends StatelessWidget {
  final int flex;
  final String texto;
  final Color color;

  Box(this.flex, this.texto, this.color);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Expanded(
      child: Container(
        color: this.color,
        child: Center(
          child: Text(
            this.texto,
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
        ),
      ),
      flex: this.flex,
    ));
  }
}

class Calendario extends StatelessWidget {
  const Calendario({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                CalendaryDay(number_day: 14, name_day: 'Fri'),
                CalendaryDay(number_day: 15, name_day: 'Sat'),
                CalendaryDay(number_day: 16, name_day: 'Sun', selected: true),
                CalendaryDay(number_day: 17, name_day: 'Mon'),
                CalendaryDay(number_day: 18, name_day: 'Tue'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CalendaryDay extends StatelessWidget {
  final int number_day;
  final String name_day;
  final bool selected;

  CalendaryDay({this.number_day, this.name_day, this.selected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 125,
      padding: EdgeInsets.only(top: 20, bottom: 20),
      decoration: ShapeDecoration(
        shape: StadiumBorder(),
        color: (selected ? Colors.blue : Colors.white),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            "$number_day",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: (selected ? Colors.white : null),
            ),
          ),
          Text(
            name_day,
            style: TextStyle(
              fontSize: 20,
              color: (selected ? Colors.white : Colors.grey[400]),
            ),
          )
        ],
      ),
    );
  }
}

class CollapsableTextApp extends StatelessWidget {
  const CollapsableTextApp({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: CollapsableText(
            text:
                ("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla ullamcorper blandit felis, ac eleifend tellus tempus eu. Aliquam rutrum lacinia scelerisque. Curabitur suscipit pharetra posuere. Suspendisse non egestas lectus. Suspendisse justo elit, pulvinar in sem et, varius facilisis leo. Proin feugiat, purus non auctor commodo, arcu felis lobortis turpis, ac sagittis augue risus et urna. Vivamus a arcu nunc. Aliquam facilisis laoreet lorem, non semper lacus. Proin est est, ultrices eget metus nec, viverra lobortis ligula. Duis eu erat eget mauris laoreet tincidunt. Morbi porta at lectus vitae venenatis. Aliquam a augue porta orci blandit rhoncus. "),
          ),
        ),
      ),
    );
  }
}

class CollapsableText extends StatefulWidget {
  final String text;
  CollapsableText({this.text});

  @override
  State<StatefulWidget> createState() => _CollapsableTextState();
}

class _CollapsableTextState extends State<CollapsableText> {
  bool show = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
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
            child: Text(show ? "More!": "Less!"),
          )
        ],
      ),
      width: 150,
      color: Colors.grey[300],
            
    );
  }
}
