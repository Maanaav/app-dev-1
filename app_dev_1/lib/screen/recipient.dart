import 'package:app_dev_1/screen/occasion.dart';
import 'package:flutter/material.dart';

class recipient extends StatefulWidget {
  recipient({Key? key}) : super(key: key);

  @override
  _recipientState createState() => _recipientState();
}

class _recipientState extends State<recipient> {
  var questionIndex = 0;

  var questions = ['Select recipient', 'What is the occasion'];
  String answer = '';

  void recipientSelected() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => occasion(answer)));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
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
                questions[0],
                style: const TextStyle(fontSize: 25),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 100,
                    height: 100,
                    child: RaisedButton(
                      color: Colors.black,
                      padding: EdgeInsets.zero,
                      child:
                          const Icon(Icons.boy, size: 100, color: Colors.white),
                      onPressed: () {
                        answer = 'him';
                        recipientSelected();
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: 100,
                    height: 100,
                    child: RaisedButton(
                      color: Colors.black,
                      padding: EdgeInsets.zero,
                      child: const Icon(Icons.girl,
                          size: 100, color: Colors.white),
                      onPressed: () {
                        answer = 'her';
                        recipientSelected();
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
