import 'package:flutter/material.dart';

class Task { //deklarerar variabler för en ny uppgift och vare sig den är utförd eller ej
  String task;
  bool done;

  Task ({this.task, this.done = false});
}

class MyState extends ChangeNotifier {
  List<Task>_list = [];
  List<Task> get list => _list;

  void addTask( Task item) { //addTask lägger till en uppgift i listan med hjälp av listeners
    _list.add(item);
    notifyListeners();
  }
  
  void removeTask(Task item) { //removeTask tar bort en uppgift från listan med hjälp av listeners
    _list.remove(item);
    notifyListeners();
  }

  List<Task> filteredList(String choices) { //filtrerar listan mellan Done eller Undone tasks
    if (choices == "Done") {
      return _list.where((item) => item.done == true).toList();
    } else if (choices == "Undone") {
      return _list.where((item) => item.done == false).toList();
    }
    return _list;
  }
}