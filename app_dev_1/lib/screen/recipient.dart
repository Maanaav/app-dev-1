import 'package:app_dev_1/screen/occasion.dart';
import 'package:flutter/material.dart';

class recipient extends StatefulWidget {
  recipient({Key? key}) : super(key: key);

  @override
  _recipientState createState() => _recipientState();
}

class _recipientState extends State<recipient> {
  var questionIndex = 0;

  var questions = ['select recipient', 'what is the occasion?'];

  void recipientSelected() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => occasion()));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Gift Suggestion App'),
        ),
        body: Column(
          children: [
            Text(
              questions[0],
            ),
            RaisedButton(
              child: const Text('HIM'),
              onPressed: () {
                recipientSelected();
              },
            ),
            RaisedButton(
              child: const Text('HER'),
              onPressed: () {
                recipientSelected();
              },
            ),
            RaisedButton(
              child: const Text('TEEN'),
              onPressed: () {
                recipientSelected();
              },
            ),
            RaisedButton(
              child: const Text('KIDS'),
              onPressed: () {
                recipientSelected();
              },
            ),
          ],
        ),
      ),
    );
  }
}
