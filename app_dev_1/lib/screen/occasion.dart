import 'package:app_dev_1/screen/suggestion.dart';
import 'package:flutter/material.dart';

class occasion extends StatefulWidget {
  String answer;

  occasion(this.answer, {Key? key}) : super(key: key);

  @override
  _occasionState createState() => _occasionState();
}

class _occasionState extends State<occasion> {
  var questions = ['select recipient', 'what is the occasion'];
  String answer = '';

  void occasionSelected() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Suggestion(widget.answer, answer)));
  }

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
              '${questions[1]} for ${widget.answer}?',
            ),
            RaisedButton(
              child: const Text('Anniversary'),
              onPressed: () {
                answer = 'anniversary';
                occasionSelected();
              },
            ),
            RaisedButton(
              child: const Text('Graduation'),
              onPressed: () {
                answer = 'graduation';
                occasionSelected();
              },
            ),
            RaisedButton(
              child: const Text('Wedding'),
              onPressed: () {
                answer = 'wedding';
                occasionSelected();
              },
            ),
            RaisedButton(
              child: const Text('Birthday'),
              onPressed: () {
                answer = 'birthday';
                occasionSelected();
              },
            ),
          ],
        ),
      ),
    );
  }
}
