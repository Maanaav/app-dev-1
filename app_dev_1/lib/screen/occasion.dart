import 'package:flutter/material.dart';

class occasion extends StatefulWidget {
  occasion({Key? key}) : super(key: key);

  @override
  _occasionState createState() => _occasionState();
}

class _occasionState extends State<occasion> {
  var questions = ['select recipient', 'what is the occasion?'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gift Suggestion App'),
      ),
      body: Container(
        child: Column(
          children: [
            Text(
              questions[1],
            ),
            RaisedButton(
              child: const Text('Birthday'),
              onPressed: () {},
            ),
            RaisedButton(
              child: const Text('Graduation'),
              onPressed: () {},
            ),
            RaisedButton(
              child: const Text('TEEN'),
              onPressed: () {},
            ),
            RaisedButton(
              child: const Text('KIDS'),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
