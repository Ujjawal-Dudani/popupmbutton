import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _State createState() => _State();
}

enum Animals{Cat, Dog, Bird, Lizard, Fish}

class _State extends State<MyApp> {

  Animals _selected = Animals.Cat;
  String _value = 'Make a Selection';
  final List<PopupMenuEntry<Animals>> _items = <PopupMenuEntry<Animals>>[];


  @override
  void initState() {
    for(Animals animal in Animals.values) {
      _items.add(PopupMenuItem(
        child: Text(_getDisplay(animal),),
        value: animal,
      ));
    }
  }

  void _onSelected(Animals animal) {
    setState((){
      _selected = animal;
      _value = 'You Selected ${_getDisplay(animal)}';
    });
  }

  String _getDisplay(Animals animal) {
    int index = animal.toString().indexOf('.');
    index++;
    return animal.toString().substring(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Name here'),
      ),
      body: Container(
          padding: const EdgeInsets.all(32.0),
          child: Center(
            child: Row(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(_value),
                ),
                PopupMenuButton<Animals>(
                    child:  const Icon(Icons.input),
                    initialValue: Animals.Cat,
                    onSelected: _onSelected,
                    itemBuilder: (BuildContext context) {
                      return _items;
                    }
                )
              ],
            ),
          )
      ),
    );
  }


}