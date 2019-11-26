import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:task1jorgegemasherencia/plant.dart';
import 'package:path_provider/path_provider.dart';

class PlantListPage extends StatefulWidget {
  @override
  _PlantListPageState createState() => _PlantListPageState();
}

class _PlantListPageState extends State<PlantListPage> {
  List<Plant> _plantList;

  @override
  void initState() {
    _loadJson();
    // LoadList from json list
    super.initState();
  }
  Future<void> _loadJson() async {
    //not for this json
    //await Future.delayed(Duration(seconds: 5));
    //try {
    //  Directory dir = await getApplicationDocumentsDirectory();
    //  File file = File('${dir.path}/todo.json');
    //  String fileContents = await file.readAsString();
    //  List json = jsonDecode(fileContents);
    //  List<Todo> loaded = [];
    //  for (var elem in json) {
    //    loaded.add(Todo.fromJson(elem));
    //  }
    //  super.setState(() => _todos = loaded);
    //} catch (e) {
    //  print("ERROR: No he pogut llegir els todos!");
    //  super.setState(() => _todos = []);
    //}
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: ListView.builder(
      itemCount: 2,
      itemBuilder: (context, index)
      {
        return InkWell(
           child: ListTile(
             title: Text("test"),
             subtitle: Text("sub text"),
           ),
           onTap: (){},

         );
      },
     ),
    );
  }
}