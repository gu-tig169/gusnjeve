import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //Sätter appens tema till en blågrå färgskala och anpassa appen visuellt till plattformen den används på
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      //Sätter MainView som appens hemskärm
      home: MainView(),
    );
  }
}

class MainView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Skapar en appbar med titel och en menyknapp
      appBar: AppBar(
        centerTitle: true,
        title: Text('TIG169 TODO LIST'),
        actions: [
          PopupMenuButton<String>(
            onSelected: (val) {},
            itemBuilder: (BuildContext context) {
              //Under menyknappen kan användaren filtrera mellan all, done och undone (endast visuellt för tillfället)
              return {'All', 'Done', 'Undone'}.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            }
          )
        ],
        ),

      //Skapar en add knapp för att lägga till nya to do's, knappen tar användaren vidare till nästa vy
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
          MaterialPageRoute(builder: (context) => SecondView()));
        },
        child: Icon(Icons.add),
      ),

      //Kolumner av checkboxes och användarens to do's (endast visuellt för tillfället)
      body: Column(
        children: [
          Container(height: 20),
          _checkboxRow(),
          Divider(color: Colors.grey),
          _checkboxRow(),
          Divider(color: Colors.grey),
          _checkboxRow(),
          Divider(color: Colors.grey),
        ],
      ),
    );
  }

  //Definierar vad en _checkboxRow innehåller
  //En checkbox, en text och en deleteknapp för att ta bort en to do (endast visuellt för tillfället)
  Widget _checkboxRow() {
    return Row(
      children: [
        Checkbox(
          value: false,
          onChanged: (val) {}
        ),
        Text(
          'To do',
           style: TextStyle(fontSize: 20),
        ),
        Spacer(),
        RawMaterialButton(
          onPressed: () {},
          child: Icon(
            Icons.clear,
            size: 20.0,
          ),
          shape: CircleBorder(),
        )
    ],
    );
  }
}

//Skapar en klass för nästa vy, SecondView
class SecondView extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('TIG169 TODO LIST')
      ),

      //SecondView innehåller en text field där användaren kan lägga in en ny to do (endast visuellt för tillfället)
      body: Column(
        children: [
          Container (
            margin: EdgeInsets.only (left: 20, right: 20, top: 70),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'What do you need to do?')
            ),
          ),
          Container(height: 25),
          //Skapar en knapp med _addRow för att lägga till användarens input (endast visuellt för tillfället)
          FlatButton(
            onPressed: () {}, 
            child: _addRow(),
          )
        ],
      )
    );
  }
}

//Definierar vad _addRow innehåller, en add ikon och text
Widget _addRow() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(Icons.add),
      Text('Add')
    ],
  );
}
