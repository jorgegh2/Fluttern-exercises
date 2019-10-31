import 'package:exam/DataInfo/CounterClass.dart';
import 'package:exam/DataInfo/CounterList.dart';
import 'package:exam/Pages/NewCounterPage.dart';
import 'package:flutter/material.dart';

class CounterListPage extends StatefulWidget {
  @override
  _CounterListPageState createState() => _CounterListPageState();
}

class _CounterListPageState extends State<CounterListPage> {
  CounterList _countList;
  @override
  void initState() {
    _countList = CounterList();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text("Counter List"),
            FlatButton(
              child: Icon(Icons.restore, color: Colors.white),
              onPressed: () {
                setState(() {
                  _countList.ResetAllCounters();
                });
              },
            ),
          ],
        ),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemCount: _countList.GetNumberCounters(),
        itemBuilder: (context, i) {
          final Counter counter = _countList.GetCounterByIndex(i);
          return Card(
            child: InkWell(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              onTap: () {
                setState(() {
                  ++counter.count;
                });
              },
              onLongPress: () {
                setState(() {
                  --counter.count;
                });
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  SizedBox(height: 25,),
                  ListTile(
                    title: Center(
                      child: Text(
                        "${counter.count}",
                        style: TextStyle(fontSize: 42),
                      ),
                    ),
                  ),
                  Spacer(),
                  Container(
                    padding: EdgeInsets.all(5),
                  child: Center(child: Text(counter.word)),
                  color: Colors.blue.withAlpha(50)
                ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context)
              .push(
            MaterialPageRoute(
              builder: (_) => NewCounterPage(),
            ),
          )
              .then((count) {
            if (count != null) {
              _countList.AddCounter(count);
            }
          });
        },
      ),
    );
  }
}
