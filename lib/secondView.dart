import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './model.dart';

//Skapar en klass för nästa vy, SecondView
class SecondView extends StatelessWidget {
  final textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('TIG169 TODO LIST')
      ),

      //SecondView innehåller en text field och en add knapp
      body: Center(
        child: Column(
          children: [
            _textField(),
            Container(
              height: 15
            ),
            _addRow(context)
          ],
        ),
      )
    );
  }

//Textfield låter användaren fylla i en ny uppgift som ska göras
Widget _textField() {
  return Container(
    margin: EdgeInsets.only(
      left: 20,
      right: 20,
      top: 70,
    ),
    child: TextField( 
      decoration: InputDecoration(
        hintText: 'What do you need to do?',
      ),
      controller: textEditingController //Uppdaterar värdet av textfield och notifierar listeners när användaren fyller i en ny uppgift
    ),
  );
}

//addrow låter användaren lägga till nya uppgifter
Widget _addRow(BuildContext context) {   
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      FlatButton(
        onPressed: () {
          Provider.of<MyState>(
            context,
            listen: false).addTask( //anropar addTask när användaren trycker på add knappen
              Task(
                task: textEditingController.text
              )
            );
          Navigator.popAndPushNamed(context, "/"); //går tillbaka till hemvyn när användaren trycker på add knappen
        },
        child: Text('Add +')
      )
    ]
  );
}}