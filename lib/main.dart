import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './secondView.dart';
import './model.dart';
import './todoList.dart';

void main() {
  var state = MyState();
  runApp((ChangeNotifierProvider(
    create: (context) => state,
    child: MyApp()
  )));
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

class MainView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MainViewState();
  }
}

class MainViewState extends State<MainView> {
  //deklarerar val av filtrering av listan
  final List<String> choices = ['All', 'Done', 'Undone'];
  String filterValue = 'All';

  Widget build(BuildContext context) {
    return Scaffold(
      //Skapar en appbar med titel och en menyknapp med filtrering
      appBar: AppBar(
        centerTitle: true,
        title: Text('TIG169 TODO LIST'),
        actions: [
          PopupMenuButton<String>(
            onSelected: (String value) {
              setState(() {
                filterValue = value; //listan visar alla tasks som standard
                print(filterValue);
              });
            },
            itemBuilder: (BuildContext context) {
              return choices.map((choices) =>
                PopupMenuItem(
                  value: choices,
                  child: Text(choices))
              ).toList();
            }
          )
        ],
      ),

      //Skapar en add knapp för att lägga till nya to do's, knappen tar användaren vidare till nästa vy
      floatingActionButton: FloatingActionButton(
        onPressed: () { Navigator.push(context,
          MaterialPageRoute(builder: (context) => SecondView()));
        },
        child: Icon(Icons.add),
      ),

      //Hemvyn består av en lista som dynamiskt byggs upp i klassen TodoList i todoList.dart
      body: Consumer <MyState>(
        builder:(context,state,child) =>
        TodoList(state.filteredList(filterValue))
      )
    );
  }
}