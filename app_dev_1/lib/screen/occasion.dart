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
        backgroundColor: Colors.black87,
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '${questions[1]} for ${widget.answer}?',
              style: const TextStyle(fontSize: 25),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 120,
                  height: 50,
                  child: RaisedButton(
                    color: Colors.black,
                    child: const Text(
                      'Anniversary',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      answer = 'anniversary';
                      occasionSelected();
                    },
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                SizedBox(
                  width: 120,
                  height: 50,
                  child: RaisedButton(
                    color: Colors.black,
                    child: const Text(
                      'Graduation',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      answer = 'graduation';
                      occasionSelected();
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 120,
                  height: 50,
                  child: RaisedButton(
                    color: Colors.black,
                    child: const Text(
                      'Wedding',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      answer = 'wedding';
                      occasionSelected();
                    },
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                SizedBox(
                  width: 120,
                  height: 50,
                  child: RaisedButton(
                    color: Colors.black,
                    child: const Text('Birthday',
                      style: TextStyle(color: Colors.white),),
                    onPressed: () {
                      answer = 'birthday';
                      occasionSelected();
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
