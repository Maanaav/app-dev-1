import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Album {
  final String ourSuggestion;

  const Album({
    required this.ourSuggestion,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      ourSuggestion: '${json['our_suggestion']}',
    );
  }
}

class Suggestion extends StatefulWidget {
  String recipient, occasion;
  Suggestion(this.recipient, this.occasion, {Key? key}) : super(key: key);

  @override
  _SuggestionState createState() => _SuggestionState();
}

class _SuggestionState extends State<Suggestion> {
  late Future<Album> futureAlbum;

  @override
  void initState() {
    futureAlbum = fetchSuggestion();
    super.initState();
  }

  Future<Album> fetchSuggestion() async {
    final response = await  http.get(Uri.parse('https://app-dev-1.herokuapp.com/get_fav/${widget.recipient}/${widget.occasion}'));
    if (response.statusCode == 200) {
      return Album.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
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
            Text('We suggestion for ${widget.recipient == 'him' ? 'his' : 'her'} ${widget.occasion}:',
              style: const TextStyle(fontSize: 25)),
            const SizedBox(height: 20),
            FutureBuilder<Album>(
              future: futureAlbum,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(snapshot.data!.ourSuggestion, style: const TextStyle(fontSize: 20),);
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }
                return const CircularProgressIndicator(color: Colors.black,);
              },
            )
          ],
        ),
      ),
    );
  }
}
