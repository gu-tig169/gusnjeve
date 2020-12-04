import 'package:flutter/material.dart';

import './api.dart';

class Task { //en klass för att hantera to do's; lägga till, ta bort och markera som färdiga
  String id;
  String title;
  bool done;

  Task ({this.id, this.title, this.done});

  static Map<String, dynamic> toJson(Task task) {
    return {
      'title': task.title,
      'done': task.done
    };
  }

  static Task fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'],
      title: json['title'],
      done: json['done']
    );
  }
}

class MyState extends ChangeNotifier {
  List<Task>_list = [];
  List<Task> get list => _list;

  Future getList() async {
    List<Task> list = await Api.getTasks();
    _list = list;
    notifyListeners();
  }

  void addTask(Task task) async {
    await Api.addTask(task);
    await getList();
  }
  
  void removeTask(Task task) async {
    await Api.deleteTask(task);
    await getList();
  }

  void finishTask(Task task) async {
    await Api.finishTask(task);
    await getList();
  }

  List<Task> filteredList(String choices) { //filtrerar listan mellan utförda, ej utförda eller alla uppgifter i listan
    if (choices == "Done") {
      return _list.where((task) => task.done == true).toList();
    } else if (choices == "Undone") {
      return _list.where((task) => task.done == false).toList();
    }
    return _list;
  }
}