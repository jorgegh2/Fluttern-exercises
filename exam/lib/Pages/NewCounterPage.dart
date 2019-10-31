import 'package:exam/DataInfo/CounterClass.dart';
import 'package:flutter/material.dart';

class NewCounterPage extends StatefulWidget {
  @override
  _NewCounterPageState createState() => _NewCounterPageState();
}

class _NewCounterPageState extends State<NewCounterPage> {
  TextEditingController _controller;
  void initState() {
    _controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New Counter"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          TextField(
            controller: _controller,
            onSubmitted: (text)
            {
              Navigator.of(context).pop(Counter(count: 0, word: text));
            },
          ),
          FlatButton(
            child: Text("Save"),
            onPressed: ()
            {
              Navigator.of(context).pop(Counter(count: 0, word: _controller.text));
            },
          ),
        ],
      ),
    );
  }
}
