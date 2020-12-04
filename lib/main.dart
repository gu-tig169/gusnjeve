import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './secondView.dart';
import './model.dart';
import './todoList.dart';

void main() {
  var state = MyState();
  state.getList();

  runApp((ChangeNotifierProvider(
    create: (context) => state,
    child: MyApp()
  )));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData( //bestäm appens tema
        primarySwatch: Colors.blueGrey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MainView(), //bestäm appens hemvy
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
      appBar: AppBar(
        centerTitle: true,
        title: Text('TIG169 TODO LIST'),
        actions: [
          PopupMenuButton<String>( //knapp för att filtrera tasks enligt all, done och undone
            onSelected: (String value) {
              setState(() {
                filterValue = value;
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

      floatingActionButton: FloatingActionButton( //knapp för att ta användaren vidare till nästa vy, där nya tasks kan läggas till
        onPressed: () async {
          var newTodo = await Navigator.push(context,
          MaterialPageRoute(builder: (context) => SecondView()));
          if (newTodo != null) {
            Provider.of<MyState>(context, listen: false).addTask(newTodo);
          }
        },
        child: Icon(Icons.add),
      ),

      body: Consumer <MyState>( //hemvyn består av en lista av to do's som dynamiskt byggs upp av användaren
        builder:(context,state,child) =>
        TodoList(state.filteredList(filterValue))
      )
    );
  }
}