import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'model.dart';

class TodoList extends StatefulWidget {
  final List<Task>list;
  TodoList(this.list);
     
  @override
  TodoListState createState() => TodoListState();   
}

class TodoListState extends State<TodoList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.list.length,
      itemBuilder:(context, index) => task(widget.list[index]));
  }

//bygger upp en lista där varje element består av en checkbox, en text(uppgift) och en radera knapp
Widget task(Task item) {
  return ListTile(
    leading: Checkbox(
        value: item.done,
        onChanged: (bool value) {
          setState(() { //uppdaterar checkboxens värde när användaren väljer att trycka på den
            item.done = value;  }
          ); 
        },
      ),
    title: Text( //texten som användaren har skrivit in i textfield läggs in i listan
      item.task,
      style: TextStyle(fontSize: 20)
    ),
    trailing: RawMaterialButton(
      onPressed: () {
        Provider.of<MyState>(context,
          listen: false
        ).removeTask(item); //anropar removeTask när användaren trycker på radera knappen
      },
      child: Icon(
        Icons.clear,
        size: 25.0,
      ),
      shape: CircleBorder(),
    )
  );  
 }
}