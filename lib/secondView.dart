import 'package:flutter/material.dart';

import './model.dart';

class SecondView extends StatelessWidget {
  final textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('TIG169 TODO LIST')
      ),

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

Widget _textField() { //ett textfält där användaren kan fylla i en ny uppgift som ska göras
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
      controller: textEditingController
    ),
  );
}

Widget _addRow(BuildContext context) { //en knapp som låter användaren lägga till en to do i listan på hemvyn
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      FlatButton(
        onPressed: () {
          Navigator.pop( //användaren skickas tillbaka till hemvyn när knappen trycks
            context, Task(title: textEditingController.text, done: false));
        },
        child: Text('Add +')
      )
    ]
  );
}}