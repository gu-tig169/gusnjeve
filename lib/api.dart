import 'dart:convert';
import 'package:http/http.dart' as http;

import './model.dart';

const API_URL = 'https://todoapp-api-vldfm.ondigitalocean.app';
const API_KEY = 'c9bc38bc-8cc2-4db6-9135-643e8b8d1606';

class Api { //klass för att hantera kommunikation med ett API och lagra data på en server
  static Future addTask(Task task) async {
    print(task);
    Map<String, dynamic> json = Task.toJson(task);
    var bodyString = jsonEncode(json);
    print(json);
    await http.post(
      '$API_URL/todos?key=$API_KEY',
      body: bodyString,
      headers: {'Content-Type': 'application/json'},
    );
    print('done');
  }

  static Future finishTask(Task task) async {
    print (task);
    Map<String, dynamic> json = Task.toJson(task);
    var bodyString = jsonEncode(json);
    print(json);
    await http.put(
      '$API_URL/todos/${task.id}?key=$API_KEY',
      body: bodyString,
      headers: {'Content-Type': 'application/json'},
    );
    print('done');
  }

  static Future deleteTask(Task task) async {
    await http.delete('$API_URL/todos/${task.id}?key=$API_KEY');
  }

  static Future<List<Task>> getTasks() async {
    var response = await http.get('$API_URL/todos?key=$API_KEY');
    String bodyString = response.body;
    print(response.body);
    var json = jsonDecode(bodyString);
    print(json);

    return json.map<Task>((data) {
      return Task.fromJson(data);
    }).toList();
  }
}