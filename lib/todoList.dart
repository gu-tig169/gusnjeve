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
      itemBuilder:(context, index) => todoItem(widget.list[index]));
  }

Widget todoItem(Task task) { //varje element i listan på hemvyn består av en checkbox, en text och en radera knapp
  return ListTile(
    leading: Checkbox(
        value: task.done,
        onChanged: (change) {
          setState(() {
            task.done = change;
            Provider.of<MyState>(context,
            listen: false)
            .finishTask(task);
          }); 
        },
      ),
    title: Text(
      task.title,
      style: TextStyle(fontSize: 20)
    ),
    trailing: RawMaterialButton(
      onPressed: () {
        var state = Provider.of<MyState>(context, listen: false);
        state.removeTask(task);
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