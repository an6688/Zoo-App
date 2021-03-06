// app.dart
// File created by Jordan Clark
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zoo_app/controller/iControllerView.dart';

class AnimalListPage extends StatefulWidget{
  AnimalListPage({Key key, @required this.controller}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".
  final IControllerView controller;

  Widget _animalButton(BuildContext context, String name, int animalId)
  {
    return RaisedButton(
      child: Text(name),
      autofocus: false,
      onPressed: () {
        controller.goToAnimalPage(context, animalId);
      },
    );
  }

  List<Widget> _displayAnimals(BuildContext context, String searchTerm)
  {
    var animals = searchTerm != null ? controller.searchAnimals(searchTerm) : controller.getAllAnimals();
    var buttons = List<Widget>();
    for (var animal in animals)
    {
      buttons.add(_animalButton(context, animal.commonName, animal.animalId));
    }
    return buttons;
  }

  @override
  State<StatefulWidget> createState() => AnimalListPageState();

}

class AnimalListPageState extends State<AnimalListPage>
{
  String searchTerm;

  void _changeSearchTerm(String text) {
    setState(() {
      searchTerm = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    var listItems = <Widget>[
      TextField(onChanged: _changeSearchTerm, 
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: "Search",
          icon: Icon(Icons.search),
        ),
      )
    ];
    listItems.addAll(widget._displayAnimals(context, searchTerm));
    listItems.add(widget._animalButton(context, "Nonexistant animal", -1));
    return Scaffold(
      appBar: AppBar(
        title: Text("Animal List"),
      ),
      body: Center(
        child: ListView(
          children: listItems
        ),
      ),
    );
  }
}